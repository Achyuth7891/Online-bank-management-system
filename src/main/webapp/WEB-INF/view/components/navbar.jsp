<%@ page import ="com.onlinebanking.model.*"%>
    <%@ page import ="com.onlinebanking.dao.*"%>
    <%@ page import ="com.onlinebanking.utility.*"%>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
    <%@ page import ="java.sql.*"%>
    <%@ page import ="java.util.*"%>
<nav class="navbar navbar-expand-lg navbar-light custom-bg">
  <a class="navbar-brand" href="/home">
    <img src="resources/images/logo.png" width="45" height="auto" class="d-inline-block" alt="">
   <i><b><span class="text-color">Online Banking System</span></b></i>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <%
     String userlogin = (String)session.getAttribute("user-login");
  ApplicationContext context =  WebApplicationContextUtils.getWebApplicationContext(getServletContext());
  AccountDao accountDao = context.getBean(AccountDao.class);
  AccountTransactionDao accountTransactionDao = context.getBean(AccountTransactionDao.class);
  AdminDao adminDao = context.getBean(AdminDao.class);
  BranchDao branchDao =context.getBean(BranchDao.class);
  CustomerDao customerDao =context.getBean(CustomerDao.class);
  CheckbookDao checkbookDao = context.getBean(CheckbookDao.class);
  
  Customer customer = null;
  Admin admin = null;
  Account account = null;
  
  Branch branch = null;
  if(userlogin != null && userlogin.equals("customer")) {
	  customer = (Customer)session.getAttribute("active-user");
	  
	   Optional<Account> o = accountDao.findById(customer.getId());
	   if(o.isPresent()) {
		   account = o.get();
	   }
	  
	   Optional<Branch> ob = branchDao.findById(customer.getBranchId());
	   if(ob.isPresent()) {
		   branch = ob.get();
	   }
  }
  
  else if(userlogin != null && userlogin.equals("admin")) {
	  admin = (Admin)session.getAttribute("admin");
  }
  
  %>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
       
    
      <li class="nav-item active  ml-5" data-toggle="modal" data-target=".aboutusmodal">
        <a class="nav-link"><b><span class="text-color">About us</span></b><span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active  ml-5" data-toggle="modal" data-target=".contactusmodal">
        <a class="nav-link text-color"><b><span class="text-color">Developers Contact</span></b></a>
      </li>
    </ul>
   </div>
   
  
  <%
     if(userlogin == null) {
  %>
 
 
 
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      
       <li class="nav-item active  ml-5">
        <a class="nav-link text-color" href="customerlogin"><b><span class="text-color">Login Customer</span></b></a>
       </li>
      
       <li class="nav-item active  ml-5">
        <a class="nav-link text-color" href="adminlogin"><b><span class="text-color">Login Admin</span></b></a>
       </li>
    </ul>
   </div>
   
  <%
     }
  
     else if(userlogin != null) {
  %>
    
   <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
    
     <%
       if(userlogin.equals("admin")) {
     %>
      
      <li class="nav-item active  ml-5">
        <a class="nav-link" href="admindashboard"><b><span class="text-color">Admin Dashboard</span></b><span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item active  ml-5">
        <a class="nav-link" href="customerregister"><b><span class="text-color">Add User</span></b><span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active  ml-5">
        <a class="nav-link" href="addaccount"><b><span class="text-color">Add Account</span></b><span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active  ml-5">
        <a class="nav-link" href="addbranch"><b><span class="text-color">Add Branch</span></b><span class="sr-only">(current)</span></a>
      </li>
     
      <%
       }
     
       else if(userlogin.equals("customer")){
      %>
      <li class="nav-item active  ml-5">
        <a class="nav-link" href="withdraw"><b><span class="text-color">Withdraw Amount</span></b><span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active  ml-5">
        <a class="nav-link" href="deposit"><b><span class="text-color">Deposit Amount</span></b><span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active  ml-5">
        <a class="nav-link" href="accounttransfer"><b><span class="text-color">Account Transfer</span></b><span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active  ml-5" data-toggle="modal" data-target=".balancemodal">
        <a class="nav-link" href="#"><b><span class="text-color">Balance Check</span></b><span class="sr-only">(current)</span></a>
      </li>
      
       <li class="nav-item active  ml-5" data-toggle="modal" data-target=".fetchmodal">
        <a class="nav-link" href="#"><b><span class="text-color">Fetch Account Detail</span></b><span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active  ml-5" data-toggle="modal" data-target=".history">
        <a class="nav-link" href="#"><b><span class="text-color">Transaction history</span></b><span class="sr-only">(current)</span></a>
      </li>
  
        
      <%
       }
      %>
      
      <li class="nav-item active  ml-5">
         <a class="nav-link" href="logout"><b><span class="text-color">Logout</span></b><span class="sr-only">(current)</span></a>
       </li>   
    </ul>
  </div>
  <%
     }
  %>

  
