package ptithcm.DAO;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ptithcm.Entity.Users;
@Transactional
@Repository
public class UsersDAOImpl implements UsersDAO{

	@Autowired
	SessionFactory factory;


	@Override
	public List<Users> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM Users";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Users> listUsers=query.list();
		return listUsers;
	}

	@Override
	public Users insert(Users entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Users entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Users delete(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Users entity=(Users) session.load(Users.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public Users findByEmail(String email) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		String hql="SELECT * FROM Users WHERE email=:email";
		Query query=session.createQuery(hql);
		
		Users entity=(Users) query.uniqueResult();
		return entity;
	}

}
