package ptithcm.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javassist.expr.NewArray;
import ptithcm.DAO.UsersDAO;
import ptithcm.Entity.Users;
@Controller
public class UserController {
	@Autowired
	UsersDAO dao;
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value = "information",method = RequestMethod.GET)
	public String information(ModelMap model,HttpSession session) {
		
//		Users user=(Users) session.getAttribute("user");
		model.addAttribute("user1",new Users());
		return "user/information";
	}
	@RequestMapping(value = "/changePassword",method = RequestMethod.GET)
	public String changePassword(ModelMap model,HttpSession session) {
		return "user/changepassword";
	}
	@RequestMapping(value = "/updateProfile",method = RequestMethod.GET)
	public String updateProfile(ModelMap model,HttpSession session) {
		
		Users user=(Users) session.getAttribute("user");
		model.addAttribute("user1",user);
		return "user/information";
	}
	@RequestMapping(value = "/updateProfile",method = RequestMethod.POST)
	public String doUpdateProfile(@ModelAttribute("user1")Users user1,HttpSession session
			, ModelMap model, BindingResult errors) {
		Session s=factory.openSession();
		Transaction t= s.beginTransaction();
		try {
		// biến kiểm tra validate
				boolean check = true;
				if (user1.getName().trim().isEmpty()) {
					check = false;
					errors.rejectValue("name","user1", "Tên không được để trống");
				} else if (!user1.getName().trim().matches("\\D+")) {
					check = false;
					errors.rejectValue("name","user1", "Tên không hợp lệ");
				}
				//Kiểm tra số điện thoại
				else if(user1.getPhone().trim().isEmpty()) {
					check=false;
					errors.rejectValue("phone", "user1","Số điện thoại không được để trống!");
				}
				else if(user1.getPhone().trim().matches("\\d{10}")) {
					check=false;
					errors.rejectValue("phone", "user1","Số điện thoại không hợp lệ!");
				}
				
				//Kiểm tra địa chỉ
				else if(user1.getAddress().trim().isEmpty()) {
					check=false;
					errors.rejectValue("address", "user1","Địa chỉ không được để trống!");
				}
				System.out.print("Check:"+check);
		Users user=(Users) session.getAttribute("user");
				if(check) {
		user.setAddress(user1.getAddress());
		user.setName(user1.getName());
		user.setPhone(user1.getPhone());
		user1.setEmail(user.getEmail());
		dao.update(user);
		session.setAttribute("user", user1);
		t.commit();
		model.addAttribute("message","Cập nhật thành công!");
				}
		}catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			model.addAttribute("message","Cập nhật thất bại!");
		}
				
		
		
		return "user/information";
		
		
	}
	//Đổi mật khẩu
	@RequestMapping(value = "/changePassword",method = RequestMethod.POST)
	public String changePW(ModelMap model,HttpSession session,
			@RequestParam("pw")String pw,
			@RequestParam("pw1")String pw1,
			@RequestParam("pw2")String pw2) {
		Users user=(Users) session.getAttribute("user");
		if(!BCrypt.checkpw(pw, user.getPassword())) {
			model.addAttribute("message","Mật khẩu hiện tại không đúng!");
		}
		else if(!pw1.equals(pw2)) {
			model.addAttribute("message","Nhập lại mật khẩu không khớp!");
		}
		else {
			user.setPassword(BCrypt.hashpw(pw1,BCrypt.gensalt(12)));
			dao.update(user);
			model.addAttribute("message","Đổi mật khẩu thành công!");
		}
		
		
		return "user/changepassword";
	}
	
}
