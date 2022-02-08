package ptithcm.Interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptithcm.DAO.BlogDAO;
import ptithcm.DAO.BrandDAO;
import ptithcm.DAO.CategoryDAO;
import ptithcm.DAO.ProductDAO;
import ptithcm.DAO.UsersDAO;
import ptithcm.Entity.Blog;
import ptithcm.Entity.Brand;
import ptithcm.Entity.Category;
import ptithcm.Entity.Product;
import ptithcm.Entity.Users;

@Component
public class ShareInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	CategoryDAO dao;
	@Autowired
	BrandDAO bdao;
	@Autowired
	ProductDAO pdao;
	@Autowired
	BlogDAO bldao;
	@Autowired
	UsersDAO udao;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		List<Users> listUser = udao.findAll();
		request.setAttribute("listUser", listUser);
		
		
		List<Product> listProduct = pdao.findAll();
		request.setAttribute("listProduct", listProduct);
		
		List<Category> listCategory = dao.findAll();
		request.setAttribute("categories", listCategory);

		List<Brand> listBrand = bdao.findAll();
		request.setAttribute("brands", listBrand);

		List<Product> listSale = pdao.findSale();
		request.setAttribute("listSale", listSale);

		List<Product> listLatest = pdao.findLatestProduct();
		request.setAttribute("listLatest", listLatest);

		List<Product> listBestseller = pdao.findTopSale();
		request.setAttribute("listBestseller", listBestseller);

		List<Blog> listBlog = bldao.findAll();
		request.setAttribute("listBlog", listBlog);
		List<Blog> listRecent = bldao.findRecentNews();
		request.setAttribute("listRecent", listRecent);
	}

}
