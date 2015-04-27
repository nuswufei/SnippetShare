package controller;

import java.io.IOException;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import DAO.*;
import Entity.*;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


@Controller
@RequestMapping("/*")
public class MVCController {
	private ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BoardDAO boardDAO;

	@RequestMapping(value="test", method= RequestMethod.GET)
	public String hello(HttpServletRequest req, Model model){
		model.addAttribute("userID", req.getRemoteUser());
		return "testAuthority";
	}
	
	@RequestMapping(value="user/test", method= RequestMethod.GET)
	public String helloUser(HttpServletRequest req, Model model){
		model.addAttribute("userID", req.getRemoteUser());
		return "testAuthority";
	}
	
	@RequestMapping(value="homepage", method= RequestMethod.GET)
	public String getHomepage() {
		return "homepage";
	}
	
	@RequestMapping(value="index", method= RequestMethod.GET)
	public String getIndex() {
		return "index";
	}
	
	
	
	@RequestMapping(value="signup", method= RequestMethod.POST)
	public String signnup(Model model, 
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("address") String address) {
		User user = (User) context.getBean("user");
		user.setUsername(username);
		user.setPassword(password);
		user.setName(name);
		user.setAddress(address);
		if(userDAO.insert(user)) return "index";
		else {
			model.addAttribute("errorMessage", "username already regiestred");
			return "signup";
		}
	}
	
	@RequestMapping(value="user/creatboard", method= RequestMethod.POST)
	public String creatBoard(Model model, HttpServletRequest req,
			@RequestParam("title") String title,
			@RequestParam("access") String access,
			@RequestParam("category") String category) {
		Board board = (Board) context.getBean("board");
		board.setTitle(title);
		board.setAccess(access);
		board.setCategory(category);
		board.setUsername(req.getRemoteUser());
		if(!(access.equals("public") || access.equals("private"))) {
			model.addAttribute("errorMessage", "invalid access value");
			return "error";
		}
		boardDAO.insert(board);
		return "redirect:getboards";
	}
	@RequestMapping(value="user/getboards", method= RequestMethod.GET)
	public String getBoard(Model model, HttpServletRequest req) {
		List<Board> ownList = boardDAO.findOwnBoard(req.getRemoteUser());
		model.addAttribute("ownList", ownList);
		return "pagelist";
	}
}
