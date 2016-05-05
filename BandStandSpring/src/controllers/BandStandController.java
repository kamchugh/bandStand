package controllers;




/*This is a Spring MVC(Model View Controller) controller(Controller).  This functions as a bridge between various
 * .jsp views (View) and the Data Access Objects (Model). 
 */
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.BandStandDAO;
import entities.Artist;
import entities.Booking;
import entities.Comment;
import entities.Genre;
import entities.Photo;
import entities.Rating;
import entities.User;

@Controller
public class BandStandController {
	// A lost of all artists that gets stored in the session initially during
	// the initalLoad().
	// Stored in the session as "all"
	private List<Artist> allArtists;

	// Dependency injection
	@Autowired
	private BandStandDAO dao;

	// Gets the user access level (1 = regular user, 2 = admin, 3 = artist)
	// Access level is set to 1 by default (for users) and 3 (for artists). The
	// access level
	// can be changed to 2 in the admin portal
	// (Admin.jsp/setAccessLevelAdmin.do);
	@RequestMapping("getUserAccess.do")
	public ModelAndView getUserAccessLevel(@RequestParam("userID") int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		int accessLevel = dao.getAdminLevel(id);
		mv.addObject(accessLevel);
		System.out.println(accessLevel);

		return mv;
	}

	//Used by the admin (accessLevel = 2) to make a user an admin (change their accessLevel from 1 (default) to 2)
	@RequestMapping("setUserAccessToAdmin.do")
	public String setUserAccessToAdmin(@RequestParam("userID") int id) {
		dao.setUserAccessLevelToAdmin(id);
		return "Admin.jsp";
	}

	//Used by the admin (accessLevel = 2) to make an admin a user(change their accessLevel from 2 to 1)
	@RequestMapping("setUserAccessToUser.do")
	public String setUserAccessToUser(@RequestParam("userID") int id) {
		dao.setUserAccessLevelToUser(id);
		return "Admin.jsp";
	}

	// get a list of all artists in the database
	//This differs from getAllArtistsForUser.do by the viewName
	//This is intended to be used by an admin in the admin portal
	@RequestMapping("getAllArtists.do")
	public ModelAndView getAllArtist(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Artist> allArtistsCopy = allArtists;
		mv.addObject("allArtists", allArtistsCopy);
		mv.setViewName("Admin.jsp");
		return mv;
	}

	/*
	 * get a list of all artists in the database
		This differs from getAllArtists.do by the viewName
	 */
	@RequestMapping("getAllArtistsforUser.do")
	public ModelAndView getAllArtistsforUser(@RequestParam("userID") int userID) {
		System.out.println("I get into the get all artist for user method");
		User user = dao.getUserById(userID);
		List<Artist> allArtistsforUser = new ArrayList<>();
		allArtistsforUser.addAll(dao.getAllArtists());

		ModelAndView mv = new ModelAndView();
		mv.addObject("allArtistsforUser", allArtistsforUser);
		mv.addObject("user", user);
		mv.setViewName("ArtistList.jsp");
		return mv;
	}

	//Method for passing Artist information to editArtist.jsp
	@RequestMapping("loadArtistEditPage.do")
	public ModelAndView loadArtistEditPage(@RequestParam("artistId") int artistID) {
		Artist artist = dao.getArtistById(artistID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("artist", artist);
		mv.setViewName("editArtist.jsp");
		return mv;

	}

	@RequestMapping("loadUserEditPage.do")
	public ModelAndView loadUserEditPage(@RequestParam("userId") int id) {
		User user = dao.getUserById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", user);
		mv.setViewName("editUser.jsp");
		// mv.setViewName("ArtistList.jsp");
		return mv;

	}

	@RequestMapping("getAllUsers")
	public ModelAndView getAllUsers() {
		ModelAndView mv = new ModelAndView();
		List<User> allUsers = dao.getAllUsers();
		for (User user : allUsers) {
			System.out.println(user.getFirstName());
		}
		mv.addObject("allUsers", allUsers);
		mv.setViewName("Admin.jsp");
		return mv;
	}

	@RequestMapping("updateMyInfoClick.do")
	public ModelAndView updateMyInforClick() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("showForm", "true");
		mv.setViewName("ArtistList.jsp");
		return mv;
	}

