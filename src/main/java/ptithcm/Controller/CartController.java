package ptithcm.Controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptithcm.DAO.ProductDAO;
import ptithcm.Entity.Product;
import ptithcm.Entity.Users;
import ptithcm.Model.Cart;
import ptithcm.Service.CartService;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	ProductDAO dao;
	
	
	//Thay đổi số lượng sản phẩm trong input
	@ResponseBody
	@RequestMapping("/update/{id}/{quantity}")
	 public Object update(HttpSession session,@PathVariable("id") Integer id,@PathVariable("quantity") Integer quantity ) {
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
		Cart c = cartItems.get(id);// Lấy được mặt hàng từ key id
		Product p = dao.findById(id);// Lấy được sản phẩm từ key id
		p.setQuantity(p.getQuantity()-(quantity-c.getQuantity())); //Set lại số lượng khi có sự thay đổi trong giỏ hàng
		if(p.getQuantity()==0) {
			p.setStatus(false);
		}else {
			p.setStatus(true);
		}
		dao.update(p); // Cập nhật lại sản phẩm
		c.setQuantity(quantity); //Set lại số lượng giỏ hàng
		Object[] info= {count(cartItems),totalPrice(cartItems)};
		 return info;
	 }
	
	//Thêm sản phẩm vào giỏ hàng
	@RequestMapping(value = "/{id}",params = "btn-dat")
	public String order(ModelMap model,HttpSession session,@PathVariable("id")int id,HttpServletRequest request) {
		
//		cart.addToCart(id);
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Product product = dao.findById(id);
        if (product != null) {
            if (cartItems.containsKey(id)) {
                Cart item = cartItems.get(id);
                item.setProduct(product);
                item.setQuantity(item.getQuantity() + 1);
                product.setQuantity(product.getQuantity()-1); //Giảm số lượng sản phẩm khi thêm
                if(product.getQuantity()==0) {
        			product.setStatus(false);
        		}else {
        			product.setStatus(true);
        		}
                dao.update(product); //Cập nhật lại sản phẩm
                cartItems.put(id, item);
            } else {
                Cart item = new Cart();
                item.setProduct(product);
                item.setQuantity(1);
                product.setQuantity(product.getQuantity()-1);
                if(product.getQuantity()==0) {
        			product.setStatus(false);
        		}else {
        			product.setStatus(true);
        		}
                dao.update(product);
                cartItems.put(id, item);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", count(cartItems));
//		return "redirect:/product.htm#thanhtoan";
        return "redirect:" + request.getHeader("Referer"); //điều hướng đến trang hiện tại
	}
	
	
	//Tổng tiền trong giỏ
	 public long totalPrice(HashMap<Integer, Cart> cartItems) {
	        int count = 0;
	        for (Entry<Integer, Cart> list : cartItems.entrySet()) {
	            count += (list.getValue().getProduct().getPrice()-list.getValue().getProduct().getPrice()*list.getValue().getProduct().getDiscount()/100) * list.getValue().getQuantity();
	          
	        }
	        return count;
	    }
	 
	 //Số lượng sản phẩm trong giỏ
	 public int count(HashMap<Integer, Cart> cartItems) {
	        int count = 0;
	        for (Entry<Integer, Cart> list : cartItems.entrySet()) {
	            count += (list.getValue().getQuantity());
	          
	        }
	        return count;
	    }
	 
	 //View giỏ hàng
	 @RequestMapping(value = "/view",method = RequestMethod.GET)
		public String order(ModelMap model,HttpSession session) {
			HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
			 if (cartItems == null) {
		            cartItems = new HashMap<>();
		        }
		 	session.setAttribute("myCartItems", cartItems);
	        session.setAttribute("myCartTotal", totalPrice(cartItems));
	        session.setAttribute("myCartNum", count(cartItems));
			return "user/cart";
	 }
	 
	 //Xóa sản phẩm khỏi giỏ hàng
	 @RequestMapping(value="/remove/{id}",method = RequestMethod.GET)
	 public String deleteProduct(ModelMap model,HttpSession session,@PathVariable("id") int id) {
		 HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
	        Product product = dao.findById(id);
            Cart item = cartItems.get(id);
	        if (cartItems == null) {
	            cartItems = new HashMap<>();
	        }
	        if (cartItems.containsKey(id)) {
	            cartItems.remove(id);
	            product.setQuantity(product.getQuantity()+item.getQuantity()); //Tăng số lượng sản phẩm khi xóa sp khỏi giỏ hàng
	            if(product.getQuantity()==0) {
	    			product.setStatus(false);
	    		}else {
	    			product.setStatus(true);
	    		}
	            dao.update(product); //Cập nhật lại sản phẩm
	        }
	        session.setAttribute("myCartItems", cartItems);
	        session.setAttribute("myCartTotal", totalPrice(cartItems));
	        session.setAttribute("myCartNum", count(cartItems));
		 
		 return "user/cart";
	 }
	 //Xóa giỏ hàng
	 @RequestMapping(value="/delete",method = RequestMethod.GET)
	 public String deleteCart(ModelMap model,HttpSession session) {
		 
		 HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
		
	        for (Entry<Integer, Cart> list : cartItems.entrySet()) {
	        	Product p=dao.findById(list.getValue().getProduct().getId()); //Lấy ra lần lượt các sản phẩm
	            p.setQuantity(p.getQuantity()+list.getValue().getQuantity()); //Cập nhật lại số lượng sản phẩm sau khi xóa giỏ hàng
	            if(p.getQuantity()==0) {
	    			p.setStatus(false);
	    		}else {
	    			p.setStatus(true);
	    		}
	            dao.update(p);
	        }
	        cartItems.clear(); //Xóa tất cả sản phẩm ra khỏi giỏ
		 session.removeAttribute("myCartItems");
	        session.removeAttribute("myCartTotal");
	        session.removeAttribute("myCartNum");
		 return "user/cart";
	 }

	 
}
