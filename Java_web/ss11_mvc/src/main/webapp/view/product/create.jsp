<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product Management Application</title>
    <c:import url="../layout/Bootstrap.jsp"></c:import>
</head>
<body>
<center>
    <h1>Product Management</h1>
        <h2>Add New Product</h2>
<%--    <h2>--%>
<%--        <a href="product?action=product">List All Product</a>--%>
<%--    </h2>--%>
</center>
<div align="center">
    <form method="post">

        <table border="1" cellpadding="5">
            <tr>
                <th>Product Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" required/>
                </td>
            </tr>
            <tr>
                <th>Product price:</th>
                <td>
                    <input type="number" name="price" id="price" size="45" required/>
                </td>
            </tr>
            <tr>
                <th>Product description:</th>
                <td>
                    <input type="text" name="description" id="description" size="45" required/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="btn btn-primary" type="submit" value="Save" />
                    <input class="btn btn-primary" type="button" value="Cancel" onclick="window.location.href='/product?action=product'" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>