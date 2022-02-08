package ptithcm.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

@Controller
@RequestMapping("admin/order/")
public class OrderManage {
	@Autowired
	BillDAO bdao;
	@Autowired
	BillDetailDAO ddao;
	@Autowired
	ProductDAO pdao;
	//Danh sách đơn đặt hàng của user
		@RequestMapping(value="index", method = RequestMethod.GET)
		public String listOrder(ModelMap model,HttpSession session) {
			Users user=(Users) session.getAttribute("user");
			List<Bill> listBill=bdao.findAll();
			Map<Product,Integer> dsP=null;
			//model.addAttribute("dsDonHang", dsDonHang);
			Map<Bill,Map<Product,Integer>> dsDonHang = new HashMap<Bill, Map<Product,Integer>>();
			for (Bill b : listBill) {
//				hql="FROM CTDH WHERE dh_ID =:idDH";
//				q=s.createQuery(hql);
//				q.setParameter("idDH",donHang.getId());
				
				List<BillDetail> dsDetails = ddao.findByBill(b);
				dsP = new HashMap<Product,Integer>();
				for (BillDetail p : dsDetails) {
//					hql="FROM SanPham WHERE id =:ids";
//					q=s.createQuery(hql);
//					q.setParameter("ids", sp.getSp_ID());
					
					dsP.put(pdao.findById(p.getProduct().getId()),p.getQuantity());
				}
				dsDonHang.put(b,dsP);
			model.addAttribute("listOrder",dsDonHang);	
			
		}
			return "admin/order";
		}
		
		@RequestMapping(value="confirm/{id}",params = "btn-xacnhan")
		public String xacNhanDonHang(@PathVariable("id")int id) {
			Bill bill=bdao.findById(id);
			bill.setStatus(true);
			bdao.update(bill);
			return "redirect:/admin/order/index.htm";
		}
		@RequestMapping(value="confirm/{id}",params = "btn-xoa")
		public String xoaDonHang(@PathVariable("id")int id,ModelMap model) {
			Bill bill=bdao.findById(id);
			List<BillDetail> listDetails=ddao.findByBill(bill);
			for(BillDetail b: listDetails) {
				ddao.delete(b.getId());
			}
			bdao.delete(id);
			
			return "redirect:/admin/order/index.htm";
		}
}