	@RequestMapping("getUserById.do")
	public ModelAndView getUserById(@RequestParam("userID") int userID) {
		ModelAndView mv = new ModelAndView();
		User user = dao.getUserById(userID);
		System.out.println(user.getFirstName());
		mv.addObject(user);
		mv.setViewName("index.jsp");
		return mv;
	}

	// add an artist

	@RequestMapping("addArtist.do")
	public ModelAndView addArtist(@RequestParam("artistName") String name, @RequestParam("artistEmail") String email,
			@RequestParam("artistPassword") String password) {
		ModelAndView mv = new ModelAndView();
		if (name == "" || email == "" || password == "") {
			String error = "Value required.";
			mv.addObject(error);
			System.out.println(error);
			mv.setViewName("Admin.jsp");
			return mv;
		} else {
			int addArtistReturn = dao.addArtist(name, email, password);
			if (addArtistReturn != 0) {
				String duplicateError = "This email already exists for another user.";
				mv.addObject(duplicateError);
				mv.setViewName("Admin.jsp");
				return mv;
			}
			Artist artistToAdd = dao.getArtistByEmail(email);
			allArtists.add(artistToAdd);
			mv.setViewName("Admin.jsp");
			return mv;
		}	
	}

	// delete an artist

	@RequestMapping("deleteArtistById.do")
	public String deleteArtistById(@RequestParam("artistId") int artistId, HttpSession session) {

		session.removeAttribute("all");
		dao.deleteArtistById(artistId);
		allArtists = dao.getAllArtists();
		session.setAttribute("all", allArtists);
		return "Admin.jsp";
	}

	@RequestMapping("addUserRegistration.do")
	public ModelAndView addUserRegistration(@RequestParam("userFirstName") String firstName,
			@RequestParam("userLastName") String lastName, @RequestParam("userEmail") String email,
			@RequestParam("userPassword") String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		allArtists = dao.getAllArtists();

		session.setAttribute("all", allArtists);
		if (firstName == "" || lastName == "" || email == "" || password == "") {
			String error = "Value required.";
			mv.addObject("valueMissing", error);
			System.out.println(error);
			mv.setViewName("index1.jsp");
		} else {
			int addUserReturn = dao.addUser(firstName, lastName, email, password);
			if (addUserReturn != 0) {
				String duplicateError = "This email already exists for another user.";
				mv.addObject("duplicateError", duplicateError);
				System.out.println(duplicateError);
				mv.setViewName("index1.jsp");

			} else {
				User user = dao.getUserByEmail(email);
				session.setAttribute("user", user);
				mv.setViewName("ArtistList.jsp");
			}
		}
		return mv;
	}

	// add a user

	@RequestMapping("addUser.do")
	public ModelAndView addUser(@RequestParam("userFirstName") String firstName,
			@RequestParam("userLastName") String lastName, @RequestParam("userEmail") String email,
			@RequestParam("userPassword") String password) {
		ModelAndView mv = new ModelAndView();

		if (firstName == "" || lastName == "" || email == "" || password == "") {
			String error = "Value required.";
			mv.addObject(error);
			System.out.println(error);
			mv.setViewName("Admin.jsp");
		} else {
			int addUserReturn = dao.addUser(firstName, lastName, email, password);
			if (addUserReturn != 0) {
				String duplicateError = "This email already exists for anothe user.";
				mv.addObject(duplicateError);
				System.out.println(duplicateError);

			}
			mv.setViewName("Admin.jsp");

		}
		return mv;
	}

	// delete a user

	@RequestMapping("deleteUserById.do")
	public String deleteUserById(@RequestParam("userId") int userId) {
		dao.deleteUserById(userId);

		return "Admin.jsp";
	}

