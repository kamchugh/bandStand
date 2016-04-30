package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import data.BandStandDAO;

@Controller
public class BandStandController {

	@Autowired
	private BandStandDAO dao;
	
	@RequestMapping("getUserAccess.do")
	public String getUserAccessLevel(){
		System.out.println("inside controller method");
		dao.setAdminLevelOn(1);
		return "index.jsp";
	}

	
}
