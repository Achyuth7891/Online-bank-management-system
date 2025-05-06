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
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<%@ include file="components/message.jsp"%>
					<div class="card-body px-5">
						<h3 class="text-center my-3">Add Account..!!</h3>
						<form action="addaccount" method="post">
							<input type="hidden" name="date"
								value="<%=java.time.LocalDate.now().toString()%>" />

							<div class="row mt-2">
								<div class="col-md-6">
									<label for="email">Customer Id</label> <input type="text"
										class="form-control" id="username"
										aria-describedby="emailHelp" name="customerId"
										placeholder="Enter customerId.." required>
								</div>

								<div class="col-md-6">
									<label for="email">Card No</label> <input type="text"
										class="form-control" id="username"
										aria-describedby="emailHelp" name="cardNo"
										placeholder="Enter card no.." required>
								</div>
							</div>

							<div class="row mt-2">
								<div class="col-md-6">
									<label for="email">Account Type</label> <select name="type"
										class="form-control">
										<option value="0">Select Account Type</option>
										<%
										for (Constants.AccountType type : Constants.AccountType.values()) {
										%>
										<option value="<%=type.value()%>"><%=type.value()%></option>
										<%
										}
										%>
									</select>
								</div>

								<div class="col-md-6">
									<label for="email">Balance</label> <input type="text"
										class="form-control" id="username"
										aria-describedby="emailHelp" name="balance"
										placeholder="Enter balance.." required>
								</div>
							</div>



							<%
							String otpp = OTP.generateOTP(5);
							%>

							<div class="row mt-2">
								<div class="col-md-6">
									<label for="email">Atm Pin</label> <input type="text"
										class="form-control" id="username"
										aria-describedby="emailHelp" name="pin" value="<%=otpp%>"
										required>
								</div>

								<div class="col-md-6">
									<label for="email">Account Status</label> <select name="status"
										class="form-control">
										<option value="0">Select Account Status</option>
										<%
										for (Constants.AccountStatus type : Constants.AccountStatus.values()) {
										%>
										<option value="<%=type.value()%>"><%=type.value()%></option>
										<%
										}
										%>
									</select>
								</div>
							</div>



							<div class="container text-center mt-4">
								<button class="btn custom-bg text-color">
									<b>Add Account</b>
								</button>
							</div>

						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>