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
				<h3>Login</h3>
				<input type="email" id="email" class="input form-control" placeholder="Email" />
				<br/>
				<input type="password" id="email" class="input form-control" placeholder="Password" />
				<br/>
				<p>Didn't have an account? <a href="signup.jsp">signup</a></p>
				<button id="login" class="input bg-primary form-control text-white" >Login</button>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</body>
</html> 