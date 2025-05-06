<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Admin</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>

<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4" >
            <div class="card card-border">
                <%@ include file="components/message.jsp"%>
                <div class="card-body px-5">
                    <img src="resources/images/registerphoto.jpeg" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
                    <h3 class="text-center my-3">Admin Register..!!</h3>
            <form action="adminregister" method="post">
          
                 <div class="form-group">
                     <label for="email">Admin Email</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="userId" placeholder="Enter email.." required>
                 </div>
                 
                 <div class="form-group">
                     <label for="email">Password</label>
                     <input type="password" class="form-control" id="username" aria-describedby="emailHelp" name="password" placeholder="Enter password.." required>
                 </div>  
        
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Register Admin</b></button>
                </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>