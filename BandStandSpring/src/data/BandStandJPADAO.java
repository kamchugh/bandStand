package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import entities.Artist;
import entities.Booking;
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

	public Artist getArtistById(int artistID) {
		Artist artist = em.find(Artist.class, artistID);
		return artist;
	}

	public void addArtist(String name, String email, String password) {
		Artist newArtist = new Artist();
		newArtist.setName(name);
		newArtist.setEmail(email);
		newArtist.setPassword(password);
		em.persist(newArtist);
	}

	public void deleteArtistById(int artistId) {
		Artist artistToDelete = em.find(Artist.class, artistId);
		em.remove(artistToDelete);
	}

	public void addUser(String firstName, String lastName, String email, String password) {
		User newUser = new User();
		newUser.setFirstName(firstName);
		newUser.setLastName(lastName);
		newUser.setEmail(email);
		newUser.setPassword(password);
		newUser.setAccessLevel(1);
		em.persist(newUser);
	}

	public void deleteUserById(int userId) {
		User userToDelete = em.find(User.class, userId);
		em.remove(userToDelete);
	}
	
	public List<Booking> getAllBookings(){
		String query = "Select b from Booking b";
		List<Booking> bookings = em.createQuery(query, Booking.class).getResultList();
		return bookings;
				
	}

	public List<Booking> getConfirmedBookings(){
		String query = "Select b from Booking b where confirmed = false";
		List<Booking> bookings = em.createQuery(query, Booking.class).getResultList();
		return bookings;
				
	}
	public List<Booking> getUnConfirmedBookings(){
		String query = "Select b from Booking b where confirmed = true";
		List<Booking> bookings = em.createQuery(query, Booking.class).getResultList();
		return bookings;
				
	}
	
	public void updateUserEmail(int userId, String email){
		User user = em.find(User.class,  userId);
		user.setEmail(email);
	}
	
	public void setConfirmedBooking(int id){
		Booking booking = em.find(Booking.class,  id);
		booking.setConfirmed(true);
	}
	
	public void setUnConfirmedBooking(int id){
		Booking booking = em.find(Booking.class,  id);
		booking.setConfirmed(false);
	}
}