</nav>

<!-- About us modal -->

<div class="modal fade aboutusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >About Project</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container">
        <p style="font-size:20px;">
          <b>
              A banking system is a group or network of institutions that provide financial services for us.
               These institutions are responsible for operating a payment system, providing loans, taking deposits,
                and helping with investments.
          </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- Developers Contact modal -->

<div class="modal fade contactusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Developers Contact</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container text-center">
        <p style="font-size:23px;">
            <b>
                <img src="resources/images/phonee.png" style="width:27px;" alt="img">+91 XXXXXXXXXX<br>
                <img src="resources/images/emaill.png" style="width:29px;" alt="img">xxxxx@gmail.com
            </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- Balance Check modal -->

<div class="modal fade balancemodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Total Balance</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container">
        <p style="font-size:20px;">
        <%
           double amount=0;
           if(customer != null && account != null){
        	  
        	    amount = account.getBalance();
          
        %>
          <b>
             Total Balance in the Account is : Rs <%=amount %>/-
          </b>
          <%
           }
           
           else if(customer != null && account == null) {
          %>
             <span style="color:red">No Account is connected with your Mobile, Please contact Bank Admin</span>
          <%
           }
          %>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- Fetch modal -->

<div class="modal fade fetchmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >My Account Detail</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container">
        <p style="font-size:20px;">
        <%
           
           
           if(userlogin != null && userlogin.equals("customer") && customer != null){
    
          
        %>
          <b class="text-center">
             First Name :- <%=customer.getFirstName() %><br>
             Last Name :- <%=customer.getLastName() %><br>
             Mobile no :- <%= customer.getPhoneNumber() %><br>
             Email Id :- <%= customer.getEmailId() %><br>
             Branch :- <%=branch.getName() %><br>
             City :- <%=branch.getCity() %><br>
             Card No :- <%if(account != null) { %>     <%=account.getCardNo() %><%} else { %> <span style="color:red">Account not connected</span> <%} %><br>
             ATM pin : <%if(account != null) { %>     ****<%} else { %> <span style="color:red">Account not connected</span> <%} %><br>
             Account Type : <%= account.getType() %><br>
            
             
             <% 
             Checkbook checkbook = checkbookDao.findByCustomerId(customer.getId());
            
             if(checkbook == null) {
             %>	
            <a
										href="requestCheckbook?customerId=<%=customer.getId()%>"><button
												type="button" class="btn custom-bg-2 text-black custom-bg">Request Checkbook</button>
									</a>
            <%	 
             }
             
             else {
             %>
                 Checkbook Status : <%= checkbook.getApprovalStatus() %><br>
             <%	 
             }
             
             %>
             <br>
             <%if(account != null) { %>
                 <a href="changepin">change pin</a>
             <%
             }
             %>
            
          </b>
          
          <%
           }
          %>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- History modal -->

<div class="modal fade history" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >My Transaction History</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
      
      <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Transaction Id</th>
      <th scope="col">Account No.</th>
      <th scope="col">Amount</th> 
      <th scope="col">To Card No</th>
      <th scope="col">Transaction Type</th>
      <th scope="col">Transaction Date</th>
    </tr>
  </thead>
  
 
  
  <tbody>
  
    <%
       if(account != null) {
    
       List<AccountTransaction> accountTransactions = accountTransactionDao.findByAccountId(account.getId());
    for (AccountTransaction accountTransaction : accountTransactions ) {
    %>
  
    <tr class="text-center">
      <td class="mid-align"><%=accountTransaction.getId() %></td>
      <td class="mid-align"><%=account.getCardNo() %></td>
      <td class="mid-align"><%=accountTransaction.getAmount() %></td>
      <%
									if (account.getType().equals(Constants.TransactionType.ACCOUNT_TRANSFER.value())) {
									%>
									<td class="mid-align"><%=accountDao.findById(accountTransaction.getToAccountId()).get().getCardNo()%></td>
									<%
									} else {
									%>
									<td class="mid-align">---</td>
									<%
									}
									%>
      
      <td class="mid-align"><%=accountTransaction.getType() %></td>
      <td class="mid-align"><%=accountTransaction.getDate() %></td>
    </tr>
    <%
    }
    
       }
    %>
    
    
  </tbody>
 
  
</table>
</div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->
