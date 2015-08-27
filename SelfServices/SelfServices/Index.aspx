<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SelfServices.Index" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="/Styles/bootstrap.min.css" />
    <link rel="stylesheet" href="/Styles/index.min.css" />
    <link rel="stylesheet" type="text/css" href="/Styles/slick_rft.css" media="screen" />
    <script type="text/javascript" src="/Scripts/jquery-1.11.3.min.js"></script>    
    <script type="text/javascript" src="/Scripts/scripts.js"></script>
    <style type="text/css">
    	html, body {
    		height: 100%;
    		margin: 0;
            background: url("/Images/1.jpg") repeat center center fixed;            
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            
    	}
        #wrapper {
            display: flex;
  justify-content: center;
  position: relative;
  min-width: 100%;
  min-height: 100%;
  background-color:rgba(255,0,0,0.5)
}
#inner {
  align-self: center;
}
    </style>
    <!--[if lte IE 6]>
    <style type="text/css">
    	#container {
    		height: 100%;
    	}
    </style>
    <![endif]-->

</head>

<body>    
<div id="wrapper">
<div id="inner">
<section id="slick">
        <!-- Login input and label -->
        <input id="login" type="radio" class="login-selector" name="slick-forms"  checked="checked" />
        <label for="login" class="tabs entypo-home"></label>
        <!-- Register input and label -->
        <input id="register" type="radio" class="register-selector" name="slick-forms"/>
        <label for="register" class="tabs entypo-pencil"></label>        
        <!-- Reset input and label -->
        <input id="reset" type="radio" class="reset-selector" name="slick-forms" />
        <label for="reset" class="tabs entypo-archive"></label>
        <!-- White divider for hiding the shadow -->
        <div class="clrfx merge"></div>        
        <!-- Forms wrapper -->
        <div class="forms">
            <!-- Login form -->
            <div class="login-form">
                <!-- Title -->
                <div class="title">User login</div> 
                <!-- Intro text -->                
                <p class="intro">If you do not have an account click  <b><a href="#" style="color:#FF2424" onclick="toRegisterTab()">Register</a></b> tab</p>
                <!-- Form fields -->
                <form action="/Pages/Login.aspx" name="login" id="login" method="post">
                    <!-- Username input -->
                    <div class="field">
                        <input name="username" placeholder="Username" type="text" id="username" required />
                        <span class="entypo-user icon"></span>
                        <span class="slick-tip left">Enter your username</span>
                    </div>
                    <!-- Password input -->
                    <div class="field">
                        <input name="password" placeholder="Password" type="password" id="password" required />
                        <span class="entypo-lock icon"></span>
                        <span class="slick-tip left">Enter valid password</span>
                    </div>
                    <div class="field">
                        <br/>
                        <div id="loginError" class="errorMessage">
                            <div class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                <span class="sr-only">Error:</span>
                                Invalid username / password
                            </div>
                        </div>
                    </div>                    
                    <div class="clrfx mt-10"></div>                    
                    <!-- Send button -->
                    <input type="submit" value="Login" class="send" name="send" />
                </form>
                <!-- / Form fields -->
            </div>
            <!-- / Login form -->
            <!-- Register form -->
            <div class="register-form">
                <!-- Title -->
                <div class="title">Registration</div>      
                <!-- Intro text -->                
                <p class="intro">Register to use our services</p>           
                <!-- Form fields -->
                <form action="/Pages/Register.aspx" name="register" id="registerForm" method="post">
                    <!-- Username input -->
                    <div class="field">
                        <input name="username" placeholder="Username" type="text" id="regusername" required />
                        <span class="entypo-user icon"></span>
                        <span class="slick-tip left">Choose your username</span>
                    </div>
                    <!-- Customer Id input -->
                    <div class="field">
                        <input name="customerId" placeholder="Customer Id" type="text" id="customerId" required />
                        <span class="entypo-vcard icon"></span>
                        <span class="slick-tip left">Enter your customer id</span>
                    </div>
                    <!-- Password input -->
                    <div class="field">
                        <input name="password" placeholder="Password" type="password" id="regpassword" required />
                        <span class="entypo-lock icon"></span>
                        <span class="slick-tip left">Enter your password</span>
                    </div> 
                    <!-- Email input -->
                    <div class="field">
                        <input name="email" placeholder="Email" type="email" id="regemail" required />
                        <span class="entypo-mail icon"></span>
                        <span class="slick-tip left">Enter your email</span>
                    </div>                   
                    <!-- Security Question input -->
                    <div class="field">
                        <select name="securityQuestion" style="color:#999999"  id="securityQuestion" class="selectBoxInput" onmouseout="removeHighlightIcon()" onmouseover="highlightIcon()" onmousedown="highlightIcon()" onchange="changeColor()" required >
                            <option value="" disabled="disabled" selected="selected">- Select -</option>
                            <option>What is your pet's name?</option>
                            <option>What is your pet's name?</option>
                            <option>What is your pet's name?</option>
                            <option>What is your pet's name?</option>
                            <option>What is your pet's name?</option>
                        </select>                        
                        <span class="entypo-lock icon" id="selectIcon"></span>                        
                    </div>
                    <!-- Security Answer input -->
                    <div class="field">
                        <input name="securityAnswer" placeholder="Security Answer" type="text" id="securityAnswer" required />
                        <span class="entypo-lock icon"></span>
                        <span class="slick-tip left">Enter your security answer</span>
                    </div>
                    <div class="field">
                        <br/>
                        <div id="registerError" class="errorMessage">
                            <div class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                <span class="sr-only">Error:</span>
                                 Username / Customer Id already registered
                            </div>
                        </div>                        
                    </div>
                    <!-- Send button -->
                    <input type="submit" value="Register" class="send" form="registerForm" name="send" />
                </form>
                <!-- / Form fields -->
            </div>
            <!-- / Register form -->
            
            <!-- Reset form -->
            <div class="reset-form">
                <!-- Title -->
                <div class="title">Account reset</div> 
                <!-- Intro text -->
                <p class="intro">Forgot your username or lost your password? <b>No worries,</b> simply enter your username and we'll send you new login details.</p>
                <!-- Form fields -->
                <form action="" name="reset" id="reset" method="post">
                    <!-- Username input -->
                    <div class="field">
                        <input name="username" placeholder="Username" type="text" id="username" />
                        <span class="entypo-user icon"></span>
                        <span class="slick-tip left">Enter your username</span>
                    </div>
                    <div class="clrfx mt-10"></div>
                    <div class="w-47 mt-10">
                        <p class="small"><span class="entypo-clock"></span>Check your email in about 10 minutes.</p>
                    </div>
                    <!-- Send button -->
                    <input type="submit" value="Reset" class="send" form="reset" name="send" />
                </form>
                <!-- / Form fields -->
            </div>
            <!-- / Reset form -->
        </div>
        <!-- / Forms wrapper -->
    </section>

</div>
    
</div>
</body>
</html>