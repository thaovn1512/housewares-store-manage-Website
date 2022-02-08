package ptithcm.DAO;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.Bill;
import ptithcm.Entity.BillDetail;
import ptithcm.Entity.Users;
@Transactional
@Repository
public class BillDAOImpl implements BillDAO{

	@Autowired
	SessionFactory factory;
	@Override
	public Bill findById(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
//		String hql="SELECT * FROM Bill WHERE id=:id";
//		Query query=session.(hql);
		
		Bill entity=(Bill) session.get(Bill.class, id);
		return entity;
	}

	@Override
	public List<Bill> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM Bill";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Bill> listBill=query.list();
		return listBill;
	}

	@Override
	public Bill insert(Bill entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Bill entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Bill delete(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Bill entity=(Bill) session.get(Bill.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public void create(Bill bill, List<BillDetail> details) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.save(bill);
		for(BillDetail detail: details) {
			session.save(detail);
		}
		
		
	}

	@Override
	public List<Bill> findByUser(Users user) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		String hql="FROM Bill b WHERE b.user.id=:uid ";
		Query query=session.createQuery(hql);
		query.setParameter("uid", user.getId());
		List<Bill> listBill=query.list();
		return listBill;
	}
	
}
