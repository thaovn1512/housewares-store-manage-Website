package ptithcm.DAO;

import java.util.List;

import ptithcm.Entity.Bill;
import ptithcm.Entity.BillDetail;

public interface BillDetailDAO {
	BillDetail findById(Integer id);
	List<BillDetail> findAll();
	BillDetail insert(BillDetail entity);
	void update(BillDetail entity);
	BillDetail delete(Integer id);
	List<BillDetail> findByBill(Bill bill);
	
}
