package ptithcm.DAO;

import java.util.List;

import ptithcm.Entity.Brand;

public interface BrandDAO {
	Brand findById(Integer id);
	List<Brand> findAll();
	Brand insert(Brand entity);
	void update(Brand entity);
	Brand delete(Integer id);
	
}
