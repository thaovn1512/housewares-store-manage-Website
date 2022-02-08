package ptithcm.Controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ptithcm.DAO.CategoryDAO;
import ptithcm.DAO.ProductDAO;
import ptithcm.Entity.Category;
import ptithcm.Entity.Product;
import ptithcm.Service.CookieService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pdao;
	CookieService cookie;
	
	@RequestMapping(value="/product/list-by-category/{cid}",method = RequestMethod.GET)
	public String listByCategory(ModelMap model,@PathVariable("cid")Integer categoryId,HttpServletRequest request) {
		
		Collection<Product> listProduct=pdao.findByCategory(categoryId);
		PagedListHolder pagedListHolder = new PagedListHolder((List) listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(6);
	
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
//		model.addAttribute("listProduct",listProduct);
		return "user/product";
		
	}
	
	@RequestMapping(value="/product/list-by-brand/{bid}",method = RequestMethod.GET)
	public String listByBrand(ModelMap model,@PathVariable("bid")Integer brandId,HttpServletRequest request) {
		
		Collection<Product> listProduct=pdao.findByBrand(brandId);
		PagedListHolder pagedListHolder = new PagedListHolder((List) listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(6);
	
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
//		model.addAttribute("listProduct",listProduct);
		return "user/product";
		
	}
//	@RequestMapping(value="/product/list-by-keywords",method = RequestMethod.GET,produces = "application/x-www-form-urlencoded;charset=UTF-8")
//	public String listByKeyword(ModelMap model,@RequestParam("keywords")String keywords) {
//		
//		Collection<Product> listProduct=pdao.findByKeyWords(keywords);
//		model.addAttribute("listProduct",listProduct);
//		return "user/product";
//		
//	}
	
	@RequestMapping("/product/list-by-keywords")
	public String listByKeyword(ModelMap model,@RequestParam("keywords")String keywords,HttpServletRequest request) {
		
		Collection<Product> listProduct=pdao.findByKeyWords(keywords);
		PagedListHolder pagedListHolder = new PagedListHolder((List) listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(6);
	
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
//		model.addAttribute("listProduct",listProduct);
		return "user/product";
	}
	
	
	//Sắp xếp
	//Tăng dần theo giá
	@RequestMapping("/product/ascending")
	public String ascendingProduct(ModelMap model,HttpServletRequest request) {
		
		List<Product> listProduct=pdao.findAscending();
		PagedListHolder pagedListHolder = new PagedListHolder((List) listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(6);
	
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
//		model.addAttribute("listProduct",listProduct);
		return "user/product";}
	
	//Giảm dần theo giá
	@RequestMapping("/product/descending")
	public String descendingProduct(ModelMap model,HttpServletRequest request) {
		
		List<Product> listProduct=pdao.findDescending();
		PagedListHolder pagedListHolder = new PagedListHolder((List) listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(6);
	
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
//		model.addAttribute("listProduct",listProduct);
		return "user/product";}
	
	//Sản phẩm mới nhất
	@RequestMapping("/product/latest")
	public String latestProduct(ModelMap model,HttpServletRequest request) {
		
		List<Product> listProduct=pdao.findLatestProduct();
		PagedListHolder pagedListHolder = new PagedListHolder((List) listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(6);
	
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
//		model.addAttribute("listProduct",listProduct);
		return "user/product";}
	
	//Sản phẩm bán chạy
	@RequestMapping("/product/bestseller")
	public String bestsellerProduct(ModelMap model,HttpServletRequest request) {
		
		List<Product> listProduct=pdao.findTopSale();
		PagedListHolder pagedListHolder = new PagedListHolder((List) listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(6);
	
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
//		model.addAttribute("listProduct",listProduct);
		return "user/product";}
	
	//Sản phẩm giảm giá(xếp giảm dần)
	@RequestMapping("/product/saleoff")
	public String saleoffProduct(ModelMap model,HttpServletRequest request) {
		
		List<Product> listProduct=pdao.findSaleOffDesc();
		PagedListHolder pagedListHolder = new PagedListHolder((List) listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(6);
	
		pagedListHolder.setPageSize(6);
		model.addAttribute("pagedListHolder", pagedListHolder);
//		model.addAttribute("listProduct",listProduct);
		return "user/product";}
	
	
	
	//Danh sách sản phẩm cùng loại với sản phẩm chọn
	@RequestMapping("/product/detail/{id}")
	public String detailProduct(ModelMap model,@PathVariable("id")Integer id) {
		Product product=pdao.findById(id);
		Collection<Product> listRelated=pdao.findByCategory(product.getCategory().getId());//lấy ra danh sách sản phẩm cùng loại dựa vào id
		model.addAttribute("product",product);
		model.addAttribute("listRelated",listRelated);
		return "user/product-details";
	}
	
	@ResponseBody
	@RequestMapping("/product/add-to-favo/{id}")
	public String addToFavorite(ModelMap model,@PathVariable("id")Integer id) {
		Cookie favo= cookie.read("favo");
		String value=id.toString();
		if(favo!=null) { // đã có cookie rồi chọn thêm
			value=favo.getValue();
			if(!value.contains(id.toString())) {
				value +=","+id.toString();
			}
		}
	
		cookie.create("favo", value, 30);
		return "ok";
	}
}
