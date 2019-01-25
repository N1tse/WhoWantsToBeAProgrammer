<%-- 
    Document   : editQuestion
    Created on : 24 Ιαν 2019, 6:51:54 μμ
    Author     : Νίκος
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
 <form action="deleteQuestion${quest.id}" method="post" modelAttribute="question">
  <div class="form-group">
      <span>Number Of Question ${quest.id}</span>
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Question</label>
    <input type="text" name="question" value="${quest.question}" class="form-control" id="formGroupExampleInput2" >
  </div>
   <div class="form-group">
    <label for="formGroupExampleInput3">Answer A</label>
    <input type="text" name="a" value="${quest.a}" class="form-control" id="formGroupExampleInput3" >
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput4">Answer B</label>
    <input type="text" name="b" value="${quest.b}" class="form-control" id="formGroupExampleInput4" >
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput5">Answer C</label>
    <input type="text" name="c" value="${quest.c}" class="form-control" id="formGroupExampleInput5" >
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput6">Answer D</label>
    <input type="text" name="d" value="${quest.d}" class="form-control" id="formGroupExampleInput6">
  </div>
   <div class="form-group">
    <label for="formGroupExampleInput7">Correct Answer</label>
    <input type="text" name="correct" value="${quest.correct}" class="form-control" id="formGroupExampleInput7">
  </div>
   
   
  
  <button type="submit" class="btn btn-danger">Delete</button>
</form>
   <a href="homeAdmin"><button type="submit" class="btn btn-primary">Cancel</button></a>
 </body>
</html>
