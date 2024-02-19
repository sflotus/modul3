package org.arthur.demo.Controller;

import org.arthur.demo.DB.UserDAO;
import org.arthur.demo.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(value = "/user")
public class UserController extends HttpServlet {
    private UserDAO userDAO;
    private static final long serialVersionUID = 1L;

    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(req, resp);
                    break;
                case "edit":
                    updateUser(req, resp);
                    break;
                default:
                    listUser(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(id, name, email, country);
        userDAO.updateUser(user);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("user/edit.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void insertUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(name, email, country);
        boolean isSuccess = userDAO.insertUser(user);
        String mess ="add new successful";
        if(!isSuccess){
            mess = "add new unsuccessful";
        }
        try {
            resp.sendRedirect("/user?mess="+mess);
        }catch (IOException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showNewForm(req, resp);
                    break;
                case "edit":
                    showEditForm(req, resp);
                    break;
                case "delete":
                    deleteUser(req, resp);
                    break;
                default:
                    listUser(req, resp);
                    break;

            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        boolean isSuccess = userDAO.deleteUser(id);
        String mess ="deleted  successful";
        if(!isSuccess){
            mess = "delete unsuccessful";
        }
        try {
            resp.sendRedirect("/user?mess="+mess);
        }catch (IOException e){
            throw new RuntimeException(e);
        }

    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        req.setAttribute("user", existingUser);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("user/edit.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("user/create.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void listUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList = userDAO.selectAllUsers();
        req.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(req, resp);
    }
}
