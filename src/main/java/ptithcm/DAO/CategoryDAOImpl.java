package ptithcm.DAO;

import java.util.List;



import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.Category;
@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
	SessionFactory factory;
	@Override
	public Category findById(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
//		String hql="SELECT * FROM Category WHERE id=:id";
//		Query query=session.(hql);
		
		Category entity=(Category) session.get(Category.class, id);
		return entity;
	}

	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM Category";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Category> listCategory=query.list();
		return listCategory;
	}

	@Override
	public Category insert(Category entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Category entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Category delete(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Category entity=(Category) session.get(Category.class, id);
		session.delete(entity);
		return entity;
	}
	
}
