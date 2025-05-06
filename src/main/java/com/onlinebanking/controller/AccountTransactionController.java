package com.onlinebanking.controller;

import java.time.LocalDate;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onlinebanking.dao.AccountDao;
import com.onlinebanking.dao.AccountTransactionDao;
import com.onlinebanking.model.Account;
import com.onlinebanking.model.AccountTransaction;
import com.onlinebanking.model.Customer;
import com.onlinebanking.utility.Constants.AccountStatus;
import com.onlinebanking.utility.Constants.TransactionType;

@Controller
public class AccountTransactionController {
	
	@Autowired
	private AccountTransactionDao accountTransactionDao;
	
	@Autowired
	private AccountDao accountDao;
	
	@GetMapping("/withdraw")
	public String goToWithdraw() {
		return "withdraw";
	}

	@GetMapping("/deposit")
	public String goToDeposit() {
		return "deposit";
	}
	
	@PostMapping("/withdraw")
	public ModelAndView withdraw(@RequestParam("amount") double amount, @RequestParam("pin") int pin, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		Customer customer = (Customer)session.getAttribute("active-user");
		Account account = null;
		Optional<Account> o = accountDao.findById(customer.getId());
		if(o.isPresent()) {
			account = o.get();
		}
		
		if(account.getStatus().equals(AccountStatus.LOCK.value())) {
			mv.addObject("status", "Account is Locked, Please contact Bank Administrator!!!");
			mv.setViewName("index");
			return mv;
		}
		
		if(pin != account.getPin()) {
			mv.addObject("status", "Wrong Pin!");
			mv.setViewName("index");
			return mv;
		}
		
		if(account.getBalance() < amount ) {
			mv.addObject("status", "Insufficient Balance!");
			mv.setViewName("index");
			return mv;
		}
		
		else {
			double balanceAmount = account.getBalance() - amount;
			account.setBalance(balanceAmount);
			accountDao.save(account);
			
			AccountTransaction transaction = new AccountTransaction();
			transaction.setAccountId(account.getId());
			transaction.setAmount(amount);
			transaction.setDate(LocalDate.now().toString());
			transaction.setType(TransactionType.WITHDRAW.value());
			
			accountTransactionDao.save(transaction);
			
			mv.addObject("status", "Amount withdrawn successfully!");
			mv.setViewName("index");
			return mv;
			
		}
	}
	
	@PostMapping("/deposit")
	public ModelAndView deposit(@RequestParam("amount") double amount, @RequestParam("pin") int pin, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		Customer customer = (Customer)session.getAttribute("active-user");
		Account account = null;
		Optional<Account> o = accountDao.findById(customer.getId());
		if(o.isPresent()) {
			account = o.get();
		}
		
		if(account.getStatus().equals(AccountStatus.LOCK.value())) {
			mv.addObject("status", "Account is Locked, Please contact Bank Administrator!!!");
			mv.setViewName("index");
			return mv;
		}
		
		if(pin != account.getPin()) {
			mv.addObject("status", "Wrong Pin!");
			mv.setViewName("index");
			return mv;
		}
		
		else {
			double balanceAmount = account.getBalance() + amount;
			account.setBalance(balanceAmount);
			accountDao.save(account);
			
			AccountTransaction transaction = new AccountTransaction();
			transaction.setAccountId(account.getId());
			transaction.setAmount(amount);
			transaction.setDate(LocalDate.now().toString());
			transaction.setType(TransactionType.DEPOSIT.value());
			
			accountTransactionDao.save(transaction);
			
			mv.addObject("status", "Amount Deposit successfully!");
			mv.setViewName("index");
			return mv;
			
		}
	}
	
	@PostMapping("/accounttransfer")
	public ModelAndView accountTransfer(@RequestParam("toCardNo") String toCardNo,@RequestParam("amount") double amount, @RequestParam("pin") int pin, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		Customer customer = (Customer)session.getAttribute("active-user");
		Account account = null;
		Optional<Account> o = accountDao.findById(customer.getId());
		if(o.isPresent()) {
			account = o.get();
		}
		
		if(account.getStatus().equals(AccountStatus.LOCK.value())) {
			mv.addObject("status", "Account is Locked, Please contact Bank Administrator!!!");
			mv.setViewName("index");
			return mv;
		}
		
		if(account.getStatus().equals(AccountStatus.LOCK.value())) {
			mv.addObject("status", "Account is Locked, Please contact Bank Administrator!!!");
			mv.setViewName("index");
			return mv;
		}
		
		Account toAccount = accountDao.findByCardNo(toCardNo);
		
		if(toAccount == null) {
			mv.addObject("status", "Account to transfer is Invalid");
			mv.setViewName("index");
			return mv;
		}
		
		if(pin != account.getPin()) {
			mv.addObject("status", "Wrong Pin!");
			mv.setViewName("index");
			return mv;
		}
		
		if(amount < 1) {
			mv.addObject("status", "Amount should be greater than 0");
			mv.setViewName("index");
			return mv;
		}
		
		if(account.getBalance() < amount) {
			mv.addObject("status", "Insufficient Fund to Transfer!!!");
			mv.setViewName("index");
			return mv;
		}
		
		else {
			
			
			double balanceAmount = account.getBalance() - amount;
			account.setBalance(balanceAmount);
			accountDao.save(account);
			
			double recieverBalanceAmount = toAccount.getBalance() + amount;
			toAccount.setBalance(recieverBalanceAmount);
			accountDao.save(toAccount);
			
			AccountTransaction transaction = new AccountTransaction();
			transaction.setAccountId(account.getId());
			transaction.setAmount(amount);
			transaction.setDate(LocalDate.now().toString());
			transaction.setType(TransactionType.ACCOUNT_TRANSFER.value());
			transaction.setToAccountId(toAccount.getId());
			
			accountTransactionDao.save(transaction);
			
			mv.addObject("status", "Amount transferred Successfull!!!");
			mv.setViewName("index");
			return mv;
			
		}
	}
	
	@GetMapping("/accounttransfer")
	public String goToAccountTransferPage() {
		return "accounttransfer";
	}
	
}
