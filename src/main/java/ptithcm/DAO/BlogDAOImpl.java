package ptithcm.DAO;

import java.util.List;



import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.Blog;
import ptithcm.Entity.Blog;
@Transactional
@Repository
public class BlogDAOImpl implements BlogDAO{

	@Autowired
	SessionFactory factory;
	@Override
	public Blog findById(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
//		String hql="SELECT * FROM Blog WHERE id=:id";
//		Query query=session.(hql);
		
		Blog entity=(Blog) session.get(Blog.class, id);
		return entity;
	}

	@Override
	public List<Blog> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM Blog";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Blog> listBlog=query.list();
		return listBlog;
	}
	@Override
	public List<Blog> findRecentNews() {
		// TODO Auto-generated method stub
		String hql="FROM Blog b ORDER BY b.dayCreate DESC";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Blog> listBlog=query.list();
		return listBlog;
	}
	@Override
	public Blog insert(Blog entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Blog entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Blog delete(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Blog entity=(Blog) session.get(Blog.class, id);
		session.delete(entity);
		return entity;
	}
	
}
