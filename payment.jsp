<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PAYMENT</title>
<script src=
    "https://smtpjs.com/v3/smtp.js">
  </script>
  
  <script type="text/javascript">
    function sendEmail() {
    	 var minm = 100000;
         var maxm = 999999;
         var otp = Math.floor(Math
         .random() * (maxm - minm + 1)) + minm;
      var mail=document.getElementById("mail").value;
      document.getElementById("otpcheck").innerHTML=otp;
      Email.send({
        Host: "smtp.gmail.com",
        Username: "rhythmdancestudio10@gmail.com",
        Password: "rhythm@41",
        To: mail,
        From: "rhythmdancestudio10@gmail.com",
        Subject: "Rhythm Dance Studio",
        Body: "Your Payment is successful! Thankyou! Happy Learning:)"+"\n"+otp+"This is your otp.",
      })
        .then(function (message) {
          alert("mail sent successfully")
        });
    }
  </script>
<style>


* {
	box-sizing: border-box;
}

body {
	background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url(https://wallpapercave.com/wp/JvCoA3p.jpg);
	font-family: 'Josefin Sans', sans-serif;
    font-family: 'Jost', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	margin: 0;
	background-repeat:no-repeat;
	background-size:cover;
}

.container {
	background-color:rgba( 0, 0, 0, 0.5);
    color:#fff;
    
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	width: 400px;
	max-width: 100%;
}

.header {
	border-bottom: 1px solid red;
	background-color: red;
	padding: 20px 40px;
}

.header h2 {
	margin: 0;
}

.form {
	padding: 30px 40px;	
}

.form-control {
	margin-bottom: 10px;
	padding-bottom: 20px;
	position: relative;
}

.form-control label {
	display: inline-block;
	margin-bottom: 5px;
}
p{
	font-size:13px;
	color:white;
}
a{
	text-decoration:none;
}

.form-control input {
	border: 2px solid white;
	border-radius: 4px;
	display: block;
	font-family: inherit;
	font-size: 14px;
	padding: 10px;
	width: 100%;
}

.form-control input:focus {
	outline: 0;
	border-color: #777;
}

.form-control.success input {
	border-color: #2ecc71;
}

.form-control.error input {
	border-color: #e74c3c;
}

.form-control i {
	visibility: hidden;
	position: absolute;
	top: 40px;
	right: 10px;
}

.form-control.success i.fa-check-circle {
	color: #2ecc71;
	visibility: visible;
}

.form-control.error i.fa-exclamation-circle {
	color: #e74c3c;
	visibility: visible;
}

.form-control small {
	color: #e74c3c;
	position: absolute;
	bottom: 0;
	left: 0;
	visibility: hidden;
}

.form-control.error small {
	visibility: visible;
}

.form button {
	background-color: red;
	border: 2px solid red;
	border-radius: 4px;
	color: #fff;
	display: block;
	font-family: inherit;
	font-size: 16px;
	padding: 10px;
	margin-top: 20px;
	width: 100%;
}
.form button:hover{
	background-color: white;
	color: red;
}

</style>
</head>
<body>
	
	<div class="container">
		<form id="form" class="form">
			<h2>OTP</h2>
			<div class="form-control">
				<label for="username">Email</label>
				<input type="text" name="uname" placeholder="Enter your EMAIL" id="mail" />
				<button onclick="sendEmail()" type="submit">SUBMIT</button>
			</div>
		</form>
		<form id="form" class="form">
			<div class="form-control">
				<label for="username">OTP</label>
				<input type="number" name="otp" placeholder="ENTER OTP" id="otpcheck"/>
				
			</div>
			
			<button  type="submit">CHECK OTP</button>
		</form>
	</div>
		
</body>
</html>