package ptithcm.Controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.websocket.server.PathParam;

import org.hibernate.Query;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.DAO.ProductDAO;
import ptithcm.Entity.Brand;
import ptithcm.Entity.Category;
import ptithcm.Entity.Product;


@Transactional
@Controller
@RequestMapping("admin/product/")
public class ProductManager {
	@Autowired
	SessionFactory factory;
	@Autowired
	ProductDAO dao;
	
	
	@Autowired
	ServletContext context;
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		Product product=new Product();
		model.addAttribute("product",product);
		
		return "admin/product_Admin";		
	}
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Product product=new Product();
		model.addAttribute("product",product);
		return "admin/product_Admin";		
	}
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	
	public String insert(@ModelAttribute("product")Product product, @RequestParam("photo")MultipartFile image,ModelMap model,BindingResult errors) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		
		
		String tenHinhAnh = image.getOriginalFilename();			
		String path = context.getRealPath("resources/user/img/product/"+image.getOriginalFilename());					

		
		
		// kiem tra su ton tai cua san pham 
				String hql = "FROM Product WHERE id = :ten";
				Query q  = session.createQuery(hql);
				q.setParameter("ten", product.getId());
				Product sp1= (Product)q.uniqueResult();		
				// nếu sản phẩm chưa tồn tại thì thêm mới
				if(sp1==null) {
					// nếu chưa có file thì thêm
					if(image.isEmpty()) {
						model.addAttribute("message","Vui lòng thêm file");
						return "admin/product_Admin";
					} else if (product.getName().trim().isEmpty()) {
						
						errors.rejectValue("name","product", "Tên không được để trống!");
					}  else if (product.getPrice().toString().trim().isEmpty()) {
						
						errors.rejectValue("price","product", "Giá không được để trống!");
					}  else if (product.getQuantity().toString().trim().isEmpty()) {
						
						errors.rejectValue("quantity","product", "Số lượng không được để trống!");
					}  else if (product.getDescription().trim().isEmpty()) {
						
						errors.rejectValue("description","product", "Mô tả không được để trống!");
					} 
					 else if (product.getInformation().trim().isEmpty()) {
							
							errors.rejectValue("information","product", "Thông tin sản phẩm không được để trống!");
						} 
					else {
						try {
							image.transferTo(new File(path));	
							product.setDateCreate(new Date())	;
							product.setImage(tenHinhAnh);
							if(product.getQuantity()>0) {
								product.setStatus(true);
							}else {
								product.setStatus(false);
							}
							product.setPurchased(0);
							session.save(product);
							tr.commit();				
							return "redirect:/admin/product/insert.htm";
						} catch (Exception e) {
							tr.rollback();
							model.addAttribute("message","Thêm mới thất bại");
						}
						finally {
							session.close();
						}
						
					}
					return "admin/product_Admin";
				}
				// sản pham da ton thì chỉnh sủa lại thông tin
				else {		
					try {
						if(!image.isEmpty()) {
							File f = new File(context.getRealPath("resources/user/img/product/"+product.getImage()));
							f.delete();
							image.transferTo(new File(path));			
							sp1.setImage(tenHinhAnh);
						}
						if (product.getPrice().toString().trim().isEmpty()) {
							
							errors.rejectValue("price","product", "Giá không được để trống!");
						}  else if (product.getQuantity().toString().trim().isEmpty()) {
							
							errors.rejectValue("quantity","product", "Số lượng không được để trống!");
						}  else if (product.getDescription().trim().isEmpty()) {
							
							errors.rejectValue("description","product", "Mô tả không được để trống!");
						} 
						 else if (product.getInformation().trim().isEmpty()) {
								
								errors.rejectValue("information","product", "Thông tin sản phẩm không được để trống!");
							} else {
						sp1.setName(product.getName());
						sp1.setBrand(product.getBrand());
						sp1.setCategory(product.getCategory());
						sp1.setPrice(product.getPrice());
						sp1.setDiscount(product.getDiscount());
						sp1.setDescription(product.getDescription());
						sp1.setInformation(product.getInformation());
						sp1.setQuantity(product.getQuantity());
						if(sp1.getQuantity()>0) {
							sp1.setStatus(true);
						}else {
							sp1.setStatus(false);
						}
						sp1.setPurchased(0);
						session.update(sp1);
						tr.commit();			
						model.addAttribute("message","Cập nhật sản phẩm thành công");
						return "redirect:/admin/product/insert.htm";
							}
					} catch (Exception e) {
						tr.rollback();
						model.addAttribute("message","Cập nhật sản phẩm thất bại");
					}
					finally {
						session.close();
					}
							
					return "admin/product_Admin";
				}
		}
		
		
	@RequestMapping(value="update/{name}",params = "btn-sua")
	public String update(ModelMap model, @PathVariable("name")int id) {
		Session s = factory.getCurrentSession();
		String hql = "FROM Product where id = :pd";
		Query q = s.createQuery(hql);
		q.setParameter("pd",id);
		Product pd = (Product)q.uniqueResult();
		model.addAttribute("product", pd);	
		
		return "admin/product_Admin";
	}
	
	@RequestMapping(value="delete/{id}",params = "btn-xoa")
	public String delete(ModelMap model,@PathVariable("id")int id) {
		Session s = factory.openSession();
		String hql = "FROM Product where id = :pd";
		Query q = s.createQuery(hql);
		q.setParameter("pd",id);
		Product pd = (Product)q.uniqueResult();
		Transaction t = s.beginTransaction();
		try {
			s.delete(pd);
			t.commit();
			model.addAttribute("message","Xóa thành công");
			
		} catch (Exception e) {
			model.addAttribute("message","Xóa không thành công");
			t.rollback();
		}
		finally {
			s.close();
		}	
		return "redirect:/admin/product/index.htm";
	}
	//loáº¡i
	@ModelAttribute("loai") 
	  public List<Category> nhanLoai()
	  { 
		  Session s = factory.getCurrentSession();
		  String hql = "FROM Category";
		  Query q= s.createQuery(hql);		  
		  List<Category> listCategory = q.list();
		return listCategory; 
	  } 
	  //ds nhan hiá»‡u
	  @ModelAttribute("nhanHieu") 
	  public List<Brand> nhanHieu()
	  { 
		  Session s = factory.getCurrentSession();
		  String hql = "FROM Brand";
		  Query q= s.createQuery(hql);		  
		  List<Brand> listBrand = q.list();
		return listBrand; 
	  } 
	
}
