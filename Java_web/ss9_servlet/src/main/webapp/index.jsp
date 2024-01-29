<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<form action="/display-discount" method="post">
  <table>
    <tr>
      <td>
        <label for="productDescription">Product Description</label>
      </td>
      <td>
        <input type="text" name="productDescription" id="productDescription" placeholder="Product Description">
      </td>
    </tr>
    <tr>
      <td><label for="listPrice">List Description</label></td>
      <td><input type="number" name="listPrice" id="listPrice" placeholder="List Price"></td>
    </tr>
    <tr>
      <td><label for="discountPercent">Discount Description</label></td>
      <td><input type="number" name="discountPercent" id="discountPercent" placeholder="Discount Percent"></td>
    </tr>
  </table>
  <button type="submit">Calculate</button>
  <button  type="reset">Reset</button>
</form>
</body>
</html>