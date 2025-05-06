package com.onlinebanking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlinebanking.dao.AdminDao;
import com.onlinebanking.model.Admin;

@Controller
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/adminlogin")
	public String gotToLoginPage() {
		return "loginadmin";
	}
	
	@GetMapping("/adminregister")
	public String goToRegisterPage() {
		return "registeradmin";
	}
	
	@GetMapping("/addaccount")
	public String goToAddAccount() {
		return "addaccount";
	}
	
	@GetMapping("/admindashboard")
	public String goToAdminDashboard() {
		return "admindashboard";
	}
	
	@PostMapping("/adminregister")
	public ModelAndView registerAdmin(@ModelAttribute Admin admin) {
		ModelAndView mv = new ModelAndView();
		
		adminDao.save(admin);
		
		mv.addObject("status", "Admin Registered Successfully.");
		mv.setViewName("loginadmin");
		return mv;
	}
	
	@PostMapping("/adminlogin")
	public ModelAndView registerLogin(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		Admin admin = adminDao.findByUserIdAndPassword(userId, password);
		
		if(admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", admin);
			session.setAttribute("user-login","admin");
			mv.addObject("status", "Admin Logged in Successfully.");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", "Failed to login admin.");
			mv.setViewName("registeradmin");
		}
		
		
		return mv;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.addObject("status", "Logged out sucessfully!");
		mv.setViewName("index");
		return mv;
	}

}
