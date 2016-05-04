package data;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import entities.Artist;
import entities.Booking;
import entities.Comment;
import entities.Genre;
import entities.GenreType;
import entities.Photo;
import entities.Rating;
import entities.Recording;
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
		System.out.println("before");
		List<Artist> allArtists = em.createQuery(search, Artist.class).getResultList();
		System.out.println("after");
		return allArtists;
	}

	// public List<Rating> getRatingByArtist() {
	// String ratings;
	//// String search = "select r from Rating r WHERE r.artist = " + artist;
	//// List <Rating> ratingByArtist = em.createQuery(search,
	// Rating.class).getResultList();
	// return ratings;
	//
	// }

	public List<Comment> getAllComments(int artistID) {
		System.out.println("I go into get all comments in the DAO");
		Artist artist = getArtistById(artistID);
		System.out.println("this is the artist I have in the controller: " + artist);
		String search = "select c from Comment c WHERE c.artist.id = '" + artist.getId() + "'";
		List<Comment> allComments = em.createQuery(search, Comment.class).getResultList();
		for (Comment comment : allComments) {
			System.out.println("This is a comment:" + comment);
		}
		return allComments;
	}

	public List<Booking> getAllBookingsByArtist(int artistID) {
		Artist artist = getArtistById(artistID);
		String search = "select b from Booking b WHERE b.artist.id = '" + artist.getId() + "'";
		List<Booking> allBookings = em.createQuery(search, Booking.class).getResultList();
		return allBookings;
	}

	public List<Rating> getAllRatings(int artistID) {
		Artist artist = getArtistById(artistID);
		String search = "select r from Rating r WHERE r.artist.id = '" + artist.getId() + "'";
		List<Rating> allRatings = em.createQuery(search, Rating.class).getResultList();
		return allRatings;
	}

	public List<User> getAllUsers() {
		String search = "select u from User u";
		List<User> allUsers = em.createQuery(search, User.class).getResultList();
		return allUsers;
	}

	// these methods hopefully give you the correct user when trying to sign in

	public User getUserByEmail(String email) {
		String search = "select u from User u WHERE u.email = '" + email + "'";
		User user;
		try {
			user = em.createQuery(search, User.class).getSingleResult();
		} catch (Exception e) {
			user = null;
			
		}
		return user;
	}

	public String matchUserPassword(String email) {
		String password = "";
		getUserByEmail(email).getId();
		User user = em.find(User.class, getUserByEmail(email).getId());
		password = user.getPassword();
		return password;

	}

	public Artist getArtistById(int artistID) {
		Artist artist = em.createQuery("select a from Artist a WHERE a.id = " + artistID, Artist.class)
				.getSingleResult();
		return artist;
	}
	
	public Photo getPhotoByID(int photoID) {
		System.out.println("I'm in getphotobyURL with: " + photoID + " as the photo url");
		Photo photo = em.createQuery("select p from Photo p WHERE p.id = " + photoID, Photo.class).getSingleResult();
		return photo;
	}
	
	public Recording getRecordingByID(int recordingID) {
		Recording recording = em.createQuery("select r from Recording r WHERE r.id = " + recordingID, Recording.class).getSingleResult();
		return recording;
	}

	public Artist getArtistByEmail(String email){
		Artist artist;
		try{
			 artist = em.createQuery("select a from Artist a where a.email = " + "'"+email+"'", Artist.class).getSingleResult();
		}catch(Exception e){
			 artist = null;
			 System.out.println(e);
			System.out.println("Error in getting artist by email");
		}
		return artist;
	}
	public User getUserById(int userID) {
		User user = em.find(User.class, userID);
		return user;
	}

	public int addArtist(String name, String email, String password) {

		List<Artist> artists = getAllArtists();
		for (Artist artist : artists) {
			if (artist.getEmail().equals(email)) {
				return 1;
			}
		}
		Artist newArtist = new Artist();
		newArtist.setName(name);
		newArtist.setEmail(email);
		newArtist.setPassword(password);
		em.persist(newArtist);
		return 0;
	}

	public void addComment(int artistID, String commentBody, int userID) {
		System.out.println("I try to add a comment in the DAO");

		Artist artistComment = getArtistById(artistID);
		User user = getUserById(userID);
		Comment comment = new Comment();
		comment.setArtist(artistComment);
		System.out.println("I've set the artist to " + artistComment.getName());
		System.out.println(commentBody);
		comment.setBody(commentBody);
		comment.setUser(user);
		System.out.println("I've set the commentBody to " + commentBody);
		em.persist(comment);
		System.out.println("I have persisted the comment");
	}
	
	public void addRecording(int artistID, String recordingUrl) {
		Artist artistRecording = getArtistById(artistID);
		Recording recording = new Recording();
		recording.setArtist(artistRecording);
		recording.setUrl(recordingUrl);
		em.persist(recording);
	}
	
	public void deleteRecording(int recordingID) {
		Recording recording = getRecordingByID(recordingID);
		em.remove(recording);
	}
	
	public void addPhoto(int artistID, String photoUrl) {
		Artist artistPhoto = getArtistById(artistID);
		Photo photo = new Photo();
		photo.setArtist(artistPhoto);
		photo.setUrl(photoUrl);
		em.persist(photo);
		
	}
	
	public void deletePhoto(int artistID, int photoID) {
		Artist artistPhoto = getArtistById(artistID);
		System.out.println("I made it into the delete photo method with: " + photoID);
		Photo photo = getPhotoByID(photoID);
		em.remove(photo);	
	}
	
	public void addGenre(int artistID, String genreType) {
		Artist artistGenre = getArtistById(artistID);
		Genre genre = new Genre();
		genre.setArtist(artistGenre);
		genre.setGenretype(GenreType.valueOf(genreType));
		em.persist(genre);
	}

	public void addRating(int artistID, int rating, int userID) {
		System.out.println("I get into the addRating DAO");
		Artist artistRating = getArtistById(artistID);
		User user = getUserById(userID);
		System.out.println("Ive gotten artist " + artistRating.getName());
		Rating ratingNumber = new Rating();
		ratingNumber.setNumber(rating);
		ratingNumber.setArtistId(artistRating);
		ratingNumber.setUser(user);
		// comment.setUser(userComment); - finish this when you get the id to
		// transfer
		em.persist(ratingNumber);
		System.out.println("I've added the rating");
	}

	public void addBooking(int artistID, Date date, int userID) {
		System.out.println("In the add booking DAO");
		Artist artistDate = getArtistById(artistID);
		User user = getUserById(userID);
		Booking booking = new Booking();
		booking.setArtist(artistDate);
		booking.setBookingDate(date);
		booking.setUser(user);
		booking.setConfirmed(false);
		em.persist(booking);

		// comment.setUser(userComment); - finish this when you get the id to
		// transfer
		// em.persist(ratingNumber);
	}

	public void deleteArtistById(int artistId) {
		Artist artistToDelete = em.find(Artist.class, artistId);
		artistToDelete.removeRatings(artistToDelete.getRatings());
		artistToDelete.removeBookings(artistToDelete.getBookings());
		artistToDelete.removePhotos(artistToDelete.getPhotos());
		artistToDelete.removeRecordings(artistToDelete.getRecordings());
		artistToDelete.removeComments(artistToDelete.getComments());
		artistToDelete.removeGenres(artistToDelete.getGenres());
		em.remove(artistToDelete);
	}

	public void deleteUserById(int userId) {
		User userToDelete = em.find(User.class, userId);
		userToDelete.removeRatings(userToDelete.getRatings());
		userToDelete.removeBookings(userToDelete.getBookings());
		userToDelete.removeComments(userToDelete.getComments());
		em.remove(userToDelete);
	}

	public int addUser(String firstName, String lastName, String email, String password) {
		List<User> users = getAllUsers();
		for (User user : users) {
			if (user.getEmail().equals(email)) {
				return 1;
			}
		}
		User newUser = new User();
		newUser.setFirstName(firstName);
		newUser.setLastName(lastName);
		newUser.setEmail(email);
		newUser.setPassword(password);
		newUser.setAccessLevel(1);
		em.persist(newUser);
		return 0;
	}

	public List<Booking> getAllBookings() {
		String query = "Select b from Booking b";
		List<Booking> bookings = em.createQuery(query, Booking.class).getResultList();
		return bookings;

	}

	public List<Booking> getConfirmedBookings() {
		String query = "Select b from Booking b where confirmed = true";
		List<Booking> bookings = em.createQuery(query, Booking.class).getResultList();
		return bookings;
	}

	public List<Booking> getUnConfirmedBookings() {
		String query = "Select b from Booking b where confirmed = false";
		List<Booking> bookings = em.createQuery(query, Booking.class).getResultList();
		return bookings;

	}

	public List<Rating> getAllRatings() {
		String query = "Select r from Rating r where confirmed=true";
		List<Rating> ratings = em.createQuery(query, Rating.class).getResultList();
		return ratings;
	}

	public List<Photo> getArtistPhotos(int id) {
		System.out.println("in DAO");
		Artist artist = em.find(Artist.class, id);
		List<Photo> photos = artist.getPhotos();
		for (Photo photo : photos) {
			System.out.println("inside for each");
			System.out.println(photo.getUrl());
		}
		return photos;
	}

	public int updateUser(int userId, String firstName, String lastName, String email, String password,
			String photoUrl) {
		User user = em.find(User.class, userId);
		List<User> users = getAllUsers();
		for (User userInside : users) {
			if (userInside.getEmail().equals(email) && !user.getEmail().equals(email)) {
				return 1;
			}
		}
		
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhotoUrl(photoUrl);
		return 0;
	}

	public void setConfirmedBooking(int id) {
		Booking booking = em.find(Booking.class, id);
		booking.setConfirmed(true);
	}

	public void setUnConfirmedBooking(int id) {
		Booking booking = em.find(Booking.class, id);
		booking.setConfirmed(false);
	}

	/// Bruno's methods

	public Artist searchByName(String name) {

		String search = "select a from Artist a where name='" + name + "'";

		Artist artist = em.createQuery(search, Artist.class).getSingleResult();

		return artist;
	}

	public List<Genre> searchByGenre(String genreType) {

		String search = "select g from Genre g where g.genretype='" + genreType + "'";
		List<Genre> genres = em.createQuery(search, Genre.class).getResultList();
		for (Genre g : genres) {
			System.out.println(g.getArtist().getName());
		}
		return genres;
	}

	public List<Booking> getBookings(int userId) {
		String search = "select u from User u where u.id='" + userId + "'";
		User user = em.createQuery(search, User.class).getSingleResult();

		for (Booking booking : user.getBookings()) {
			System.out.println(booking.getId());
			System.out.println(booking.getBookingDate());
		}
		return user.getBookings();
	}

	public int updateArtist(Artist artist) {

		List<Artist> artists = getAllArtists();
		for (Artist artistHolder : artists) {
			if (artistHolder.getEmail().equals(artist.getEmail())) {
				return 1;
			}
		}
		try {
			Artist artistinMethod = em.find(Artist.class, artist.getId());
			artistinMethod.setName(artist.getName());
			artistinMethod.setEmail(artist.getEmail());
			artistinMethod.setPassword(artist.getPassword());
			artistinMethod.setDescription(artist.getDescription());
			return 0;
		} catch (Exception e) {
			return 1;
		}

	}

	public int getRatingsForArtist(Artist artist) {
		getArtistById(artist.getId());
		// List <Rating> ratings = new ArrayList<>();
		// ratings = getAllRatings(artist.getId());
		List<Rating> ratings = getAllRatings(artist.getId());
		System.out.println("Array size: " + ratings.size());
		int addedRatings = 0;
		for (Rating rating : ratings) {
			System.out.println("I'm in ratings with: " + rating);
			addedRatings = addedRatings + rating.getNumber();
			System.out.println(addedRatings);
		}
		if (ratings.size() != 0) {
			int ratingAverage = (addedRatings / ratings.size());
			System.out.println("Average rating: " + ratingAverage);
			return ratingAverage;
		} else {
			return 0;
		}
	}

	public int updateUserByUser(int userId, String firstName, String lastName, String email, String password,
			String photoUrl) {

		User user = em.find(User.class, userId);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhotoUrl(photoUrl);
		return 0;
	}

}
