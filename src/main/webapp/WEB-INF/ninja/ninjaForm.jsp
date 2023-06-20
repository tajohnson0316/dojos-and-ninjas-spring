<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 6/20/2023
  Time: 2:19 PM
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
  <div class="mb-3">
    <h1>Create New Ninja</h1>
  </div>
  <div class="mb-3">
    <form:form action="/ninjas/new/create" method="post" modelAttribute="ninja">
      <div class="mb-3">
        <form:label path="dojo" class="form-label">
          Dojo Location:
        </form:label>
        <form:select path="dojo" class="form-select">
          <c:forEach var="dojo" items="${allDojos}">
            <form:option value="${dojo.id}">
              ${dojo.name}
            </form:option>
          </c:forEach>
        </form:select>
      </div>
      <div class="mb-3">
        <form:label path="firstName" class="form-label">
          First Name:
        </form:label>
        <form:input path="firstName" class="form-control"/>
        <p class="text-danger">
          <form:errors path="firstName"/>
        </p>
      </div>
      <div class="mb-3">
        <form:label path="lastName" class="form-label">
          Last Name:
        </form:label>
        <form:input path="lastName" class="form-control"/>
        <p class="text-danger">
          <form:errors path="lastName"/>
        </p>
      </div>
      <div class="mb-3">
        <form:label path="age" class="form-label">
          Age:
        </form:label>
        <form:input type="number" path="age" class="form-control" min="1"/>
        <p class="text-danger">
          <form:errors path="age"/>
        </p>
      </div>
      <div class="d-flex justify-content-end gap-3">
        <a href="/" class="btn btn-danger" role="button">Cancel</a>
        <button type="submit" class="btn btn-success">Add Ninja</button>
      </div>
    </form:form>
  </div>
</div>
</body>
</html>