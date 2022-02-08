package ptithcm.Controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.DAO.BillDAO;
import ptithcm.DAO.BillDetailDAO;
import ptithcm.DAO.ProductDAO;
import ptithcm.Entity.Bill;
import ptithcm.Entity.BillDetail;
import ptithcm.Entity.Product;
import ptithcm.Entity.Users;
import ptithcm.Model.Cart;

@Controller
@Transactional
@RequestMapping("/order/")
public class OrderController {
	@Autowired
	SessionFactory factory;
	@Autowired
	BillDAO dao;
	@Autowired
	BillDetailDAO bdao;
	@Autowired
	ProductDAO pdao;
	
	//Bấm thanh toán
	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public String Showcheckout(ModelMap model, HttpSession session) {
		model.addAttribute("bill", new Bill());
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");

		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		try {
			if (cartItems.size() != 0) {
				return "user/checkout";
			}
			t.commit();
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("message", "Không có sản phẩm trong giỏ hàng vui lòng thêm sản phẩm!");

		} finally {
			s.close();
		}
		return "user/cart";

	}


	// Hoàn tất đặt hàng
	@RequestMapping(value = "complete", method = RequestMethod.POST)
	public String Checkout(ModelMap model, HttpSession session, @ModelAttribute("bill") Bill bill,
			BindingResult errors) {
		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
		try {

			boolean check = true;
			// Kiểm tra tên
			if (bill.getCustomer().trim().isEmpty()) {
				check = false;
				errors.rejectValue("customer", "bill", "Tên khách hàng không được bỏ trống!");
			} else if (!bill.getCustomer().trim().matches("\\D+")) {
				check = false;
				errors.rejectValue("customer", "bill", "Tên không hợp lệ!");
			} else if (bill.getEmail().trim().isEmpty()) {
				check = false;
				errors.rejectValue("email", "bill", "Email không được để trống");
			} else if (!bill.getEmail().trim().matches("\\w+@\\w+(\\.\\w+)+")) {
				check = false;
				errors.rejectValue("email", "bill", "Email không hợp lệ");
			}
			// Kiểm tra số điện thoại
			else if (bill.getPhone().trim().isEmpty()) {
				check = false;
				errors.rejectValue("phone", "bill", "Số điện thoại không được để trống!");
			} else if (bill.getPhone().trim().matches("\\d{10}")) {
				check = false;
				errors.rejectValue("phone", "bill", "Số điện thoại không hợp lệ!");
			}

			// Kiểm tra địa chỉ
			else if (bill.getAddress().trim().isEmpty()) {
				check = false;
				errors.rejectValue("address", "bill", "Địa chỉ không được để trống!");
			}
			if (check) {
				Collection<Cart> list = cartItems.values();
				List<BillDetail> details = new ArrayList<BillDetail>();
				for (Cart c : list) {
					Product p=pdao.findById(c.getProduct().getId()); //Lấy ra lần lượt các sản phẩm trong giỏ
					p.setPurchased(p.getPurchased()+c.getQuantity()); //Cập nhật lại số sản phẩm đã bán
					pdao.update(p);
					BillDetail dt = new BillDetail();
					dt.setBill(bill);
					dt.setProduct(c.getProduct());
					dt.setQuantity(c.getQuantity());
					details.add(dt);// Thêm chi tiết đơn hàng vào ds chi tiết đơn hàng
				}
				Users user = (Users) session.getAttribute("user");
				bill.setEmail(user.getEmail());
				bill.setUser(user);
				bill.setDayCreate(new Date()); // Chọn ngày hôm nay làm ngày lập bill
				bill.setBillDetails(details);
				bill.setStatus(false);
				bill.setTotal((Long) session.getAttribute("myCartTotal"));
				dao.create(bill, details);// Tạo đơn hàng và chi tiết đơn hàng
				cartItems.clear();
				session.removeAttribute("myCartItems");
				session.removeAttribute("myCartTotal");
				session.removeAttribute("myCartNum");
				t.commit();
				model.addAttribute("message", "Đặt hàng thành công!!!");
			}

		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("message", "Đặt hàng không thành công!");

		} finally {
			s.close();
		}

		return "user/checkout";
	}
	
	
	
	//Danh sách đơn đặt hàng của user
	@RequestMapping(value="list-order", method = RequestMethod.GET)
	public String listOrder(ModelMap model,HttpSession session) {
		Users user=(Users) session.getAttribute("user");
		List<Bill> listBill=dao.findByUser(user);
		model.addAttribute("listBill",listBill);
		
		return "user/list-order";
	}
	
	//Chi tiết đơn hàng
	@RequestMapping(value="detail/{id}", method = RequestMethod.GET)
	public String detailBill(ModelMap model,HttpSession session,@PathVariable("id")Integer id) {
		Users user=(Users) session.getAttribute("user");
		Bill bill=dao.findById(id);
		List<BillDetail> listDetail=bdao.findByBill(bill);
		model.addAttribute("bill",bill);
		model.addAttribute("listDetail",listDetail);
		return "user/order-detail";
	}

}
