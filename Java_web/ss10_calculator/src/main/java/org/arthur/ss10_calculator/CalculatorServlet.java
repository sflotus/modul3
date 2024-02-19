package org.arthur.ss10_calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float numA = Float.parseFloat(req.getParameter("first-operand"));
        float numB = Float.parseFloat(req.getParameter("second-operand"));
        String mess = "";
        float result = 0;
        String operator = req.getParameter("operator");
        switch (operator) {
            case "+":
                result = numA + numB;
                break;
            case "-":
                result = numA - numB;
                break;
            case "*":
                result = numA * numB;
                break;
            case "/":
                if (numB == 0) {
                    mess = "can not div to 0";
                } else result = numA / numB;
                break;
        }
        req.setAttribute("result",result);
        req.setAttribute("mess",mess);
        req.setAttribute("operator",operator);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/result.jsp");
        requestDispatcher.forward(req,resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/calculator.jsp");
        requestDispatcher.forward(req,resp);
    }
}
