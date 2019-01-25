<%-- 
    Document   : questionView
    Created on : Jan 21, 2019, 1:06:49 PM
    Author     : ntsep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>${q.subject}</title>
        <link rel="stylesheet" href="resources/css/questionView.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="js/jsquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <link rel="stylesheet" href="resources/css/main.css" />
        <style>
            @import url('https://fonts.googleapis.com/css?family=Lato');

body, html{
  height: 100%;
  font-family: 'Lato', sans-serif;
}
.container{
  display: block;
  position: relative;
  margin: 40px auto;
  height: auto;
  width: 600px;
  padding: 20px;
  z-index:2;
}
#particles-js{
    width: 100%;
    height: 100%;
    background-size: cover;
    background-position: 50% 50%;
    position: fixed;
    top: 0px;
    z-index: 1;
}
h1{
    font-size: 50px;
    text-align: center;
    padding-top: 70px;
    color: chartreuse;
    opacity: 0.6;
}

h2{
 color: #AAAAAA;
 font-size:40px;
}

.container ul{
  list-style: none;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.container ul li{
  color: #AAAAAA;
  display: block;
  position: relative;
  float: left;
  width: 100%;
  height: 100px;
  border-bottom: 1px solid #333;
}

ul li input[type=radio]{
  position: absolute;
  visibility: hidden;
}

ul li label{
  display: block;
  position: relative;
  font-weight: 300;
  font-size: 1.35em;
  padding: 25px 25px 25px 80px;
  margin: 10px auto;
  height: 30px;
  z-index: 9;
  cursor: pointer;
  -webkit-transition: all 0.25s linear;
}

ul li:hover label{
	color: #D9534F;
}

ul li .check{
  display: block;
  position: absolute;
  border: 5px solid #AAAAAA;
  border-radius: 100%;
  height: 25px;
  width: 25px;
  top: 30px;
  left: 20px;
  z-index: 5;
  transition: border .25s linear;
  -webkit-transition: border .25s linear;
}

ul li:hover .check {
  border: 5px solid #FFFFFF;
}

ul li .check::before {
  display: block;
  position: absolute;
  content: '';
  border-radius: 100%;
  height: 15px;
  width: 15px;
  top: 5px;
  left: 5px;
  margin: auto;
  transition: background 0.25s linear;
  -webkit-transition: background 0.25s linear;
}

input[type=radio]:checked ~ .check {
  border: 5px solid #0DFF92;
}

input[type=radio]:checked ~ .check::before{
  background: #0DFF92;
}

input[type=radio]:checked ~ label{
  color: #0DFF92;
}

#clickme{
    transition: .7s;
    margin-top:20px;
}

#clickme:hover{
    transform: scale(1.5);
}

#logoutid{
    color: white;
    font-size: 20px;
    
}
#okai{
    display: flex;
    flex-direction: column;
    }
            
        </style>
    </head>
    <body>
        
        <div class="text-center" style="width:100%; position: absolute; z-index: 1; background: transparent;">
                    <a class="navbar-brand" href="#" style="margin-top: 80px;">
                            <img src="resources/images/imagesMain.png" width="150px" height="150px" alt="">
                    </a>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light" style="background: #D9534F;">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                  
                    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="z-index:3;">
                      <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                          <a class="nav-link" style="color:white;" href="mainpage">HOME <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" style="color:white;" href="userProfile">PROFILE</a>
                        </li>
                        <li class="nav-item dropdown active">
                          <a class="nav-link dropdown-toggle active"  style="color:white;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            COURSES
                          </a>
                          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item"  style="color:black;" href="QuestionsController${"java"}">JAVA</a>
                             <div class="dropdown-divider"></div>
                            <a class="dropdown-item"  style="color:black;" href="QuestionsController${"c_sharp"}">C#</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item"  style="color:black;" href="QuestionsController${"javascript"}">JAVASCRIPT</a>
                             <div class="dropdown-divider"></div>
                             <a class="dropdown-item"  style="color:black;" href="QuestionsController${"python"}">PYTHON</a>
                          </div>
                          
                        </li>
                      </ul>
                      <div class="my-2 my-lg-0" id="okai">
                        <span id="login_name" style="color:white; font-size: 2em;margin-right: 1em;">${u.username}</span>
                        <span><img src="${'data:image/jpg;base64,'}${u.image }" style="height: 70px;border-radius: 50%;"></span>
                        <span><a href="logout" id="logoutid">LogOut</a></span>
                      </div>
                    </div>
                  </nav>
        <h1><b>${q.subject}</b> Question Page</h1>
                        <input type="hidden" name="id" value="${q.id}">

        <div class="container text-center">
        <form action="turn" method="POST" modelAttribute="question">
                <h2>${q.question}</h2>
                <input type="radio" name="correct" value="hgjgfjn" checked="checked" style="display:none;"/>
                <ul>
                    
                    <li>
                <input type="hidden" name="id" value="${q.id}">
                        <input type="radio" name="correct" id="a-option" value="${q.a}">
                        <label for="a-option">${q.a}</label>

                        <div class="check"></div>
                    </li>
                
                    <li>
                        <input type="radio" name="correct" id="b-option" value="${q.b}">
                        <label for="b-option">${q.b}</label>
                        
                        <div class="check"><div class="inside"></div></div>
                    </li>
                    
                    <li>
                        <input type="radio" name="correct" id="c-option" value="${q.c}">
                        <label for="c-option">${q.c}</label>
                        
                        <div class="check"><div class="inside"></div></div>
                    </li>
                    
                    <li>
                        <input type="radio" name="correct" id="d-option" value="${q.d}">
                        <label for="d-option">${q.d}</label>
                        
                        <div class="check"><div class="inside"></div></div>
                    </li>
                </ul>
            <button id="clickme" type="submit" class="btn btn-danger" >Next</button>
          </form>
        </div>
           <div id="particles-js" >
           </div>  
    </body>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>
    <script src="resources/js/main.js"></script>
</html>
