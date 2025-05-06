<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<div class="container-fluid d-flex justify-content-center align-items-center">
		
				<div class="card mt-2 mb-2" style="width: 750px">
					<%@ include file="components/message.jsp"%>
					<div class="card-body px-5">
						<img src="resources/images/registerphoto.jpeg"
							class="rounded mx-auto d-block" alt="img" height="90px"
							width="90px">
						<h3 class="text-center my-3">Customer Register..!!</h3>
						<form action="registercustomer" method="post">
							<input type="hidden" name="date"
								value="<%=java.time.LocalDate.now().toString()%>" />
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="firstName">First name</label> <input type="text"
											class="form-control" id="firstName" name="firstName"
											placeholder="Enter first name" required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="lastName">Last name</label> <input type="text"
											class="form-control" id="lastName" name="lastName"
											placeholder="Enter last name.." required>
									</div>
								</div>
							</div>

							<div class="row mt-2">
								<div class="col-md-6">
									<label for="email">Date Of Birth</label> <input type="date"
										class="form-control" id="username"
										aria-describedby="emailHelp" name="dob"
										placeholder="Enter date of birth.." required>
								</div>

								<div class="col-md-6">
									<label for="email">Mobile No.</label> <input type="number"
										class="form-control" id="username"
										aria-describedby="emailHelp" name="phoneNumber"
										placeholder="Enter phone number.." required>
								</div>
							</div>

							<div class="row mt-2">
								<div class="col-md-6">
									<label for="email">Email Id</label> <input type="text"
										class="form-control" id="username"
										aria-describedby="emailHelp" name="emailId"
										placeholder="Enter email id.." required>
								</div>

								<div class="col-md-6">
									<label for="email">Gender</label> <select name="gender"
										class="form-control">
										<option value="0">Select Gender</option>
										<%
										for (Constants.Gender gender : Constants.Gender.values()) {
										%>
										<option value="<%=gender.value()%>"><%=gender.value()%></option>
										<%
										}
										%>
									</select>
								</div>
							</div>

							<div class="row mt-2">
								<div class="col-md-6">
									<label for="email">Branch</label> <select name="branchId"
										class="form-control">
										<option value="0">Select Branch</option>
										<%
										for (Branch b : branchDao.findAll()) {
										%>
										<option value="<%=b.getId()%>"><%=b.getName()%></option>
										<%
										}
										%>
									</select>
								</div>



								<div class="col-md-6">
									<label for="email">Password</label> <input type="password"
										class="form-control" id="username"
										aria-describedby="emailHelp" name="password"
										placeholder="Enter username.." required>
								</div>
							</div>


							<div class="row mt-2">

								<div class="col-md-6">
									<label for="phone">Permanent Address</label>
									<textarea style="height: 90px" class="form-control"
										placeholder="Enter Permanent Address" name="permentAddress"
										required></textarea>
								</div>

								<div class="col-md-6">
									<label for="phone">Present Address</label>
									<textarea style="height: 90px" class="form-control"
										placeholder="Enter Present Address" name="presentAddress"
										required></textarea>
								</div>
							</div>


							<div class="container text-center mt-5">
								<button class="btn custom-bg text-color">
									<b>Register Customer</b>
								</button>
							</div>

						</form>
					</div>
				</div>


			</div>
		
</body>
</html>