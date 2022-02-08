package ptithcm.DAO;

import java.util.List;

import ptithcm.Entity.Category;

public interface CategoryDAO {
	Category findById(Integer id);
	List<Category> findAll();
	Category insert(Category entity);
	void update(Category entity);
	Category delete(Integer id);
	
}
