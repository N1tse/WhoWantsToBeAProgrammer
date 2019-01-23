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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${q.subject}</title>
    </head>
    <body>
        <h1><b>${q.subject}</b> Question Page</h1>
        <form action="turn" method="POST" modelAttribute="question">
                <h3>${q.question}</h3>
                <input type="hidden" name="id" value="${q.id}">
                <input type="radio" name="correct" value="${q.a}">${q.a}<br>
                <input type="radio" name="correct" value="${q.b}">${q.b}<br>
                <input type="radio" name="correct" value="${q.c}">${q.c}<br>
                <input type="radio" name="correct" value="${q.d}">${q.d}<br>
            <input id="clickme" type="submit" value="submit">
          </form>
    </body>
</html>
