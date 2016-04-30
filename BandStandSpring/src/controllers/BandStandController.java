package controllers;

import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.Assignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.BandStandDAO;
import entities.Artist;

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
		return "index.jsp";
	}

	@RequestMapping("setUserAccessToUser.do")
	public String setUserAccessToUser(@RequestParam("userID") int id) {
		dao.setUserAccessLevelToUser(id);
		return "index.jsp";
	}

	@RequestMapping("getAllArtists")
	public ModelAndView getAllArtist() {
		ModelAndView mv = new ModelAndView();
		List<Artist> allArtists = dao.getAllArtists();
		for (Artist artist : allArtists) {
			System.out.println(artist.getName());
		}
		mv.addObject("allArtists", allArtists);
		mv.setViewName("index.jsp");
		return mv;
	}

	@RequestMapping("getArtistById.do")
	public ModelAndView getArtistById(@RequestParam("artistID") int artistID) {
		ModelAndView mv = new ModelAndView();
		Artist artist = dao.getArtistById(artistID);
		System.out.println(artist.getName());
		mv.addObject(artist);
		mv.setViewName("index.jsp");
		return mv;
	}
}
