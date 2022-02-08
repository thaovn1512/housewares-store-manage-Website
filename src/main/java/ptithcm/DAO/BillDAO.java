package ptithcm.DAO;

import java.util.List;

import ptithcm.Entity.Bill;
import ptithcm.Entity.BillDetail;
import ptithcm.Entity.Users;

public interface BillDAO {
	Bill findById(Integer id);
	List<Bill> findAll();
	Bill insert(Bill entity);
	void update(Bill entity);
	Bill delete(Integer id);
	void create(Bill bill, List<BillDetail> details);
	List<Bill> findByUser(Users user);
	
}
