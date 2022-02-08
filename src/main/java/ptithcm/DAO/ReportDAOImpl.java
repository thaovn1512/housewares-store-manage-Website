package ptithcm.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.Bill;
@Transactional
@Repository
public class ReportDAOImpl implements ReportDAO{
	@Autowired
	SessionFactory factory;
	@Override
	public List<Object[]> revenueByCategory() {
		// TODO Auto-generated method stub
		String hql="SELECT d.product.category.name,"
				+"SUM(d.quantity),"
				+"SUM((d.product.price-d.product.price*d.product.discount/100)*d.quantity),"
				+"MIN(d.product.price-d.product.price*d.product.discount/100),"
				+"MAX(d.product.price-d.product.price*d.product.discount/100),"
				+"AVG(d.product.price-d.product.price*d.product.discount/100) "
				+"FROM BillDetail d "
				+"GROUP BY d.product.category.name";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Object[]> list=query.list();
		return list;
		
	}

	@Override
	public List<Object[]> revenueByMonth() {
		// TODO Auto-generated method stub
		String hql="SELECT MONTH(d.bill.dayCreate) ,"
				+"SUM(d.quantity),"
				+"SUM((d.product.price-d.product.price*d.product.discount/100)*d.quantity),"
				+"MIN(d.product.price-d.product.price*d.product.discount/100),"
				+"MAX(d.product.price-d.product.price*d.product.discount/100),"
				+"AVG(d.product.price-d.product.price*d.product.discount/100) "
				+"FROM BillDetail d "
				+"GROUP BY MONTH(d.bill.dayCreate)"
				+"ORDER BY MONTH(d.bill.dayCreate) DESC";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Object[]> list=query.list();
		return list;
	}

}
