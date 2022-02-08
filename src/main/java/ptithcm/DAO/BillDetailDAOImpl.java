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
@Transactional
@Repository
public class BillDetailDAOImpl implements BillDetailDAO{

	@Autowired
	SessionFactory factory;
	@Override
	public BillDetail findById(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
//		String hql="SELECT * FROM BillDetail WHERE id=:id";
//		Query query=session.(hql);
		
		BillDetail entity=(BillDetail) session.get(BillDetail.class, id);
		return entity;
	}

	@Override
	public List<BillDetail> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM BillDetail";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<BillDetail> listBillDetail=query.list();
		return listBillDetail;
	}

	@Override
	public BillDetail insert(BillDetail entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(BillDetail entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public BillDetail delete(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		BillDetail entity=(BillDetail) session.get(BillDetail.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public List<BillDetail> findByBill(Bill bill) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		String hql="FROM BillDetail b WHERE b.bill.id=:bid";
		Query query=session.createQuery(hql);
		query.setParameter("bid", bill.getId());
		List<BillDetail> listDetail=query.list();
		return listDetail;
	}
	
}
