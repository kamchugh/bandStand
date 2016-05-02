package data;

import java.util.Date;
import java.util.List;

import entities.Artist;
import entities.Booking;
import entities.Comment;
import entities.Genre;
import entities.Rating;
import entities.User;

public interface BandStandDAO {
	public int getAdminLevel(int id);

	public void setUserAccessLevelToAdmin(int id);

	public void setUserAccessLevelToUser(int id);

	public List<Artist> getAllArtists();

	public List<User> getAllUsers();

	public Artist getArtistById(int artistID);

	public User getUserById(int userID);

	public int addArtist(String name, String email, String password);

	public void deleteArtistById(int artistId);

	public int addUser(String firstName, String lastName, String email, String password);

	public void deleteUserById(int userId);

	public List<Booking> getAllBookings();

	public List<Booking> getConfirmedBookings();

	public List<Booking> getUnConfirmedBookings();

	public void setConfirmedBooking(int id);

	public void setUnConfirmedBooking(int id);

	public List<Rating> getAllRatings();

	public String matchUserPassword(String email);

	public int updateUser(int userId, String firstName, String lastName, String email, String password,
			String photoUrl);

	public void addComment(int artistID, String description, int userID);

	public void addRating(int artistID, int rating, int userID);

	public void addBooking(int artistID, Date date, int userID);

	public List<Rating> getAllRatings(int artistID);

	public List<Comment> getAllComments(int artistID);

	public Artist searchByName(String name);

	public List<Genre> searchByGenre(String genreType);

	public List<Booking> getBookings(int userId);

	public List<Booking> getAllBookingsByArtist(int artistID);
	
	public User getUserByEmail(String email);


	public int updateArtist(Artist artist);

	public int getRatingsForArtist(Artist artist);


}
