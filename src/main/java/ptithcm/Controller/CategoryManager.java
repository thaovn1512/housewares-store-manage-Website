package ptithcm.Controller;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.DAO.CategoryDAO;
import ptithcm.Entity.Admin;
import ptithcm.Entity.Category;
import ptithcm.Entity.Users;
@Transactional
@Controller
@RequestMapping("admin/category/")
public class CategoryManager {
	@Autowired
	CategoryDAO dao;
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		Category category=new Category();
		model.addAttribute("category",category);
		
		return "admin/category";		
	}
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Category category=new Category();
		model.addAttribute("category",category);
		return "admin/category";		
	}
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	public String insert(@ModelAttribute("category")Category category,ModelMap model) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
	
		
		// kiem tra su ton tai cua san pham 
				String hql = "FROM Category WHERE id = :ten";
				Query q  = session.createQuery(hql);
				q.setParameter("ten", category.getId());
				Category c= (Category)q.uniqueResult();		
				// nếu sản phẩm chưa tồn tại thì thêm mới
				if(c==null) {
					
						try {
							if(category.getName().trim().isEmpty()) {
							model.addAttribute("message","Tên loại không được bỏ trống!");
							}
							else {
							session.save(category);
							tr.commit();	
							model.addAttribute("message","Thêm mới thành công!");
							return "redirect:/admin/category/insert.htm";
							}
						} catch (Exception e) {
							tr.rollback();
							model.addAttribute("message","Thêm mới thất bại");
						}
						finally {
							session.close();
						}
						
					
					return "admin/category";
				}
				// sản pham da ton thì chỉnh sủa lại thông tin
				else {		
					try {
						if(category.getName().trim().isEmpty()) {
							model.addAttribute("message","Tên loại không được bỏ trống!");
							}
						else {
							c.setName(category.getName());
							session.update(c);
							tr.commit();
							model.addAttribute("message","Cập nhật thành công");
							return "redirect:/admin/category/insert.htm";
						}
						
					} catch (Exception e) {
						tr.rollback();
						model.addAttribute("message","Cập nhật thể loại thất bại");
					}
					finally {
						session.close();
					}
					return "admin/category";
							
				}
		}
		
		
	@RequestMapping(value="edit/{name}",params = "btn-sua")
	public String update(ModelMap model, @PathVariable("name")int id) {
		Session s = factory.getCurrentSession();
		String hql = "FROM Category where id = :cid";
		Query q = s.createQuery(hql);
		q.setParameter("cid",id);
		Category c = (Category)q.uniqueResult();
		model.addAttribute("category", c);	
		
		return "admin/category";
	}
	
	@RequestMapping(value="delete/{id}",params = "btn-xoa")
	public String delete(ModelMap model,@PathVariable("id")int id) {
		Session s = factory.openSession();
		String hql = "FROM Category where id = :cid";
		Query q = s.createQuery(hql);
		q.setParameter("cid",id);
		Category c = (Category)q.uniqueResult();
		Transaction t = s.beginTransaction();
		try {
			s.delete(c);
			t.commit();
			model.addAttribute("message","Xóa thành công");
			
		} catch (Exception e) {
			model.addAttribute("message","Xóa không thành công");
			t.rollback();
		}
		finally {
			s.close();
		}	
		return "redirect:/admin/category/index.htm";
	}
}
