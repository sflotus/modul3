<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 1/31/2024
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<div>
    <div><h1>Simple Calculator</h1></div>
    <div>
        <form action="/calculator" method="post">
        <fieldset>
            <legend>Calculator</legend>
            <table>
                <tr>
                    <td><label for="first-operand" >First Operand</label></td>
                    <td>
                        <input type="number" name="first-operand" id="first-operand">
                    </td>
                </tr>
                <tr>
                    <td><label>Operator</label></td>
                    <td>
                        <label>
                            <select name="operator">
                                <option value="+">Addition</option>
                                <option value="-">Subtraction</option>
                                <option value="*">Multiplication</option>
                                <option value="/">Division</option>
                            </select>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td><label for="second-operand" >Second Operand</label></td>
                    <td>
                        <input type="number" name="second-operand" id="second-operand">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <button type="submit" onclick="alertResult()">Calculate</button>
                    </td>
                </tr>
            </table>
        </fieldset>
        </form>
    </div>
</div>
<script>
</script>
</body>
</html>
