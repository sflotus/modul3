<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 1/29/2024
  Time: 8:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Result</title>
</head>
<body>
<h1>Product: ${productDescription}</h1>
<form action="/home" method="get">
    <table>
        <tr>
            <td>Discount Amount</td>
            <td>${discountAmount} vnd</td>
        </tr>
        <tr>
            <td>Discount Price</td>
            <td>${discountPrice} vnd</td>
        </tr>
    </table>
    <button type="submit">Home</button>
</form>
</body>
</html>
