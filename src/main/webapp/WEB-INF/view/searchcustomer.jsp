<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Customer</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
  <div class="row mt-4">
       <form class="form-inline ml-5" action="searchcustomer">
          <div class="form-group">
            <label for="inputPassword2" class="text-color"><h4>Search Customer By Mobile</h4></label>
            <input type="text" class="form-control ml-3" id="inputPassword2" name="mobileNo" placeholder="Enter Mobile no..">
          </div>
          <button type="submit" class="btn text-color custom-bg ml-2">Search</button>
       </form>
  </div>
  <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-color">
    <tr>
      <th scope="col">Customer Id</th>
      <th scope="col">First Name</th> 
      <th scope="col">Last Name</th>    
      <th scope="col">Mobile No</th>
      <th scope="col">Date of Birth</th>
      <th scope="col">Gender</th>
      <th scope="col">Branch</th>
      <th scope="col">Permanent Address</th>
      <th scope="col">Present Address</th>
      <th scope="col">Register Date</th> 
    </tr>
  </thead>
  
   <%
      List<Customer> customers = (List<Customer>)request.getAttribute("customers");
    %>
  <tbody>
   <%
      if(customers != null) { 
    	  for(Customer c: customers) {
    		  
    		  Branch b =null;
    		  Optional<Branch> ob = branchDao.findById(c.getBranchId());
    		  if(ob.isPresent()) {
    			  b = ob.get();
    		  }
    		  
   %>
    <tr class="text-center">
      <td class="mid-align"><%=c.getId()%></td>
      <td class="mid-align"><%=c.getFirstName()%></td>
      <td class="mid-align"><%=c.getLastName()%></td>
      <td class="mid-align"><%=c.getPhoneNumber()%></td>
      <td class="mid-align"><%=c.getDob()%></td>
      <td class="mid-align"><%=c.getGender()%></td>
      <td class="mid-align"><%=b.getName()%></td>
      <td class="mid-align"><%=c.getPermentAddress()%></td>
      <td class="mid-align"><%=c.getPresentAddress()%></td>
      <td class="mid-align"><%=c.getDate()%></td>
      
    </tr>
     <%
    	  }
      }
    %>
    
  </tbody>
   
</table>
   </div>
</div>

</body>
</html>