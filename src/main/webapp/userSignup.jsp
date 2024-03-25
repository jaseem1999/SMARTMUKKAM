<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <title>sign in</title>
    <style type="text/css">
    body{
   		background: url("images/mukkamBridge.jpg") no-repeat center center fixed;
        background-size: cover;
    }
    
    .profileImg{
		width: 70px;
		height: 100px;
		border-radius: 50%;
	}
	#center{
		text-align: center;
	}
	.error{
		margin-top: 5px;
		color: red;
	}
    
    
    </style>
    
    
    </head>
    
    
    
<body>
<%
String email = (String) session.getAttribute("emailVerification");
%>
    <div class="container">
    	<form  onsubmit="return validateForm()" action="userSignup" method="post" enctype="multipart/form-data" class="card" style="margin-top: 70px; margin-bottom: 50px;">
   			 <div class="row" style="margin: 10px;">

        <div class="col">

            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input value=<%=email %> type="hidden" class="form-control" id="email" name="email" >
                <span class="error" id="emailError"></span>
            </div>


            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter full name">
                <span class="error" id="nameError"></span>
            </div>


            <div class="mb-3">
                <label for="phone" class="form-label">Phone no</label>
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter mobile number">
                <span class="error" id="phoneError"></span>
            </div>


            <label for="password" class="form-label">Password</label>
            <input type="password" id="password" name="password" class="form-control" aria-describedby="passwordHelpBlock">
            <div id="passwordHelpBlock" class="form-text">
                Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
            </div>

            <div class="mb-3">
                <label for="conPassword" class="form-label">Confirm password</label>
                <input type="password" id="conPassword" name="conPassword" class="form-control" aria-describedby="passwordHelpBlock">
            </div>
            <span class="error" id="passwordError"></span>
            <span class="error" id="confirmPasswordError"></span>
            <div class="mb-3">
                <label for="country" class="form-label">Country</label>
                <select class="form-select" id="country" name="country">
                  
                   	 <option value="in" selected>India</option>
					    <option value="us">United States</option>
					    <option value="ca">Canada</option>
					    <option value="uk">United Kingdom</option>
					    <option value="au">Australia</option>
					    <option value="de">Germany</option>
					    <option value="fr">France</option>
					    <option value="jp">Japan</option>
					    <option value="cn">China</option>
					    <option value="br">Brazil</option>
					    <option value="ru">Russia</option>
					    <option value="za">South Africa</option>
					    <option value="mx">Mexico</option>
					    <option value="it">Italy</option>
					    <option value="es">Spain</option>
					    <option value="ar">Argentina</option>
					    <option value="ng">Nigeria</option>
					    <option value="eg">Egypt</option>
					    <option value="kr">South Korea</option>
					    <option value="id">Indonesia</option>
					    <option value="tr">Turkey</option>
					    <option value="ir">Iran</option>
					    <option value="sa">Saudi Arabia</option>
					    <option value="my">Malaysia</option>
					    <option value="pk">Pakistan</option>
					    <option value="pl">Poland</option>
					    <option value="th">Thailand</option>
					    <option value="se">Sweden</option>
					    <option value="nl">Netherlands</option>
					    <option value="be">Belgium</option>
					    <option value="at">Austria</option>
					    <option value="ch">Switzerland</option>
					    <option value="sg">Singapore</option>
					    <option value="nz">New Zealand</option>
					    <option value="ae">United Arab Emirates</option>
					    <option value="co">Colombia</option>
					    <option value="ve">Venezuela</option>
					    <option value="ph">Philippines</option>
					    <option value="pe">Peru</option>
					    <option value="dk">Denmark</option>
					    <option value="fi">Finland</option>
					    <option value="cz">Czech Republic</option>
					    <option value="hu">Hungary</option>
					    <option value="gr">Greece</option>
                </select>
                <span class="error" id="countryError"></span>
            </div>
        </div>

        <div class="col">
            <div id="center">
                <img class="profileImg" alt="" src="images/User-Profile.png" id="updatedImg" style="width: 100px; margin-top: -60px;" /><br>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label ">Upload Image:</label>
                <input class="form-control custom-file-input" type="file" id="image" name="image" accept="image/*" onchange="displayImage()">
                <span class="error" id="imgErorr"></span>
            </div>
            <div class="mb-3">
                <label for="surname" class="form-label">Surname</label>
                <input type="text" class="form-control" id="surname" name="surname" placeholder="Enter surname" required="required">
                <span class="error" id="surnameErorr"></span>
            </div>
            <div class="mb-3">
                <label for="address1" class="form-label">Address 1</label>
                <input type="text" class="form-control" id="address1" name="address1" placeholder="Enter address 1" required="required">
                <span class="error" id="addressErorr"></span>
            </div>
            <div class="mb-3">
                <label for="address2" class="form-label">Address 2</label>
                <input type="text" class="form-control" id="address2" name="address2" placeholder="Enter address 2" required="required">
            </div>
            <div class="mb-3">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city" placeholder="Enter city" required="required">
                <span class="error" id="cityErorr"></span>
            </div>
            <div class="mb-3">
                <label for="state" class="form-label">State</label>
                <input type="text" class="form-control" id="state" name="state" placeholder="Enter state" required="required">
                <span class="error" id="stateErorr"></span>
            </div>
            <div class="mb-3">
                <label for="state" class="form-label">PIN</label>
                <input type="number" class="form-control" id="pin" name="pin" placeholder="Enter pin" required="required">
            </div>
        </div>
		<input type="submit" class="btn btn-primary" value="Sign in">
    </div>
    
    
	</form>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    
    <script type="text/javascript">
    function displayImage() {
    	var input = document.getElementById('image');
    	var img = document.getElementById('updatedImg');

    	var file = input.files[0];
    	var reader = new FileReader();

    	if (!file) {
    	img.src = "images/User-Profile.png"; // Set default image source
    	return;
    	}


    	reader.onload = function(e) {
    	img.src = e.target.result;
    	}

    	reader.readAsDataURL(file);
    	}


	

   

    </script>
    <script type="text/javascript">
    function validateForm() {
        let email = document.getElementById("email").value;
        let name = document.getElementById("name").value;
        let phone = document.getElementById("phone").value;
        let password = document.getElementById("password").value;
        let confirmPassword = document.getElementById("conPassword").value;
        let country = document.getElementById("country").value;
        let status = true;

        function isValidPhoneNumber(num) {
            return /^\d{10}$/.test(num);
        }

        if (name.match(/^[0-9]+$/) || name === "") {
            document.getElementById("nameError").innerHTML = "Please enter valid name, don't use numbers";
            status = false;
        } else {
            document.getElementById("nameError").innerHTML = "";
        }

        if (!(email.includes("@") && email.includes("."))) {
            document.getElementById("emailError").innerHTML = "Please enter a valid email";
            status = false;
        } else {
            document.getElementById("emailError").innerHTML = "";
        }

        if (isValidPhoneNumber(phone)) {
            document.getElementById("phoneError").innerHTML = "";
        } else {
            document.getElementById("phoneError").innerHTML = "Please enter a valid number";
            status = false;
        }

        if (password !== confirmPassword || !(password.length >= 8 && /[a-z]/.test(password) && /[A-Z]/.test(password) && /\d/.test(password) && /[^a-zA-Z\d]/.test(password)) ) {
       
            document.getElementById("passwordError").innerHTML = "Password must be strong (use A-Z, a-z, 0-9, special character, and be at least 8 characters long or Passwords do not match)";
            status = false;
        } else {
            document.getElementById("passwordError").innerHTML = "";
        }

        if (country === "") {
            document.getElementById("countryError").innerHTML = "Please select a country";
            status = false;
        }
        console.log(status);
        return status;
    }
    </script>
</body>
</html>
