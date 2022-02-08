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

import ptithcm.DAO.BrandDAO;
import ptithcm.Entity.Admin;
import ptithcm.Entity.Brand;
import ptithcm.Entity.Users;
@Transactional
@Controller
@RequestMapping("admin/brand/")
public class BrandManager {
	@Autowired
	BrandDAO dao;
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		Brand brand=new Brand();
		model.addAttribute("brand",brand);
		
		return "admin/brand";		
	}
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Brand brand=new Brand();
		model.addAttribute("brand",brand);
		return "admin/brand";		
	}
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	
	public String insert(@ModelAttribute("brand")Brand brand,ModelMap model) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
	
		
		
		// kiem tra su ton tai cua nhãn hiệu
				String hql = "FROM Brand WHERE id = :ten";
				Query q  = session.createQuery(hql);
				q.setParameter("ten", brand.getId());
				Brand b= (Brand)q.uniqueResult();		
				//Nếu chưa tồn tại trong csdl thì thêm mới
				if(b==null) {
					
						try {
							
							session.save(brand);
							tr.commit();	
							model.addAttribute("message","Thêm mới thành công!");
							return "redirect:/admin/brand/insert.htm";
						} catch (Exception e) {
							tr.rollback();
							model.addAttribute("message","Thêm mới thất bại!");
						}
						finally {
							session.close();
						}
						
					
					return "admin/brand";
				}
				// Nhãn hiệu đã tồn tại thì chỉnh sửa
				else {		
					try {
					
						b.setName(brand.getName());
						session.update(b);
						tr.commit();
						model.addAttribute("message","Cập nhật thành công!");
						return "redirect:/admin/brand/insert.htm";
					} catch (Exception e) {
						tr.rollback();
						model.addAttribute("message","Cập nhật thất bại!");
					}
					finally {
						session.close();
					}
							
					return "admin/brand";
				}
		}
		
		
	@RequestMapping(value="edit/{name}",params = "btn-sua")
	public String update(ModelMap model, @PathVariable("name")int id) {
		Session s = factory.getCurrentSession();
		String hql = "FROM Brand where id = :cid";
		Query q = s.createQuery(hql);
		q.setParameter("cid",id);
		Brand b = (Brand)q.uniqueResult();
		model.addAttribute("brand", b);	
		
		return "admin/brand";
	}
	
	@RequestMapping(value="delete/{id}",params = "btn-xoa")
	public String delete(ModelMap model,@PathVariable("id")int id) {
		Session s = factory.openSession();
		String hql = "FROM Brand where id = :cid";
		Query q = s.createQuery(hql);
		q.setParameter("cid",id);
		Brand b = (Brand)q.uniqueResult();
		Transaction t = s.beginTransaction();
		try {
			s.delete(b);
			t.commit();
			model.addAttribute("message","Xóa thành công!");
			
		} catch (Exception e) {
			model.addAttribute("message","Xóa thất bại!");
			t.rollback();
		}
		finally {
			s.close();
		}	
		return "redirect:/admin/brand/index.htm";
	}
}
