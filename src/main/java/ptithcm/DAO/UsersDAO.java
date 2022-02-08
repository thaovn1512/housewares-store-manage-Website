package ptithcm.DAO;

import java.util.List;

import ptithcm.Entity.Users;

public interface UsersDAO {
//	Users findById(String id);
	List<Users> findAll();
	Users insert(Users entity);
	void update(Users entity);
	Users delete(Integer id);
	Users findByEmail(String email);

	
}
