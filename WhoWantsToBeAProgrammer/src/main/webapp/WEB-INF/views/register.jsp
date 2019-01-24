<%-- 
    Document   : register
    Created on : 20 Ιαν 2019, 7:28:01 μμ
    Author     : theod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Register Page</title>
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
			<h1 class="logo-caption"><span class="tweak">R</span>egister</h1>
		</div><!-- /.logo -->
                <form action="addUserController" method="POST" enctype="multipart/form-data">
		<div class="controls">
                <input type="text" name="username" placeholder="Username" class="form-control" />
                <input type="text" name="fname" placeholder="First-name" class="form-control" />
                <input type="text" name="lname" placeholder="Last-name" class="form-control" />
                <input type="password" name="password" placeholder="Password" class="form-control" />
                <input type="file" name="image" value="resources/images/user_icon.png"/>
                
			<button type="submit" class="btn btn-default btn-block btn-custom">Register</button>
		</div><!-- /.controls -->
                </form>
	</div><!-- /#login-box -->
</div><!-- /.container -->
        <div id="particles-js"></div>
    </body>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>
    <script src="resources/js/main.js"></script>
</html>
