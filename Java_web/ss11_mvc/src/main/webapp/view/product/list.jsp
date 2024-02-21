<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 2/2/2024
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String mess = request.getParameter("mess");
    if(mess == null){
        mess="";
    }
%>
<html>
<head>
    <title>Product Management Application</title>
    <c:import url="../layout/Bootstrap.jsp"></c:import>
</head>
<body>
<center>
    <h1>Product Management</h1>
    <h2>
        <a href="/product?action=add">Add New Product</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5" class="table table-striped">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>DESCRIPTION</th>
            <th>ACTION</th>
        </tr>
        <c:forEach var="product" items="${productList}" varStatus="loop">
            <tr>
                <td>${product.getId()}</td>
                <td>${product.getName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescription()}</td>
                <td>
                    <a href="/product?action=update&id=${product.id}">Edit</a>
                    <a href="/product?action=delete&id=${product.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<button type="button" class="btn btn-primary" id="liveToastBtn" style="display: none
">Show live toast</button>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
<%--            <img src="..." class="rounded me-2" alt="...">--%>
            <strong class="me-auto">Notification</strong>
            <small>now</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            <span id="mess"><%=mess%></span>
        </div>
    </div>
</div>
<script>
    mess= document.getElementById("mess").textContent;
   const toastTrigger = document.getElementById('liveToastBtn')
   const toastLiveExample = document.getElementById('liveToast')
   if (toastTrigger) {
       const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
       if(!(mess ==="")){
           toastBootstrap.show()
       }
   }
</script>
</body>
</html>
