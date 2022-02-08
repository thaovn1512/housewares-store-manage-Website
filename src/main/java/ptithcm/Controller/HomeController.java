package ptithcm.Controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.DAO.BlogDAO;
import ptithcm.DAO.ProductDAO;
import ptithcm.Entity.Blog;
import ptithcm.Entity.Product;
import ptithcm.Model.Cart;

@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;
	@Autowired
	BlogDAO bldao;
	@Autowired
	SessionFactory factory;

	@RequestMapping({"/","index"})
	public String index(ModelMap model) {
		
		return "user/index";
	}
	
	
	
	
	@RequestMapping(value="/product",method = RequestMethod.GET)
	public String product(ModelMap model,HttpServletRequest request) {
		List<Product> listProduct=pdao.findAll();
		PagedListHolder pagedListHolder = new PagedListHolder(listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(20);
	
		pagedListHolder.setPageSize(6);
//		model.addAttribute("listProduct",listProduct);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "user/product";
	}
//	@RequestMapping(value="/product-details",method = RequestMethod.GET)
//	public String productDetails() {
//		
//		return "user/product-details";
//	}
	
	
//	@RequestMapping(value="cart/",method = RequestMethod.GET)
//	public String cart() {
//		
//		return "user/cart";
//	}
	@RequestMapping(value="blog",method = RequestMethod.GET)
	public String blog() {
		
		return "user/blog";
	}
	@RequestMapping(value="blog/detail/{id}",method = RequestMethod.GET)
	public String blog_details(ModelMap model,@PathVariable("id")Integer id) {
		Blog blog=bldao.findById(id);
		
		model.addAttribute("blog",blog);
		return "user/blog-details";
	}

	@RequestMapping(value="contact",method = RequestMethod.GET)
	public String contact() {
		
		return "user/contact";
	}
}
