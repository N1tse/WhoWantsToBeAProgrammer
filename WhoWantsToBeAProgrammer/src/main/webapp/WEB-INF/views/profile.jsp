    <%-- 
    Document   : profile
    Created on : Jan 19, 2019, 6:17:41 PM
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
    <title>HomePage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link rel="stylesheet" href="boostrap/css/boostrap.min.css">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="resources/css/profile.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/css/main.css" />
    <style>
        #logoutid{
            color: white;
            font-size: 20px;
        }
        #okai{
            display: flex;
            flex-direction: column;
        }
        .contain{
            display: flex;
            justify-content: space-around;
            margin-top: 150px;
            font-size: 20px;
            text-align: center;
            color: aliceblue;
        }
        .row0{
            color: red;
        }
        .row1{
            color: darkorange;
        }
        .row2{
            color: gold;
        }
        .row3{
            color: forestgreen;
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
                          <a class="nav-link active" style="color:white;" href="mainpage">HOME <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" style="color:white;" href="userProfile">PROFILE</a>
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
                      <h5>${msg}</h5>
                      
                      <div class="contain">  
                        <div class="containJava">
                            <caption>Top 3 scores in Java</caption>
                          <table class="table">
                              <thead class="row0">
                                  <tr>
                                        <th scope="col">Position</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Score</th>
                                  </tr>
                              </thead>
                              <tbody class="row1">
                                  <tr>
                                        <th scope="col">1</th>
                                        <th scope="col">${topjava.get(0).username}</th>
                                        <th scope="col">${topjava.get(0).score}</th>
                                  </tr>
                              </tbody>
                              <tbody class="row2">
                                  <tr>
                                        <th scope="col">2</th>
                                        <th scope="col">${topjava.get(1).username}</th>
                                        <th scope="col">${topjava.get(1).score}</th>
                                  </tr>
                              </tbody>
                              <tbody class="row3">
                                  <tr>
                                        <th scope="col">3</th>
                                        <th scope="col">${topjava.get(2).username}</th>
                                        <th scope="col">${topjava.get(2).score}</th>
                                  </tr>
                              </tbody>
                          </table>    
                        </div>
                        <div class="containCsharp">
                          <caption>Top 3 scores in Csharp</caption>
                          <table class="table">
                              <thead class="row0">
                                  <tr>
                                        <th scope="col">Position</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Score</th>
                                  </tr>
                              </thead>
                              <tbody class="row1">
                                  <tr>
                                        <th scope="col">1</th>
                                        <th scope="col">${topcsharp.get(0).username}</th>
                                        <th scope="col">${topcsharp.get(0).score}</th>
                                  </tr>
                              </tbody >
                              <tbody class="row2">
                                  <tr>
                                        <th scope="col">2</th>
                                        <th scope="col">${topcsharp.get(1).username}</th>
                                        <th scope="col">${topcsharp.get(1).score}</th>
                                  </tr>
                              </tbody>
                              <tbody class="row3">
                                  <tr>
                                        <th scope="col">3</th>
                                        <th scope="col">${topcsharp.get(2).username}</th>
                                        <th scope="col">${topcsharp.get(2).score}</th>
                                  </tr>
                              </tbody>
                          </table>    
                      </div>
                      <div class="containJavascript">
                          <caption>Top 3 scores in Javascript</caption>
                          <table class="table">
                              <thead class="row0">
                                  <tr>
                                        <th scope="col">Position</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Score</th>
                                  </tr>
                              </thead>
                              <tbody class="row1">
                                  <tr>
                                        <th scope="col">1</th>
                                        <th scope="col">${topjavascript.get(0).username}</th>
                                        <th scope="col">${topjavascript.get(0).score}</th>
                                  </tr>
                              </tbody>
                              <tbody class="row2">
                                  <tr>
                                        <th scope="col">2</th>
                                        <th scope="col">${topjavascript.get(1).username}</th>
                                        <th scope="col">${topjavascript.get(1).score}</th>
                                  </tr>
                              </tbody>
                              <tbody class="row3">
                                  <tr>
                                        <th scope="col">3</th>
                                        <th scope="col">${topjavascript.get(2).username}</th>
                                        <th scope="col">${topjavascript.get(2).score}</th>
                                  </tr>
                              </tbody>
                          </table>    
                      </div>
                      <div class="containPython">
                          <caption>Top 3 scores in Python</caption>
                          <table class="table">
                              <thead class="row0">
                                  <tr>
                                        <th scope="col">Position</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Score</th>
                                  </tr>
                              </thead>
                              <tbody class="row1">
                                  <tr>
                                        <th scope="col">1</th>
                                        <th scope="col">${toppython.get(0).username}</th>
                                        <th scope="col">${toppython.get(0).score}</th>
                                  </tr>
                              </tbody>
                              <tbody class="row2">
                                  <tr>
                                        <th scope="col">2</th>
                                        <th scope="col">${toppython.get(1).username}</th>
                                        <th scope="col">${toppython.get(1).score}</th>
                                  </tr>
                              </tbody>
                              <tbody class="row3">
                                  <tr>
                                        <th scope="col">3</th>
                                        <th scope="col">${toppython.get(2).username}</th>
                                        <th scope="col">${toppython.get(2).score}</th>
                                  </tr>
                              </tbody>
                          </table>    
                      </div>
                    </div>
                                  <div id="particles-js" ></div>
<!--                      <div id="container1" class="container"style="margin-left:20%;">-->
<!--                          
                          <div class="jumbotron" >
                              <h1 id="mainheader">
                                C#
                              </h1>
                              <div id="paragraph1">
                              <p>C# is a general object-oriented programming (OOP) language for networking and Web development. C# is specified as a common language infrastructure (CLI) language.

In January 1999, Dutch software engineer Anders Hejlsberg formed a team to develop C# as a complement to Microsoft’s NET framework. Initially, C# was developed as C-Like Object Oriented Language (Cool). The actual name was changed to avert potential trademark issues. In January 2000, NET was released as C#. Its NET framework promotes multiple Web technologies.

The term is sometimes spelled as C Sharp or C-Sharp.</p>
                              </div>
                          </div>
                          
                      </div>
                      <div id="java"style="margin-left:20%;">
                          <div class="container">
                          <div class="jumbotron" >
                              <h1 id="mainheader">
                                Java
                              </h1>
                              <div id="paragraph1">
                              <p>ava is a programming language and computing platform first released by Sun Microsystems in 1995. There are lots of applications and websites that will not work unless you have Java installed, and more are created every day. Java is fast, secure, and reliable. From laptops to datacenters, game consoles to scientific supercomputers, cell phones to the Internet, Java is everywhere!

Is Java free to download?
Yes, Java is free to download. Get the latest version at java.com.

If you are building an embedded or consumer device and would like to include Java, please contact Oracle for more information on including Java in your device.

Why should I upgrade to the latest Java version?
The latest Java version contains important enhancements to improve performance, stability and security of the Java applications that run on your machine. Installing this free update will ensure that your Java applications continue to run safely and efficiently.

</p>
                              </div>
                          </div>
                          
                      </div>
                      </div>  
                      <div id="python" style="margin-left:20%;">
                       <div class="container">
                          <div class="jumbotron" >
                              <h1 id="mainheader">
                                Python
                              </h1>
                              <div id="paragraph1">
                              <p>Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. Its high-level built in data structures, combined with dynamic typing and dynamic binding, make it very attractive for Rapid Application Development, as well as for use as a scripting or glue language to connect existing components together. Python's simple, easy to learn syntax emphasizes readability and therefore reduces the cost of program maintenance. Python supports modules and packages, which encourages program modularity and code reuse. The Python interpreter and the extensive standard library are available in source or binary form without charge for all major platforms, and can be freely distributed.

Often, programmers fall in love with Python because of the increased productivity it provides. Since there is no compilation step, the edit-test-debug cycle is incredibly fast. Debugging Python programs is easy: a bug or bad input will never cause a segmentation fault. Instead, when the interpreter discovers an error, it raises an exception. When the program doesn't catch the exception, the interpreter prints a stack trace. A source level debugger allows inspection of local and global variables, evaluation of arbitrary expressions, setting breakpoints, stepping through the code a line at a time, and so on. The debugger is written in Python itself, testifying to Python's introspective power. On the other hand, often the quickest way to debug a program is to add a few print statements to the source: the fast edit-test-debug cycle makes this simple approach very effective.</p>
                              </div>
                          </div>
                           

                      </div>

                          </div>
                      <a  href="#container1" id="scroll-to-bottom" style="color: red;">LINK</a>-->
       
</body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>
<script src="resources/js/main.js"></script>
</html>
