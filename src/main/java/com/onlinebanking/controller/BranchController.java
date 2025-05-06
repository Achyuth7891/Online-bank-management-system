package com.onlinebanking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onlinebanking.dao.BranchDao;
import com.onlinebanking.model.Branch;

@Controller
public class BranchController {
	
	@Autowired
	private BranchDao branchDao;
	
	@GetMapping("/addbranch")
	public String gotToLoginPage() {
		return "addbranch";
	}
	
	@PostMapping("/addbranch")
	public ModelAndView addBranch(@ModelAttribute Branch branch) {
      ModelAndView mv = new ModelAndView();
		
		branchDao.save(branch);
		
		mv.addObject("status", "Branch Added Successfully.");
		mv.setViewName("index");
		return mv;
	}

}
