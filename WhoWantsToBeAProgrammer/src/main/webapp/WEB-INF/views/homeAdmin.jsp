<%-- 
    Document   : homeAdmin
    Created on : 23 Ιαν 2019, 8:45:45 μμ
    Author     : Νίκος
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    </head>
    <body>
        <a href="viewQuestions"><button type="button" class="btn btn-secondary">All Question</button></a>
        <a href="addQuestion"><button type="button" class="btn btn-secondary">Add Question</button></a>
        <a href="logoutAdmin"><button type="button" class="btn btn-secondary">Log Out</button></a>
        
        <h1>${list.size()}</h1>
        <p>${insert}</p>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Question_id</th>
      <th scope="col">Question</th>
      <th scope="col">A</th>
      <th scope="col">B</th>
      <th scope="col">C</th>
      <th scope="col">D</th>
      <th scope="col">Correct</th>
      <th scope="col">Subject</th>
    </tr>
  </thead>
  <tbody>
       <c:forEach items="${list}" var="q">   
            <tr>
            <td>${q.id}</td>
            <td>${q.question}</td>
            <td>${q.a}</td>  
            <td>${q.b}</td>
            <td>${q.c}</td>  
            <td>${q.d}</td>  
            <td>${q.correct}</td>
            <td>${q.subject}</td>
            <td><a href="editQuestion${q.id}"><button type="button" class="btn btn-primary">edit</button></a></td>
            <td><a href="deleteQ${q.id}"><button type="button" class="btn btn-danger">delete</button></a></td>
            <td><a href></a></td>
            </tr>
       
     </c:forEach> 
  </tbody>
</table>

       
    </body>
</html>
