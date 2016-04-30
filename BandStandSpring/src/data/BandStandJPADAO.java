package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import entities.Artist;
import entities.User;

@Component
@Transactional
public class BandStandJPADAO implements BandStandDAO {

	@PersistenceContext
	private EntityManager em;

	// Gets the admin level(access level). 1 is a regular user, 2 is an admin.
	public int getAdminLevel(int id) {

		User user = em.find(User.class, id);
		int accessLevel = user.getAccessLevel();
		return accessLevel;
	}

	// Sets a user's access level to Admin (access level 2).
	public void setUserAccessLevelToAdmin(int id) {
		User user = em.find(User.class, id);
		user.setAccessLevel(2);
	}

	// Sets a user's access level to User (access level 1).
	public void setUserAccessLevelToUser(int id) {
		User user = em.find(User.class, id);
		user.setAccessLevel(1);
	}

	public List<Artist> getAllArtists() {
		String search = "select a from Artist a";
		List<Artist> allArtists = em.createQuery(search, Artist.class).getResultList();
		return allArtists;
	}
}
