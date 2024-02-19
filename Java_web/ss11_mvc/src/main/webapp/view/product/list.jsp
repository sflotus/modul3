<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 2/2/2024
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
    String mess = request.getParameter("mess");
    if (mess == null) {
        mess = "";
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
        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>name</th>
                <th>price</th>
                <th>description</th>
                <th>Action</th>
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
<script>
        if(mess != null){
            alert(${mess})
        }
</script>
</body>
</html>
