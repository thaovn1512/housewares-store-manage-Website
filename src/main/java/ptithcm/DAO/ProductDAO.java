package ptithcm.DAO;

import java.util.Collection;
import java.util.List;

import ptithcm.Entity.Product;

public interface ProductDAO {
	
		Product findById(Integer id);
		List<Product> findAll();
		List<Product> findSale();
		List<Product> findAscending();
		List<Product> findDescending();
		List<Product> findLatestProduct();
		List<Product> findTopSale();
		List<Product> findSaleOffDesc();
		
		Product insert(Product entity);
		void update(Product entity);
		Product delete(Integer id);
		Collection<Product> findByCategory(Integer categoryId);
		Collection<Product> findByKeyWords(String keywords);
		Collection<Product> findByBrand(Integer brandId);
		
	

}
