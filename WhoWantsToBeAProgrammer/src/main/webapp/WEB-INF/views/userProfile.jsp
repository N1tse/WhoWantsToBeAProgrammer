<%-- 
    Document   : userProfile
    Created on : Jan 23, 2019, 7:03:33 PM
    Author     : Yo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="js/jsquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="resources/css/main.css" >
    <link rel="stylesheet" href="resources/css/userProfile.css">
    <style>
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
                        <li class="nav-item active">
                          <a class="nav-link active" style="color:white;" href="userProfile">PROFILE</a>
                        </li>
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle"  style="color:white;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                      
        <div class="container" style="position: relative;"><br>
            <img src="${'data:image/jpg;base64,'}${u.image }" style="width: 100px;height: 100px;border-radius: 50%;" >
            
            <div class="page-header2 text-center">
                <h2 id="heading2">User Profile Info</h2>
            </div>
            <div class="containerC">
                <div class="column">
                    <div class="panel">
                        <div class="panelbody">Subject<label>Java</label></div>
                        <div class="panelscore">Total Score<label>${javaScore}</label></div>            
                    </div>
                </div>
                <div class="column">
                    <div class="panel">
                        <div class="panelbody">Subject<label>C#</label></div>
                        <div class="panelscore">Total Score<label>${cSharpScore}</label></div>              
                    </div>
                </div>
                <div class="column">
                    <div class="panel">
                        <div class="panelbody">Subject<label>Javascript</label></div>
                        <div class="panelscore">Total Score<label>${javascriptScore}</label></div>             
                    </div>
                </div>
                    <div class="column">
                    <div class="panel">
                        <div class="panelbody">Subject<label>Python</label></div>
                        <div class="panelscore">Total Score<label>${pythonScore}</label></div>             
                    </div>
                </div>
                
            </div>    
                <table class="table table-dark">
                    <thead>
                      <tr>
                        <th scope="col">DateTime</th>
                        <th scope="col">Subject</th>
                        <th scope="col">Score</th>
                        <th scope="col">Username</th>
                      </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${log}" var="log">
                      <tr>
                        <td>${log.date}</td>
                        <td>${log.subject}</td>
                        <td>${log.score}</td>
                        <td>${log.username}</td>
                      </tr>
                          </c:forEach>
                    </tbody>
                  </table>
    </div>
            
               <div id="particles-js"> </div>          
    </body>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>
    <script src="resources/js/main.js"></script>
</html>
