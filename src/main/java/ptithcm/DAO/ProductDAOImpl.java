package ptithcm.DAO;

import java.util.Collection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.Product;
import ptithcm.Entity.Product;

@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public Product findById(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Product entity=(Product) session.get(Product.class, id);
		return entity;
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM Product";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Product> listProduct=query.list();
		return listProduct;

	}
	@Override
	public List<Product> findSale() {
		// TODO Auto-generated method stub
		String hql="FROM Product p WHERE p.discount>0";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Product> listProduct=query.list();
		return listProduct;
		}
	
	@Override
	public List<Product> findAscending() {
		// TODO Auto-generated method stub
		String hql="FROM Product p ORDER BY p.price-p.price*p.discount/100 ASC";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Product> listProduct=query.list();
		return listProduct;
	}

	@Override
	public List<Product> findDescending() {
		// TODO Auto-generated method stub
		String hql="FROM Product p ORDER BY p.price-p.price*p.discount/100 DESC";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Product> listProduct=query.list();
		return listProduct;
	}

	@Override
	public List<Product> findLatestProduct() {
		// TODO Auto-generated method stub
		String hql="FROM Product p ORDER BY p.dateCreate DESC";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Product> listProduct=query.list();
		return listProduct;
	}
	@Override
	public List<Product> findTopSale() {
		// TODO Auto-generated method stub
		String hql="FROM Product p ORDER BY p.purchased DESC";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Product> listProduct=query.list();
		return listProduct;
	}
	@Override
	public List<Product> findSaleOffDesc() {
		// TODO Auto-generated method stub
		String hql="FROM Product p ORDER BY p.discount DESC";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Product> listProduct=query.list();
		return listProduct;
	}
	
	
	
	
	@Override
	public Product insert(Product entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Product entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public Product delete(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Product entity=(Product) session.get(Product.class, id);
		session.delete(entity);
		return entity;

	}

	@Override
	public Collection<Product> findByCategory(Integer categoryId) {
		// TODO Auto-generated method stub
		
		String hql="FROM Product p WHERE p.category.id=:cid";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		query.setParameter("cid", categoryId);
		Collection<Product> listProduct=query.list();
		return listProduct;
	}

	@Override
	public Collection<Product> findByKeyWords(String keywords) {
		// TODO Auto-generated method stub
		String hql="FROM Product p "+"WHERE p.name LIKE :kw OR p.category.name LIKE :kw ";
		Session session =factory.getCurrentSession();
		Query query=session.createQuery(hql);
		query.setParameter("kw", "%"+keywords+"%");
		Collection<Product> listProduct=query.list();
		return listProduct;
	}

	@Override
	public Collection<Product> findByBrand(Integer brandId) {
		// TODO Auto-generated method stub
		String hql="FROM Product p WHERE p.brand.id=:bid";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		query.setParameter("bid", brandId);
		Collection<Product> listProduct=query.list();
		return listProduct;
	}

	

	
	

	

}
