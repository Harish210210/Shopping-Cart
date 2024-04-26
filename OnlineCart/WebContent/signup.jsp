<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container p-5">
		<div class="row text-center"> 
			<div class="col-md-4"></div>
			<div class="col-md-4 login p-4">
				<h3>Signup</h3>
				<input type="email" id="email" class="input form-control" placeholder="Email" />
				<br/>
				<input type="number" id="mobile" class="input form-control" placeholder="Mobile" />
				<br/>
				<input type="password" id="password" class="input form-control" placeholder="Password" />
				<br/>
				<input type="password" id="cpassword" class="input form-control" placeholder="Confirm Password" />
				<br/>
				<button id="signup" class="input bg-primary form-control text-white" >Signup</button>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</body>
</html>