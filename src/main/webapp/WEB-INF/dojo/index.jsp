<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 6/20/2023
  Time: 12:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  
  <title>Dojos and Ninjas</title>
</head>
<body>
<div class="container p-5">
  <div class="d-flex justify-content-center">
    <div class="card mb-3 w-100">
      <div class="card-header text-center">
        <h1>All Dojos</h1>
      </div>
      <div class="card-body">
        <c:forEach var="dojo" items="${allDojos}">
          <div class="mb-3 fs-4">
            <a href="/dojos/${dojo.id}">${dojo.name}</a>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
  <hr>
  <div>
    <h2>Add New Dojo</h2>
    <div class="mb-3">
      <form:form action="/dojos/create/new" method="post" modelAttribute="dojo">
        <div class="mb-3">
          <form:label path="name" class="form-label">Dojo name:</form:label>
          <form:input path="name" class="form-control w-50"/>
          <p>
            <form:errors path="name"/>
          </p>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form:form>
    </div>
    <a href="/ninjas/new/form">Or add a new ninja</a>
  </div>
</div>
</body>
</html>