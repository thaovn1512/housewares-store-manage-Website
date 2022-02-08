package ptithcm.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import ptithcm.DAO.ProductDAO;
import ptithcm.Entity.Product;

@SessionScope // Cứ mỗi session sẽ có 1 bean giỏ hàng (scopedTarget.cartService)
public class CartService {
	@Autowired
	ProductDAO dao;

	Map<Integer, Product> map = new HashMap<>();

	public void addToCart(Integer id) { // Bỏ 1 sản phẩm vào giỏ hàng
		Product p = map.get(id);
		if (p == null) { // Trường hợp trong giỏ chưa có sp đó
			p = dao.findById(id);
			p.setQuantity(1);
			map.put(id, p); // Thêm sản phẩm đó vào giỏ

		} else { // Trường hợp trong giỏ đã có sp đó thì tăng số lượng
			p.setQuantity(p.getQuantity() + 1);
		}
	}

	public void remove(Integer id) { // Xóa 1 sản phẩm vào giỏ hàng
		map.remove(id);// xóa mặt hàng theo id ra khỏi giỏ hàng
	}

	public void update(Integer id, int quantity) { // Cập nhật số lượng giỏ hàng
		Product p = map.get(id);// Lấy được mặt hàng từ key id
		p.setQuantity(quantity);
	}

	public void clear(Integer id) { // Xóa tất cả sản phẩm ra giỏ hàng
		map.clear();
	}

	public int getCount() { // Lấy số lượng sản phẩm giỏ hàng
		Collection<Product> pro = this.getItems();
		int count = 0;
		for (Product p : pro) {
			count += p.getQuantity();
		}
		return count;
	}

	public double getAmount() { // Tổng tiền giỏ hàng
		Collection<Product> pro = this.getItems();
		double amount = 0;
		for (Product p : pro) {
			amount += (p.getQuantity() * p.getPrice() * (1 - p.getDiscount())); // Tổng tiền
		}
		return amount;
	}

	public Collection<Product> getItems() {
		return map.values(); // Tất cả mặt hàng trong giỏ
	}
}
