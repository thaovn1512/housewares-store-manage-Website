package ptithcm.DAO;

import java.util.List;



import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.Brand;
@Transactional
@Repository
public class BrandDAOImpl implements BrandDAO{

	@Autowired
	SessionFactory factory;
	@Override
	public Brand findById(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
//		String hql="SELECT * FROM Brand WHERE id=:id";
//		Query query=session.(hql);
		
		Brand entity=(Brand) session.get(Brand.class, id);
		return entity;
	}

	@Override
	public List<Brand> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM Brand";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Brand> listBrand=query.list();
		return listBrand;
	}

	@Override
	public Brand insert(Brand entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Brand entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Brand delete(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Brand entity=(Brand) session.get(Brand.class, id);
		session.delete(entity);
		return entity;
	}
	
}
