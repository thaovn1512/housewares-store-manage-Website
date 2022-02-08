package ptithcm.DAO;

import java.util.List;

public interface ReportDAO {
	public List<Object[]> revenueByCategory();
	public List<Object[]> revenueByMonth();
}
