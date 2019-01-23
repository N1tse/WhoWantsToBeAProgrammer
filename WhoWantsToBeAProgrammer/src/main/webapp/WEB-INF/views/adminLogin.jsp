<%-- 
    Document   : adminLogin
    Created on : Jan 23, 2019, 8:09:22 PM
    Author     : ntsep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/css/main.css" />
</head>
<body>
<div class="container d-flex parent-div align-items-center justify-content-center">
	<div id="login-box" class="child-div">
		<div class="logo">
			<img src="resources/images/images.png" class="img img-responsive img-circle center-block "/>
			<h1 class="logo-caption"><span class="tweak">L</span>ogin Admin</h1>
		</div><!-- /.logo -->
		<div class="controls">
                    <form method="POST" action="loginAdminController" modelAttribute="user">
                         <input type="text" name="username" placeholder="Username" class="form-control" />
			<input type="password" name="password" placeholder="Password" class="form-control" />
			<button type="submit" class="btn btn-default btn-block btn-custom">Login</button>
                    </form>
		</div><!-- /.controls -->
	</div><!-- /#login-box -->
</div><!-- /.container -->
<div id="particles-js"></div>


</body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>
<script src="resources/js/main.js"></script>
</html>
