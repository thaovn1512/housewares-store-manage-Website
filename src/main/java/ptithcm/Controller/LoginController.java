package ptithcm.Controller;

import java.util.Date;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ptithcm.DAO.UsersDAO;
import ptithcm.Entity.Admin;
import ptithcm.Entity.Users;
import ptithcm.Service.CookieService;
@Transactional
@Controller
public class LoginController {
	@Autowired
	SessionFactory factory;
//	@Autowired
//	CookieService cookie;

	@RequestMapping(value = "login",method = RequestMethod.GET)
	public String login(ModelMap model) {
		model.addAttribute("user",new Users());
		model.addAttribute("admin",new Admin());
		return "user/login";
	}
	
	//Đăng nhập
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute("user")Users user,HttpSession session,
			BindingResult errors) {

		// biến kiểm tra validate
		boolean check = true;
		if (user.getEmail().trim().isEmpty()) {
			check = false;
			errors.rejectValue("email","user", "Email không được để trống");
		} else if (!user.getEmail().trim().matches("\\w+@\\w+(\\.\\w+)+")) {
			check = false;
			errors.rejectValue("email","user", "Email không hợp lệ");
		}

		// kiểm tra định dạng mật khẩu không ít hơn 8 kí tư và mật khẩu không chứ khoảng
		// trắng
		if (user.getPassword().trim().isEmpty()) {
			check = false;
			errors.rejectValue("password","user", "Mật khẩu không được để trống");
		} else if (user.getPassword().trim().contains(" ")) {
			check = false;
			errors.rejectValue("password","user", "Mật khẩu không có khoảng trắng");
		} else if (!user.getPassword().trim().matches(".{8,}")) {
			check = false;
			errors.rejectValue("password","user", "Mật khẩu không dưới 8 kí tự");
		}
		if(check) {
			//Kiểm tra sự tồn tại trong csdl
//			Users users=dao.findById(user.getEmail());
			Session ss =factory.getCurrentSession();
			String hql="FROM Users u WHERE u.email = :e";
			String hql1 = "FROM Admin WHERE email =:e and password = :m";
			Query query=ss.createQuery(hql);
			Query query1 = ss.createQuery(hql1);
			query.setParameter("e", user.getEmail());
			query1.setParameter("e", user.getEmail());
			query1.setParameter("m", user.getPassword());
//			query.setParameter("pw", BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
			Users user1=(Users) query.uniqueResult();
			Admin admin=(Admin) query1.uniqueResult();
			if(!(user1==null)) {
				if(BCrypt.checkpw(user.getPassword(), user1.getPassword())) {
				 ((HttpSession) session).setAttribute("user", user1);
//				 String backUrl=(String) ((HttpSession) session).getAttribute("back-url");
//					if(backUrl!=null) {
//						return "redirect:/" +backUrl;
//					}
//					
				return "redirect:index.htm";}
				else {
					model.addAttribute("message","Sai mật khẩu!"); 
				}
			}
			else if(!(admin==null)) {
				 ((HttpSession) session).setAttribute("admin", admin);
					 return "redirect:admin/index.htm";
				
			}
			model.addAttribute("message","Tài khoản hoặc mật khẩu không chính xác"); 
//			else {
//				model.addAttribute("message", "Tài khoản hoặc mật khẩu không chính xác!");}
//				//Ghi nhớ tài khoản bằng cookie
//				if(rm==true) {
//					cookie.create("userId", user1.getEmail(), 30);
//					cookie.create("pass", user1.getPassword(), 30);
//				}
//				else {
//					cookie.delete("userId");
//					cookie.delete("pass");
//				}
//			
			
		}
		
		return "user/login";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return"redirect:index.htm";
	}
	
	//Đăng ký
	@RequestMapping(value="/signup",method = RequestMethod.GET)
	public String signup(ModelMap model) {
		model.addAttribute("user",new Users());
		model.addAttribute("admin",new Admin());
		return "user/signup";
	}
	
	@RequestMapping(value="/signup",method = RequestMethod.POST)
	public String signup(ModelMap model, @ModelAttribute("user")Users user,BindingResult errors) {
		Session session=factory.openSession();
		Transaction t= session.beginTransaction();
		try {
			// biến kiểm tra validate
			boolean check = true;
			if (user.getEmail().trim().isEmpty()) {
				check = false;
				errors.rejectValue("email","user", "Email không được để trống");
			} else if (!user.getEmail().trim().matches("\\w+@\\w+(\\.\\w+)+")) {
				check = false;
				errors.rejectValue("email","user", "Email không hợp lệ");
			}
			else {
				//Kiểm tra sự tồn tại của email trong csdl
				String hql="FROM Users WHERE email=:email";
				String hql1="FROM Admin WHERE email=:email";
				Query query=session.createQuery(hql);
				Query query1=session.createQuery(hql1);
				query.setParameter("email", user.getEmail());
				query1.setParameter("email", user.getEmail());
				if(query.uniqueResult()!=null || query1.uniqueResult()!=null) {
					check = false;
					errors.rejectValue("email","user", "Địa chỉ email đã được sử dụng!");
				}
			}

			// kiểm tra định dạng mật khẩu không ít hơn 8 kí tư và mật khẩu không chứ khoảng
			// trắng
			if (user.getPassword().trim().isEmpty()) {
				check = false;
				errors.rejectValue("password","user", "Mật khẩu không được để trống");
			} else if (user.getPassword().trim().contains(" ")) {
				check = false;
				errors.rejectValue("password","user", "Mật khẩu không có khoảng trắng");
			} else if (!user.getPassword().trim().matches(".{8,}")) {
				check = false;
				errors.rejectValue("password","user", "Mật khẩu không dưới 8 kí tự");
			}
			
			//Kiểm tra tên
			else if(user.getName().trim().equals("")) {
				check=false;
				errors.rejectValue("name", "user","Tên không được để trống!");
			}
			else if(!user.getName().trim().matches("\\D+")) {
				check=false;
				errors.rejectValue("name", "user","Tên không hợp lệ!");
			}
			
			//Kiểm tra số điện thoại
			else if(user.getPhone().trim().isEmpty()) {
				check=false;
				errors.rejectValue("phone", "user","Số điện thoại không được để trống!");
			}
			else if(user.getPhone().trim().matches("\\d{10}")) {
				check=false;
				errors.rejectValue("phone", "user","Số điện thoại không hợp lệ!");
			}
			
			//Kiểm tra địa chỉ
			else if(user.getAddress().trim().isEmpty()) {
				check=false;
				errors.rejectValue("address", "user","Địa chỉ không được để trống!");
			}
			
			
			if(check) {
				user.setDayCreated(new Date());// Chọn ngày hôm nay làm ngày tạo tài khoản
				user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
				session.save(user);
				t.commit();
				model.addAttribute("message", "Đăng ký thành công!");
				
			}
		}catch (Exception e) {
			t.rollback();
			model.addAttribute("message","Đăng ký thất bại!");
			
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		return "user/signup";
	}
	
	
	//Quên mật khẩu
	@Autowired
	JavaMailSender mailer;
	@RequestMapping(value="forgot-password",method = RequestMethod.GET)
	public String forgotPassword() {
		return "user/forgotpassword";
	}
	@RequestMapping(value="forgot-password",method = RequestMethod.POST)
	public String forgotPassword(ModelMap model,@RequestParam("email")String to) {
		//Kiểm tra validate
		boolean check=true;
		
		//Kiểm tra định dạng email
		if(to.trim().isEmpty()) {
			check=false;
			model.addAttribute("message","Email không được để trống!");
		}
		else if(!to.trim().matches("\\w+@\\w+(\\.\\w+)+")) {
			check=false;
			model.addAttribute("message","Email không hợp lệ!");
		}
			if(check) {
				try {
				Session session=factory.getCurrentSession();
				String hql="FROM Users u WHERE u.email= :email ";
				Query query=session.createQuery(hql);
				query.setParameter("email", to);
				Users user=(Users) query.uniqueResult();
				Random rd=new Random();
				int newPassword=rd.nextInt(99999999);
//				System.out.print(password);
				//Kiểm tra sự tồn tại của email cần khôi phục trong csdl
				if(user==null){
					model.addAttribute("message", "Tài khoản cần khôi phục không tồn tại!");
				}else {
					user.setPassword(BCrypt.hashpw(String.valueOf(newPassword), BCrypt.gensalt(12))); //Đặt lại mật khẩu là chuỗi random
					System.out.print(user.getPassword());
					String from = "n18ddcn209@student.ptithcm.edu.vn";			
					String subject="Web bán đồ gia dụng - Quên mật khẩu";
					String body="Mật khẩu của bạn là: <h3>"+newPassword+"</h3>";
					session.update(user); //Cập nhật lại user
					MimeMessage mail = mailer.createMimeMessage();
					//Sử dụng lớp trợ giúp
					MimeMessageHelper helper = new MimeMessageHelper(mail,"UTF-8");
					helper.setFrom(from,from);
					helper.setTo(to);
					helper.setReplyTo(from, from);
					helper.setSubject(subject);
//					mail.setContent(body,"text/html");
					helper.setText(body,true);
					
					//Gửi mail
					mailer.send(mail);
					model.addAttribute("message","Gửi email thành công !, Vui lòng kiểm tra hộp thư");
				}
				}catch (Exception e) {
					model.addAttribute("message", "Gửi thư thất bại!");
					// TODO: handle exception
				}
			}
		
		
		return "user/forgotpassword";
	}
}

