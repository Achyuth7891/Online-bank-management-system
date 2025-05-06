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

import com.onlinebanking.dao.CustomerDao;
import com.onlinebanking.model.Customer;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerDao customerDao;
	
	@GetMapping("/")
	public String gotToIndexPage() {
		return "index";
	}
	
	@GetMapping("/home")
	public String gotToHomePage() {
		return "index";
	}
	
	@GetMapping("/customerlogin")
	public String gotToLoginPage() {
		return "login";
	}
	
	@GetMapping("/customerregister")
	public String goToRegisterPage() {
		return "registeruser";
	}
	
	@PostMapping("/registercustomer")
	public ModelAndView registerCustomer(@ModelAttribute Customer customer) {
		ModelAndView mv = new ModelAndView();
		
		Customer c = customerDao.save(customer);
		
		mv.addObject("status", "Customer Successfully Registered, Customer Id is "+c.getId());
		mv.setViewName("addaccount");
		return mv;
	}
	
	@PostMapping("/logincustomer")
	public ModelAndView loginCustomer(@RequestParam("emailId") String emailId, @RequestParam("password") String password, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		Customer c = customerDao.findByEmailIdAndPassword(emailId, password);
		
		if(c != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", c);
			session.setAttribute("user-login","customer");
			mv.addObject("status", "Customer Logged in Successfully.");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", "Failed to login admin.");
			mv.setViewName("registeruser");
		}
		
		
		return mv;
	}
	
}
