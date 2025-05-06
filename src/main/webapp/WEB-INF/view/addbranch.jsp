<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Account</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>

<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="components/message.jsp"%>
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Add Branch..!!</h3>
            <form action="addbranch" method="post">
            
                 
                 <div class="form-group">
                     <label for="email">Branch Name</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="name" placeholder="Enter name.." required>
                 </div>
            
                 <div class="form-group">
                     <label for="email">City</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="city" placeholder="Enter city.." required>
                 </div>
    
                 <div class="form-group">
                     <label for="email">State</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="state" placeholder="Enter state.." required>
                 </div>
                      
                 
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Add Branch</b></button>
                </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>