	// allows you to get al bookings

	@RequestMapping("getAllBookings.do")
	public ModelAndView getAllBookings() {
		ModelAndView mv = new ModelAndView();
		List<Booking> bookings = dao.getAllBookings();
		mv.addObject("bookings", bookings);
		mv.setViewName("Admin.jsp");
		return mv;
	}

	// allows you to get all confirmed bookings

	@RequestMapping("getConfirmedBookings.do")
	public ModelAndView getConfirmedBookings() {
		ModelAndView mv = new ModelAndView();
		List<Booking> confirmedBookings = dao.getConfirmedBookings();
		mv.addObject("confirmedBookings", confirmedBookings);
		mv.setViewName("Admin.jsp");
		return mv;
	}

	// allows you to get all unconfirmed bookings

	@RequestMapping("getUnConfirmedBookings.do")
	public ModelAndView getUnConfirmedBookings() {
		ModelAndView mv = new ModelAndView();
		List<Booking> unConfirmedBookings = dao.getUnConfirmedBookings();
		mv.addObject("unConfirmedBookings", unConfirmedBookings);
		mv.setViewName("Admin.jsp");
		return mv;
	}

	// This is the template for updating fields for both user and artist. Save
	// the id in a hidden field in the jsp
	@RequestMapping("updateUser.do")
	public ModelAndView updateUser(User user, @RequestParam("email") String email, @RequestParam("userId") int userId,
			@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("password") String password, @RequestParam("photoUrl") String photoUrl) {

		ModelAndView mv = new ModelAndView();

		if (firstName == "" || lastName == "" || email == "" || password == "") {
			String error = "Value required.";
			mv.addObject(error);
			System.out.println(error);
			mv.setViewName("editUser.jsp");
		} else {
			int addUserReturn = dao.updateUser(userId, firstName, lastName, email, password, photoUrl);
			if (addUserReturn != 0) {
				String duplicateError = "This email already exists for another user.";
				mv.addObject(duplicateError);
				System.out.println(duplicateError);
				mv.setViewName("editUser.jsp");
			} else {
				mv.setViewName("Admin.jsp");
			}

		}
		return mv;
	}

	// this lets the admin set a booking as confirmed

	@RequestMapping("setConfirmedBooking.do")
	public String setConfirmedBooking(@RequestParam("bookingId") int id) {
		dao.setConfirmedBooking(id);
		return "Admin.jsp";
	}
	

	// this lets the admin set a booking as unconfirmed

	@RequestMapping("setUnConfirmedBooking.do")
	public String setUnConfirmedBooking(@RequestParam("bookingId") int id) {
		dao.setUnConfirmedBooking(id);
		return "Admin.jsp";
	}
	
	// these methods are for when the artist logs in to their portal
	
