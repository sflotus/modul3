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
    <h2>
        Edit Product
    </h2>
    <%--    <h2>--%>
    <%--        <a href="product?action=product">List All Product</a>--%>
    <%--    </h2>--%>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <c:if test="${ product!= null}">
                <input type="hidden" name="id" value="${product.id}"/>
            </c:if>
            <tr>
                <th>Product Name:</th>
                <td>
                    <input required type="text" name="name" size="45" id="inputName"
                           value="<c:out value='${product.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Product price:</th>
                <td>
                    <input required type="number" name="price" size="45" id="inputPrice"
                           value="<c:out value='${product.price}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Country:</th>
                <td>
                    <select name="idCountry">
                        <c:forEach var="country" items="${countryList}">
                            <c:if test="${product.getIdCountry() == country.getId()}">
                                <option selected value="${country.id}">${country.getName()}</option>
                            </c:if>
                            <c:if test="${product.getIdCountry() != country.getId()}">
                                <option value="${country.id}">${country.getName()}</option>
                            </c:if>
                        </c:forEach>

                    </select>
                </td>
            </tr>
            <tr>
                <th>Description:</th>
                <td>
                    <input required type="text" name="description" size="15" id="inputDescription"
                           value="<c:out value='${product.description}'  />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="btn btn-primary" type="submit" value="Save"/>
                    <input class="btn btn-primary" type="button" value="Cancel"
                           onclick="window.location.href='/product?action=product'"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<script>
</script>
</body>
</html>