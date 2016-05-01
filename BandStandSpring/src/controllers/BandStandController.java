package controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.BandStandDAO;
import entities.Artist;
import entities.Booking;
import entities.User;

@Controller
public class BandStandController {

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

	@RequestMapping("getAllArtists")
	public ModelAndView getAllArtist() {
		ModelAndView mv = new ModelAndView();
		List<Artist> allArtists = dao.getAllArtists();
		mv.addObject("allArtists", allArtists);
		mv.setViewName("Admin.jsp");
		return mv;
	}

	@RequestMapping("loadArtistEditPage.do")
	public ModelAndView loadArtistEditPage(@RequestParam("artistId") int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("artistId", id);
		mv.setViewName("editArtist.jsp");
		return mv;

	}

	@RequestMapping("loadUserEditPage.do")
	public ModelAndView loadUserEditPage(@RequestParam("userId") int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("userId", id);
		mv.setViewName("editUser.jsp");
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

	@RequestMapping("getArtistById.do")
	public ModelAndView getArtistById(@RequestParam("artistID") int artistID,
			@RequestParam("userID") int userID) {
		System.out.println("This is the artist id I have: " + artistID);
		System.out.println("This is the user id I have: " + userID);
		ModelAndView mv = new ModelAndView();
		User user = dao.getUserById(userID);
		Artist artist = dao.getArtistById(artistID);
		System.out.println(artist.getName());
		mv.addObject("user", user);
		mv.addObject("artist", artist);
		mv.setViewName("ArtistPage.jsp");
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
	public String addArtist(@RequestParam("artistName") String name, @RequestParam("artistEmail") String email,
			@RequestParam("artistPassword") String password) {
		dao.addArtist(name, email, password);

		return "Admin.jsp";

	}

	@RequestMapping("deleteArtistById.do")
	public String deleteArtistById(@RequestParam("artistId") int artistId) {
		dao.deleteArtistById(artistId);

		return "index.jsp";
	}

	@RequestMapping("addUser.do")
	public String addArtist(@RequestParam("userFirstName") String firstName,
			@RequestParam("userLastName") String lastName, @RequestParam("userEmail") String email,
			@RequestParam("userPassword") String password) {
		dao.addUser(firstName, lastName, email, password);

		return "Admin.jsp";

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
	@RequestMapping("updateUserEmail.do")
	public String updateUserEmail(@RequestParam("email") String email, @RequestParam("userId") int userId) {
		dao.updateUserEmail(userId, email);

		return "index.jsp";
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

	public ModelAndView addComment(@RequestParam("artistID") int artistID,
			@RequestParam("comment") String comment,
			@RequestParam("userID") int userID) {

		System.out.println("I get into the add comment method");
		System.out.println("This is the userID I have: " + userID);
		dao.addComment(artistID, comment, userID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("comment", comment);
		mv.setViewName("ArtistPage.jsp");
		return mv;
	}

	@RequestMapping("addRating.do")
	public ModelAndView addRating(@RequestParam("artistID") int artistID, @RequestParam("rating") int rating,
			@RequestParam("userID") int userID) {
		System.out.println("I get into the add rating method");
		dao.addRating(artistID, rating, userID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("rating", rating);
		mv.setViewName("ArtistPage.jsp");
		return mv;
	}

	@RequestMapping("addBooking.do")
	public ModelAndView addDate(@RequestParam("artistID") int artistID, @RequestParam("month") String month,
			@RequestParam("day") String day, @RequestParam("year") String year,
			@RequestParam("userID") int userID) {
		System.out.println("I'm in the add date method");
		ModelAndView mv = new ModelAndView();
		// Date date = new Date();
		String dateString = year + "-" + month + "-" + day;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		try {
			Date newdate = dateFormat.parse(dateString);
			System.out.println("Im going to try to add the booking now");
			dao.addBooking(artistID, newdate, userID);
			System.out.println("I've added the booking");
			// this is acting funky - showing a "01" for month of "10"
			mv.addObject("date", newdate);
			mv.setViewName("ArtistPage.jsp");

		} catch (ParseException e) {
			System.out.println("I couldn't parse this");
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("getUserByEmail.do")
	public ModelAndView ValidatePassword(@RequestParam("email") String email,
			@RequestParam("password") String password) {
		System.out.println("I come in to the getUserByEmail method with " + email + " and as my password " + password);
		User user = dao.getUserByEmail(email);
		System.out.println("The user I have in the getUserByEmail method is: " + user.getId());
		System.out.println("The password I have stored is: " + password);
		if (password.equals(dao.matchUserPassword(email))) {
			System.out.println("I match");
			ModelAndView mv = new ModelAndView();
			mv.addObject("user", user);
			mv.setViewName("ArtistList.jsp");
			return mv;
		} else {
			System.out.println("I don't match");
			ModelAndView mv = new ModelAndView();
			mv.addObject("user", user);
			mv.setViewName("index.jsp");
			return mv;
		}

	}

}