	@RequestMapping("setConfirmedBookingtoArtist.do")
	public ModelAndView setConfirmedBookingtoArtist(@RequestParam("bookingId") int id,
			@RequestParam("artistId") int artistid) {
		Artist artist = dao.getArtistById(artistid);
		dao.setConfirmedBooking(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("artist", artist);
		mv.setViewName("editArtist.jsp");
		return mv;
	}
	
	@RequestMapping("setUnConfirmedBookingtoArtist.do")
	public ModelAndView setUnConfirmedBookingtoArtist(@RequestParam("bookingId") int id,
			@RequestParam("artistId") int artistid) {	
		Artist artist = dao.getArtistById(artistid);
		dao.setUnConfirmedBooking(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("artist", artist);
		mv.setViewName("editArtist.jsp");
		return mv;
	}

	// add a comment to an artist

	@RequestMapping("addComment.do")

	public ModelAndView addComment(@RequestParam("artistID") int artistID, @RequestParam("comment") String comment,
			@RequestParam("userID") int userID) {
		Artist artist = dao.getArtistById(artistID);
		User user = dao.getUserById(userID);
		dao.addComment(artistID, comment, userID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("comment", comment);
		// mv.addObject("user", user);
		mv.addObject("artist", artist);
		List<Comment> comments = dao.getAllComments(artistID);
		mv.addObject("artistComments", comments);
		mv.setViewName("ArtistPage.jsp");
		List<Rating> daoRatings = dao.getAllRatings(artist.getId());
		int daoRatingsSum = 0;
		for (Rating rating2 : daoRatings) {
			daoRatingsSum += rating2.getNumber();
		}
		double ratingAverage = 0;
		if (daoRatings.size()>0){
			ratingAverage = ((double) daoRatingsSum / daoRatings.size());
		}
		daoRatings = dao.getAllRatings(artistID);
		mv.addObject("ratings", ratingAverage);
		
		return mv;
	}

	// add recording to an artist

	@RequestMapping("addRecording.do")
	public ModelAndView addRecording(@RequestParam("artistID") int artistID,
			@RequestParam("recording") String recording) {
		Artist artist = dao.getArtistById(artistID);
		dao.addRecording(artistID, recording);
		ModelAndView mv = new ModelAndView();
		mv.addObject("recording", recording);
		mv.addObject("artist", artist);
		mv.setViewName("editArtist.jsp");
		return mv;
	}

	// this allows you to add a photo to an artist

	@RequestMapping("addPhoto.do")
	public ModelAndView addPhoto(@RequestParam("artistID") int artistID, @RequestParam("photo") String photo) {
		dao.addPhoto(artistID, photo);
		Artist artist = dao.getArtistById(artistID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("photo", photo);
		mv.addObject("artist", artist);
		mv.setViewName("editArtist.jsp");
		return mv;
	}

	// this allows you to add a genre to an artist

	@RequestMapping("addGenre.do")
	public ModelAndView addGenre(@RequestParam("artistID") int artistID, @RequestParam("genre") String genre) {
		dao.addGenre(artistID, genre);
		Artist artist = dao.getArtistById(artistID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("genre", genre);
		mv.addObject("artist", artist);
		mv.setViewName("editArtist.jsp");
		return mv;
	}

	// this allows you to add a rating to an artist

	@RequestMapping("addRating.do")
	public ModelAndView addRating(@RequestParam("artistID") int artistID, @RequestParam("rating") int rating,
			@RequestParam("userID") int userID) {
		Artist artist = dao.getArtistById(artistID);
		User user = dao.getUserById(userID);
		System.out.println("I get into the add rating method");
		dao.addRating(artistID, rating, userID);
		ModelAndView mv = new ModelAndView();
//		List<Rating> ratings = new ArrayList<>();
		List<Rating> daoRatings = dao.getAllRatings(artist.getId());
		int daoRatingsSum = 0;
		for (Rating rating2 : daoRatings) {
			daoRatingsSum += rating2.getNumber();
		}
		double ratingAverage = 0;
		if (daoRatings.size()>0){
			ratingAverage = ((double) daoRatingsSum / daoRatings.size());
		}
		daoRatings = dao.getAllRatings(artistID);
		mv.addObject("ratings", ratingAverage);
		mv.addObject("user", user);
		mv.addObject("artist", artist);
		mv.setViewName("ArtistPage.jsp");
		return mv;
		
		
		
		
		
		
//		System.out.println("I get below the getAllComments method in the controller");
//		ratings.addAll(daoRatings);
//		int addedRatings = 0;
//		for (Rating rating : daoRatings) {
//			addedRatings = addedRatings + rating.getNumber();
//			System.out.println(addedRatings);
//		}
//		
//		System.out.println("I am the added ratings" + addedRatings);
//		System.out.println("I am the size of the list" + daoRatings.size());
//		System.out.println("I am the rating average" + ratingAverage);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("ratings", ratingAverage);
	}

	// @RequestMapping("addBooking.do")
	// public ModelAndView addDate(@RequestParam("artistID") int artistID,
	// @RequestParam("month") String month,
	// @RequestParam("day") String day, @RequestParam("year") String year,
	// @RequestParam("userID") int userID) {
	// System.out.println("I'm in the add date method");
	// Artist artist = dao.getArtistById(artistID);
	// User user = dao.getUserById(userID);
	// ModelAndView mv = new ModelAndView();
	// // Date date = new Date();
	// String dateString = year + "-" + month + "-" + day;
	// SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
	// try {
	// Date newdate = dateFormat.parse(dateString);
	// System.out.println("Im going to try to add the booking now");
	// dao.addBooking(artistID, newdate, userID);
	// System.out.println("I've added the booking");
	// // this is acting funky - showing a "01" for month of "10"
	// mv.addObject("date", newdate);
	// mv.addObject("user", user);
	// mv.addObject("artist", artist);
	// mv.setViewName("ArtistPage.jsp");
	//
	// } catch (ParseException e) {
	// System.out.println("I couldn't parse this");
	// e.printStackTrace();
	// }
	// return mv;
	// }

	// this allows you to add a booking to an artist and user

	@RequestMapping("addBooking.do")
	public ModelAndView addDate(@RequestParam("artistID") int artistID, @RequestParam("date") String date,
			@RequestParam("userID") int userID) {
		Artist artist = dao.getArtistById(artistID);
		System.out.println("date: " + date);
		System.out.println("in add booking");
		ModelAndView mv = new ModelAndView();
		if (date == "") {
			String dateError = "Please enter a date.";
			mv.addObject("artist", artist);
			mv.addObject("dateError", dateError);
			mv.setViewName("ArtistPage.jsp");
			return mv;

		} else {

			User user = dao.getUserById(userID);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
			try {
				Date newdate = dateFormat.parse(date);
				System.out.println("Im going to try to add the booking now");
				dao.addBooking(artistID, newdate, userID);
				System.out.println("I've added the booking");
				// this is acting funky - showing a "01" for month of "10"
				mv.addObject("date", newdate);
				mv.addObject("user", user);
				mv.addObject("artist", artist);
				mv.setViewName("ArtistPage.jsp");

			} catch (ParseException e) {
				System.out.println("I couldn't parse this");
				e.printStackTrace();
			}
			return mv;
		}
	}

	// this gives you all the bookings for an artist

	@RequestMapping("getBookingsByBand.do")
	public ModelAndView getBookingsByBand(@RequestParam("artistID") int artistID, @RequestParam("userID") int userID) {
		System.out.println("I enter the get all comments method");
		User user = dao.getUserById(userID);
		Artist artist = dao.getArtistById(artistID);
		List<Booking> bookings = new ArrayList<>();
		List<Booking> daoBookings = new ArrayList<>();
		daoBookings = dao.getAllBookingsByArtist(artistID);
		System.out.println("I get below the getAllComments method in the controller");
		bookings.addAll(daoBookings);
		for (Booking booking : daoBookings) {
			System.out.println(booking.getId() + " " + booking.getBookingDate());
		}
		ModelAndView mv = new ModelAndView();

		mv.addObject("bookings", bookings);
		mv.addObject("user", user);
		mv.addObject("artist", artist);
		mv.setViewName("ArtistPage.jsp");
		return mv;
	}

	// this gives you all the comments for an artist

	@RequestMapping("getCommentsByBand.do")
	public ModelAndView getCommentsByBand(@RequestParam("artistID") int artistID, @RequestParam("userID") int userID) {
		System.out.println("I enter the get all comments method");
		User user = dao.getUserById(userID);
		Artist artist = dao.getArtistById(artistID);
		List<Comment> comments = new ArrayList();
		List<Comment> daoComments = new ArrayList();
		daoComments = dao.getAllComments(artistID);
		System.out.println("I get below the getAllComments method in the controller");
		comments.addAll(daoComments);
		for (Comment comment : comments) {
			System.out.println(comment.getBody());
		}
		ModelAndView mv = new ModelAndView();

		mv.addObject("comments", comments);
		mv.addObject("user", user);
		mv.addObject("artist", artist);
		mv.setViewName("ArtistPage.jsp");
		return mv;
	}

	// this gives you the average rating of a band

	@RequestMapping("getRatingsByBand.do")
	public ModelAndView getRatingsByBand(@RequestParam("artistID") int artistID, @RequestParam("userID") int userID) {
		System.out.println("I enter the get all comments method");
		User user = dao.getUserById(userID);
		Artist artist = dao.getArtistById(artistID);
		List<Rating> ratings = new ArrayList<>();
		List<Rating> daoRatings = new ArrayList<>();
		daoRatings = dao.getAllRatings(artistID);
		System.out.println("I get below the getAllComments method in the controller");
		ratings.addAll(daoRatings);
		int addedRatings = 0;
		for (Rating rating : daoRatings) {
			addedRatings = addedRatings + rating.getNumber();
			System.out.println(addedRatings);
		}
		double ratingAverage = ((double) addedRatings / daoRatings.size());
		System.out.println("I am the added ratings" + addedRatings);
		System.out.println("I am the size of the list" + daoRatings.size());
		System.out.println("I am the rating average" + ratingAverage);
		ModelAndView mv = new ModelAndView();
		mv.addObject("ratings", ratingAverage);
		mv.addObject("user", user); 
		mv.addObject("artist", artist);
		mv.setViewName("ArtistPage.jsp");
		return mv;
	}

	// this gives you the information for an artist just based off of their id,
	// it also gives
	// you their average star rating

	@RequestMapping("getArtistById.do")
	public ModelAndView getArtistById(@RequestParam("artistID") int artistID, @RequestParam("userID") int userID) {
		ModelAndView mv = new ModelAndView();
		User user = dao.getUserById(userID);
		Artist artist = dao.getArtistById(artistID);
		List<Rating> ratings = new ArrayList<>();
		List<Rating> daoRatings = new ArrayList<>();
		daoRatings = dao.getAllRatings(artistID);
		System.out.println("I get below the getAllComments method in the controller");
		ratings.addAll(daoRatings);
		int addedRatings = 0;
		for (Rating rating : daoRatings) {
			addedRatings = addedRatings + rating.getNumber();
			System.out.println(addedRatings);
		}
		
		double ratingAverage = 0;
		if (daoRatings.size()>0){
			ratingAverage = ((double) addedRatings / daoRatings.size());
		}
		
		System.out.println("I am the added ratings" + addedRatings);
		System.out.println("I am the size of the list" + daoRatings.size());
		System.out.println("I am the rating average" + ratingAverage);
		mv.addObject("ratings", ratingAverage);
		List<Comment> comments = dao.getAllComments(artistID);
		mv.addObject("artistComments", comments);
		mv.addObject("user", user);
		mv.addObject("artist", artist);

		mv.setViewName("ArtistPage.jsp");
		return mv;
	}

	// this gives you all the photos for a particular artist

	@RequestMapping("getAllPhotosForArtist.do")
	public ModelAndView getAllPhotosForArtist(@RequestParam("artistId") int id) {
		System.out.println("in controller");
		ModelAndView mv = new ModelAndView();
		List<Photo> photoList = dao.getArtistPhotos(id);
		System.out.println("back in controller");
		for (Photo photo : photoList) {
			System.out.println("inside for each");
			System.out.println(photo.getUrl());
		}
		mv.addObject("photos", photoList);
		mv.setViewName("ArtistPage.jsp");
		return mv;

	}

	// this method logs you out and brings you back to our index page

	@RequestMapping("userLogOut.do")
	public ModelAndView userLogOut(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index1.jsp");
		session.invalidate();
		return mv;
	}

	// User log in. Store user in session.
	@RequestMapping("getUserByEmail.do")
	public ModelAndView ValidatePassword(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = dao.getUserByEmail(email);
		session.setAttribute("all", allArtists);
		if (user == null) {
			allArtists = dao.getAllArtists();
			for (Artist artist : allArtists) {
				if(artist.getEmail().equals(email)){
					if(!artist.getPassword().equals(password)){
						mv.setViewName("index1.jsp");
						mv.addObject("wrongPassword", email);
						return mv;
					}
					mv.addObject(artist);
					mv.setViewName("editArtist.jsp");
					return mv;
				}
			}
			mv.addObject("wrongEmail", email);
			mv.setViewName("index1.jsp");
			return mv;
		}

		if (password.equals(dao.matchUserPassword(email))) {
			// mv.addObject("user", user);
			session.setAttribute("user", user);
			mv.setViewName("ArtistList.jsp");
			return mv;
		} else {
			// mv.addObject("user", user);
			mv.addObject("wrongPassword", email);
			mv.setViewName("index1.jsp");
			return mv;
		}

	}

	// this method updates an artist

	@RequestMapping("updateArtist.do")
	public ModelAndView updateArtist(Artist artist) {

		ModelAndView mv = new ModelAndView();
		// mv.setViewName("Admin.jsp");
		// mv.addObject("nameUpdated", name);
		// return mv;

		if (artist.getName() == "" || artist.getEmail() == "" || artist.getPassword() == ""
				|| artist.getDescription() == "") {
			String error = "Value required.";
			mv.addObject(error);
			System.out.println(error);
			mv.setViewName("editArtist.jsp");
		} else {
			int updateArtistReturn = dao.updateArtist(artist);
			if (updateArtistReturn != 0) {
				String duplicateError = "This email already exists for another user.";
				mv.addObject("error", duplicateError);
				System.out.println(duplicateError);
				mv.setViewName("editArtist.jsp");
			} else {
				mv.setViewName("Admin.jsp");
			}

		}
		return mv;
	}

	// this allows you to search by artist name on the artist list page

	@RequestMapping("searchByName.do")
	public ModelAndView getArtistById(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView();
		if (name.equals("Select Artist")) {
			mv.addObject("noName", name);

		} else {
			Artist artist = dao.searchByName(name);
			System.out.println("This is the artist I have after going to the dao: " + artist);
			List<Artist> matchedArtists = new ArrayList<>();
			if (artist.getName().equals(name)) {
				matchedArtists.add(artist);
			}
			mv.addObject("filterArtist", matchedArtists);
		}
		mv.setViewName("ArtistList.jsp");
		return mv;
	}

	@RequestMapping("deletePhoto.do")
	public ModelAndView deletePhoto(@RequestParam("artistID") int artistID, @RequestParam("photo") int photoID) {
		
		dao.deletePhoto(artistID, photoID);
		ModelAndView mv = new ModelAndView();
		Artist artist = dao.getArtistById(artistID);
		mv.addObject("removedPhoto", photoID);
		mv.addObject("artist", artist);
		mv.setViewName("editArtist.jsp");
		return mv;
	}

	@RequestMapping("deleteRecording.do")
	public ModelAndView deleteRating(@RequestParam("artistID") int artistID,
			@RequestParam("recording") int recordingID) {
		dao.deleteRecording(recordingID);
		Artist artist = dao.getArtistById(artistID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("removedRecording", recordingID);
		mv.addObject("artist", artist);
		mv.setViewName("editArtist.jsp");
		return mv;
	}

	@RequestMapping("deleteGenre.do")
	public ModelAndView deleteGenre(@RequestParam("artistID") int artistID, @RequestParam("genre") int genreID) {	
		dao.deleteGenre(genreID);
		Artist artist = dao.getArtistById(artistID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("removedGenre", genreID);
		mv.addObject("artist", artist);
		mv.setViewName("editArtist.jsp");
		return mv;
	}

	// @RequestMapping("searchBookingsByUserId.do")
	// public ModelAndView getBookings(@RequestParam("userId") int userId) {
	// ModelAndView mv = new ModelAndView();
	// List<Booking> bookings = dao.getBookings(userId);
	// mv.addObject("bookings", bookings);
	// for (Booking booking : bookings) {
	//
	// System.out.println(booking.getId());
	// System.out.println(booking.getBookingDate());
	// }
	// mv.setViewName("ArtistList.jsp");
	// return mv;
	// }

	// this displays the bookings of a user on the artist list page

	@RequestMapping("searchBookingsByUserId.do")
	public ModelAndView getBookings(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// System.out.println("user id " + user.getId());
		User user = (User) (session.getAttribute("user"));
		List<Booking> bookings = dao.getBookings(user.getId());
		mv.addObject("bookings", bookings);
		for (Booking booking : bookings) {

			System.out.println(booking.getId());
			System.out.println(booking.getBookingDate());
		}
		mv.setViewName("ArtistList.jsp");
		return mv;
	}

	// this allows you to search by genre on the artist list page

	@RequestMapping("searchByGenre.do")
	public ModelAndView searchByGenre(@RequestParam("genre") String genreType) {
		ModelAndView mv = new ModelAndView();
		if (genreType.equals("Select Genre")) {
			mv.addObject("noGenre", genreType);
		} else {
			List<Genre> genres = dao.searchByGenre(genreType);

			List<Artist> matchedArtists = new ArrayList();
			for (Genre g : genres) {
				matchedArtists.add(g.getArtist());
			}
			mv.addObject("filterArtist", matchedArtists);
		}
		mv.setViewName("ArtistList.jsp");
		return mv;
	}

	// this allows you to search for an artist by their average rating

	@RequestMapping("searchByRating.do")
	public ModelAndView searchByRating(@RequestParam("rating") String passedRating,
			@RequestParam("userId") int userID) {
		ModelAndView mv = new ModelAndView();
		if (passedRating.equals("Select Rating")) {
			mv.addObject("noRating", passedRating);
		} else {
			User user = dao.getUserById(userID);
			List<Artist> artists = new ArrayList<>();
			List<Artist> matchedArtists = new ArrayList<>();
			artists = dao.getAllArtists();
			for (Artist artist : artists) {
				int averageRating = dao.getRatingsForArtist(artist);
				System.out.println("controller average rating; " + averageRating);
				if (averageRating == Integer.parseInt(passedRating)) {
					matchedArtists.add(artist);
				}

			}

			mv.addObject("filterArtist", matchedArtists);
			mv.addObject("user", user);
		}
		mv.setViewName("ArtistList.jsp");
		return mv;

	}

	// this initially loads a list of artists to be displayed on the "artist
	// list" page

	@RequestMapping("initialLoad.do")
	public ModelAndView initalLoad(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		allArtists = dao.getAllArtists();

		session.setAttribute("all", allArtists);

		mv.setViewName("index1.jsp");
		return mv;
	}

	@RequestMapping("getAllArtistsUser.do")
	public ModelAndView getAllArtists(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		allArtists = dao.getAllArtists();

		mv.setViewName("ArtistList.jsp");
		return mv;
	}

	// this is when a user updates their information on their main page

	@RequestMapping("updateUserByUser.do")
	public ModelAndView updateUserByUser(User user, @RequestParam("email") String email,
			@RequestParam("userId") int userId, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("password") String password,
			@RequestParam("photoUrl") String photoUrl) {

		System.out.println(email);
		ModelAndView mv = new ModelAndView();

		System.out.println(email);
		// if (firstName == "" || lastName == "" || email == "" || password ==
		// "") {
		// String error = "Value required.";
		// mv.addObject(error);
		// System.out.println(error);
		// mv.setViewName("ArtistList.jsp");
		// } else {
		dao.updateUserByUser(userId, firstName, lastName, email, password, photoUrl);
		// if (addUserReturn != 0) {
		// String duplicateError = "This email already exists for another
		// user.";
		// mv.addObject(duplicateError);
		// System.out.println(duplicateError);
		// mv.setViewName("ArtistList.jsp");
		// } else {
		mv.setViewName("ArtistList.jsp");
		// }

		// }
		return mv;
	}

}
