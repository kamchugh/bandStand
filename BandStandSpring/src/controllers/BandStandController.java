package controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	private List<Artist> allArtists;

	@Autowired
	private BandStandDAO dao;

	@RequestMapping("getUserAccess.do")
	public ModelAndView getUserAccessLevel(@RequestParam("userID") int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		int accessLevel = dao.getAdminLevel(id);
		mv.addObject(accessLevel);
		System.out.println(accessLevel);

		return mv;
	}

	@RequestMapping("setUserAccessToAdmin.do")
	public String setUserAccessToAdmin(@RequestParam("userID") int id) {
		dao.setUserAccessLevelToAdmin(id);
		return "Admin.jsp";
	}

	@RequestMapping("setUserAccessToUser.do")
	public String setUserAccessToUser(@RequestParam("userID") int id) {
		dao.setUserAccessLevelToUser(id);
		return "Admin.jsp";
	}

	@RequestMapping("getAllArtists.do")
	public ModelAndView getAllArtist() {
		ModelAndView mv = new ModelAndView();
		List<Artist> allArtists = dao.getAllArtists();
		mv.addObject("allArtists", allArtists);

		// for (Artist artist : allArtists) {
		// for (Photo photos : artist.getPhotos()) {
		// System.out.println(photos.getUrl());
		// }
		// }

		mv.setViewName("Admin.jsp");
		return mv;
	}

	@RequestMapping("getAllArtistsforUser.do")
	public ModelAndView getAllArtistsforUser(@RequestParam("userID") int userID) {
		System.out.println("I get into the get all artist for user method");
		User user = dao.getUserById(userID);
		List<Artist> allArtistsforUser = new ArrayList();
		allArtistsforUser.addAll(dao.getAllArtists());
		for (Artist artist : allArtistsforUser) {
			System.out.println("Artists I have in the controller" + artist);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("allArtistsforUser", allArtistsforUser);
		mv.addObject("user", user);
		mv.setViewName("ArtistList.jsp");
		return mv;
	}

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

	@RequestMapping("addArtist.do")
	public ModelAndView addArtist(@RequestParam("artistName") String name, @RequestParam("artistEmail") String email,
			@RequestParam("artistPassword") String password) {
		ModelAndView mv = new ModelAndView();
		if (name == "" || email == "" || password == "") {
			String error = "Value required.";
			mv.addObject(error);
			System.out.println(error);
			mv.setViewName("Admin.jsp");
		} else {
			int addArtistReturn = dao.addArtist(name, email, password);
			if (addArtistReturn != 0) {
				String duplicateError = "This email already exists for another user.";
				mv.addObject(duplicateError);
				System.out.println(duplicateError);

			}
			Artist artistToAdd = dao.getArtistByEmail(email);
			allArtists.add(artistToAdd);
			mv.setViewName("Admin.jsp");

		}
		return mv;
	}

	@RequestMapping("deleteArtistById.do")
	public String deleteArtistById(@RequestParam("artistId") int artistId) {
		Artist artistToDelete = dao.getArtistById(artistId);
		allArtists.remove(artistToDelete);
		dao.deleteArtistById(artistId);

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
			mv.addObject(error);
			System.out.println(error);
			mv.setViewName("index1.jsp");
		} else {
			int addUserReturn = dao.addUser(firstName, lastName, email, password);
			if (addUserReturn != 0) {
				String duplicateError = "This email already exists for another user.";
				mv.addObject(duplicateError);
				System.out.println(duplicateError);
			}
			User user = dao.getUserByEmail(email);
			session.setAttribute("user", user);
			mv.setViewName("ArtistList.jsp");

		}
		return mv;
	}

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

	@RequestMapping("deleteUserById.do")
	public String deleteUserById(@RequestParam("userId") int userId) {
		dao.deleteUserById(userId);

		return "Admin.jsp";
	}

	@RequestMapping("getAllBookings.do")
	public ModelAndView getAllBookings() {
		ModelAndView mv = new ModelAndView();
		List<Booking> bookings = dao.getAllBookings();
		mv.addObject("bookings", bookings);
		mv.setViewName("Admin.jsp");
		return mv;
	}

	@RequestMapping("getConfirmedBookings.do")
	public ModelAndView getConfirmedBookings() {
		ModelAndView mv = new ModelAndView();
		List<Booking> confirmedBookings = dao.getConfirmedBookings();
		mv.addObject("confirmedBookings", confirmedBookings);
		mv.setViewName("Admin.jsp");
		return mv;
	}

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

	@RequestMapping("setConfirmedBooking.do")
	public String setConfirmedBooking(@RequestParam("bookingId") int id) {
		dao.setConfirmedBooking(id);
		return "Admin.jsp";
	}

	@RequestMapping("setUnConfirmedBooking.do")
	public String setUnConfirmedBooking(@RequestParam("bookingId") int id) {
		dao.setUnConfirmedBooking(id);
		return "Admin.jsp";
	}

	// Kaylee's methods

	@RequestMapping("addComment.do")

	public ModelAndView addComment(@RequestParam("artistID") int artistID, @RequestParam("comment") String comment,
			@RequestParam("userID") int userID) {
		Artist artist = dao.getArtistById(artistID);
		User user = dao.getUserById(userID);

		System.out.println("I get into the add comment method");
		System.out.println("This is the userID I have: " + userID);
		dao.addComment(artistID, comment, userID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("comment", comment);
		// mv.addObject("user", user);
		mv.addObject("artist", artist);
		mv.setViewName("ArtistPage.jsp");
		return mv;
	}

	@RequestMapping("addRating.do")
	public ModelAndView addRating(@RequestParam("artistID") int artistID, @RequestParam("rating") int rating,
			@RequestParam("userID") int userID) {
		Artist artist = dao.getArtistById(artistID);
		User user = dao.getUserById(userID);
		System.out.println("I get into the add rating method");
		dao.addRating(artistID, rating, userID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("rating", rating);
		mv.addObject("user", user);
		mv.addObject("artist", artist);
		mv.setViewName("ArtistPage.jsp");
		return mv;
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
		double ratingAverage = ((double) addedRatings / daoRatings.size());
		System.out.println("I am the added ratings" + addedRatings);
		System.out.println("I am the size of the list" + daoRatings.size());
		System.out.println("I am the rating average" + ratingAverage);
		mv.addObject("ratings", ratingAverage);

		mv.addObject("user", user);
		mv.addObject("artist", artist);

		mv.setViewName("ArtistPage.jsp");
		return mv;
	}

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

		allArtists = dao.getAllArtists();
		
		session.setAttribute("all", allArtists);

		if (user == null) {
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
			mv.setViewName("index.jsp");
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

	// bruno's methods

	@RequestMapping("searchByName.do")
	public ModelAndView getArtistById(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView();
		Artist artist = dao.searchByName(name);

		List<Artist> allArtists = dao.getAllArtists();
		
		List<Artist> singleArtist = new ArrayList<>();
		
		singleArtist.add(artist);
		
		
		for (Artist artist2 : allArtists) {
			System.out.println(artist2.getName());
		}
		mv.addObject("all", allArtists);
		for (Genre genre : artist.getGenres()) {
			System.out.println(genre.getGenretype());
		}
		
		
		mv.addObject("genres", artist.getGenres());
		mv.addObject("artist", singleArtist);
//		mv.addObject("artist", artist);
		mv.setViewName("ArtistList.jsp");
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

	@RequestMapping("searchByGenre.do")
	public ModelAndView searchByGenre(@RequestParam("genre") String genreType) {
		ModelAndView mv = new ModelAndView();
		List<Genre> genres = dao.searchByGenre(genreType);

		List<Artist> matchedArtists = new ArrayList();
		for (Genre g : genres) {
			matchedArtists.add(g.getArtist());
		}

		mv.addObject("artist", matchedArtists);
		mv.setViewName("ArtistList.jsp");
		return mv;
	}

	@RequestMapping("searchByRating.do")
	public ModelAndView searchByRating(@RequestParam("rating") int passedRating, @RequestParam("userId") int userID) {
		ModelAndView mv = new ModelAndView();
		User user = dao.getUserById(userID);
		List<Artist> artists = new ArrayList<>();
		List<Artist> matchedArtists = new ArrayList<>();
		artists = dao.getAllArtists();
		for (Artist artist : artists) {
			int averageRating = dao.getRatingsForArtist(artist);
			System.out.println("controller average rating; " + averageRating);
			if (averageRating == passedRating) {
				matchedArtists.add(artist);

			}
		}
		// List<Artist> artistRatingMatch = new ArrayList();

		mv.addObject("artist", matchedArtists);
		mv.addObject("user", user);
		mv.setViewName("ArtistList.jsp");
		return mv;

	}

	@RequestMapping("initialLoad.do")
	public ModelAndView initalLoad(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Artist> allArtists = dao.getAllArtists();
		session.setAttribute("all",  allArtists);
		//mv.addObject("all", allArtists);
		mv.setViewName("index1.jsp");
		return mv;
	}

	@RequestMapping("getAllArtistsUser.do")
	public ModelAndView getAllArtists() {
		ModelAndView mv = new ModelAndView();
		List<Artist> allArtists = dao.getAllArtists();
		mv.addObject("artist", allArtists);

		// for (Artist artist : allArtists) {
		// for (Photo photos : artist.getPhotos()) {
		// System.out.println(photos.getUrl());
		// }
		// }

		mv.setViewName("ArtistList.jsp");
		return mv;
	}
	
	@RequestMapping("updateUserByUser.do")
	public ModelAndView updateUserByUser(User user, @RequestParam("email") String email, @RequestParam("userId") int userId,
			@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("password") String password, @RequestParam("photoUrl") String photoUrl) {

		System.out.println(email);
		ModelAndView mv = new ModelAndView();

		System.out.println(email);
//		if (firstName == "" || lastName == "" || email == "" || password == "") {
//			String error = "Value required.";
//			mv.addObject(error);
//			System.out.println(error);
//			mv.setViewName("ArtistList.jsp");
//		} else {
		dao.updateUserByUser(userId, firstName, lastName, email, password, photoUrl);
//			if (addUserReturn != 0) {
//				String duplicateError = "This email already exists for another user.";
//				mv.addObject(duplicateError);
//				System.out.println(duplicateError);
//				mv.setViewName("ArtistList.jsp");
//			} else {
				mv.setViewName("ArtistList.jsp");
//			}

//		}
		return mv;
	}

}
