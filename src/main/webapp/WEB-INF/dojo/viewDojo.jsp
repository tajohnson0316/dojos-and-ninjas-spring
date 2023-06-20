<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 6/20/2023
  Time: 12:32 PM
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
  <div class="d-flex justify-content-center">
    <div class="card w-100 mb-3">
      <div class="card-header">
        <div class="d-flex justify-content-between align-items-center">
          <h1>${dojo.name} Dojo's Active Ninjas</h1>
        </div>
      </div>
      <div class="card-body">
        <table class="table table-striped table-bordered">
          <thead>
          <tr>
            <th scope="col">Ninja Name</th>
            <th scope="col">Ninja Age</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="ninja" items="${dojo.ninjas}">
            <tr>
              <td>${ninja.firstName} ${ninja.lastName}</td>
              <td>${ninja.age}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <div class="d-flex justify-content-end mb-3">
    <form:form action="/dojos/delete/${dojo.id}" method="post">
      <input type="hidden" name="_method" value="delete"/>
      <button type="submit" class="btn btn-danger">Delete Dojo</button>
    </form:form>
  </div>
  <hr>
  <div class="mb-3">
    <h2>
      Add Ninja to Dojo
    </h2>
  </div>
  <div class="mb-3">
    <form:form action="/dojos/${dojo.id}/ninjas/new/create" method="post" modelAttribute="ninja">
      <form:input type="hidden" path="dojo" value="${dojo.id}"/>
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
      <button type="submit" class="btn btn-success">Add Ninja</button>
    </form:form>
  </div>
  <div class="d-flex justify-content-end">
    <a href="/">Go back to All Dojos page</a>
  </div>
</div>
</body>
</html>