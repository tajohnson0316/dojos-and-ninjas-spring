<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 6/20/2023
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<html>
<head>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  <script type="text/javascript" src="/js/app.js"></script>
  
  <title>Dojos and Ninjas</title>
</head>
<body>
<div class="container p-5">
  <div class="card w-100 mb-3">
    <div class="card-header text-center fs-3">
      ${ninja.firstName} ${ninja.lastName}
    </div>
    <div class="card-body">
      <div class="d-flex justify-content-start gap-2 align-items-center">
        <span class="fw-bold fs-4">Age:</span>
        <span class="fs-4">${ninja.age}</span>
      </div>
      <div class="d-flex justify-content-start gap-2 align-items-center">
        <span class="fw-bold fs-4">Location:</span>
        <span class="fs-4">${ninja.dojo.name}</span>
      </div>
      <div class="d-flex justify-content-start gap-2 align-items-center">
        <span class="fw-bold fs-4">Enrollment Date:</span>
        <span class="fs-4">
          <fmt:formatDate value="${ninja.createdAt}"/>
        </span>
      </div>
    </div>
  </div>
  <div class="d-flex justify-content-end">
    <a href="/">Back to All Dojos page</a>
  </div>
</div>
</body>
</html>