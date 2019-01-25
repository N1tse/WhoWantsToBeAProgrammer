<%-- 
    Document   : addQuestion
    Created on : Jan 25, 2019, 10:56:03 AM
    Author     : ntsep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD QUESTION</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    </head>
    </head>
    <body>
        <h1>Add Question</h1>
        <form method="POST" action="addQ" modelAttribute="question">
  <div class="form-group">
                <label >Question</label>
                <input   class="form-control" type="textarea" name="question">
              </div>
            <div class="form-group">
                <label>First Answer</label>
                <input class="form-control" type="textarea" name="a">
              </div>
            <div class="form-group">
                <label>Second Answer</label>
                <input  class="form-control" type="textarea" name="b">
              </div>
            <div class="form-group">
                <label >Third Answer</label>
                <input  class="form-control"  type="text" name="c">
              </div>
            <div class="form-group">
                <label >Fourth Answer</label>
                <input  class="form-control" type="textarea" name="d">
              </div>
            <div class="form-group">
                <label >Correct <small>must be same with First or Second or Third or Fourth</small></label>
                <input  class="form-control" type="textarea" name="correct">
              </div>
              <div class="form-group">
                <label >Subject</label>
                <select class="form-control" name="subject_id">
                  <option value="1">JAVA</option>
                    <option value="2">C#</option>
                    <option value="3">JAVASCRIPT</option>
                    <option value="4">PYTHON</option>
                </select>
              </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            </form>
    </body>
</html>
