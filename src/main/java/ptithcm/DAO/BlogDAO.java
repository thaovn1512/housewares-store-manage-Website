package ptithcm.DAO;

import java.util.List;

import ptithcm.Entity.Blog;

public interface BlogDAO {
	Blog findById(Integer id);
	List<Blog> findAll();
	Blog insert(Blog entity);
	void update(Blog entity);
	Blog delete(Integer id);
	List<Blog> findRecentNews();
	
}
