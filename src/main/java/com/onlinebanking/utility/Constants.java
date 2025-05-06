package com.onlinebanking.utility;

public class Constants {
	
	public enum Gender {
		MALE("Male"),
		FEMALE("Female");
		
		private String gender;

	    private Gender(String gender) {
	      this.gender = gender;
	    }

	    public String value() {
	      return this.gender;
	    }
	     
	}
	
	public enum AccountType {
		SAVING("Saving"),
		CURRENT("Current");
		
		private String type;

	    private AccountType(String type) {
	      this.type = type;
	    }

	    public String value() {
	      return this.type;
	    }
	}
	
	public enum TransactionType {
		DEPOSIT("Deposit"),
		WITHDRAW("Withdraw"),
		ACCOUNT_TRANSFER("Account Transfer");
		
		private String type;

	    private TransactionType(String type) {
	      this.type = type;
	    }

	    public String value() {
	      return this.type;
	    }
	     
	}
	
	public enum AccountStatus {
		OPEN("Open"),
		LOCK("Lock");
		
		private String status;

	    private AccountStatus(String status) {
	      this.status = status;
	    }

	    public String value() {
	      return this.status;
	    }
	}

	public enum CheckbookStatus {
		NOT_APPLIED("Not Applied"),
		AAPLIED("Applied"),
		APPROVAL_PENDING("Approval Pending"),
		APPROVED("Approved");
		
		private String status;

	    private CheckbookStatus(String status) {
	      this.status = status;
	    }

	    public String value() {
	      return this.status;
	    }
	}
	
	
}
