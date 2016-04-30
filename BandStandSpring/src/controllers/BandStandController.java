package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.BandStandDAO;

@Controller
public class BandStandController {

	@Autowired
	private BandStandDAO dao;
	
	@RequestMapping("getUserAccess.do")
	public ModelAndView getUserAccessLevel(@RequestParam("userID") int id){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		int accessLevel = dao.getAdminLevel(id);
		mv.addObject(accessLevel);
		System.out.println(accessLevel);
		
		return mv;
	}

	@RequestMapping("setUserAccessToAdmin.do")
	public String setUserAccessToAdmin(@RequestParam("userID") int id){
		dao.setUserAccessLevelToAdmin(id);
		return "index.jsp";
	}
}
