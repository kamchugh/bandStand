package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Component
@Transactional
public class BandStandJPADAO implements BandStandDAO {
	
	
	@PersistenceContext
	private EntityManager em;

	
	public void setAdminLevelOn(int id){
		System.out.println("inside DAO method");
		User user = em.find(User.class,  1);
		System.out.println(user.getAccessLevel());
	}
	
}
