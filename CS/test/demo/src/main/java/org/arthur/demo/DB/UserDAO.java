package org.arthur.demo.DB;

import org.arthur.demo.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private String URL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String USERNAME = "root";
    private String PASSWORD = "12345678";
    private static final String INSERT_USER_SQL = "INSERT INTO users (name, email, country) VALUE(?,?,?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =? and isActive =1;";
    private static final String SELECT_ALL_USERS = "select * from users where isActive =1;";
    private static final String DELETE_USERS_SQL = "update users set isActive = 0 where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";

    public UserDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    @Override
    public boolean insertUser(User user) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            printSQLException(e);
        }
        return true;
    }

    @Override
    public User selectUser(int id) {
       User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(name,email,country);
            }
        } catch (SQLException e){
            printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id,name,email,country);
                userList.add(user);
            }
        } catch (SQLException e){
            printSQLException(e);
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted = false;
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL)){
            preparedStatement.setInt(1, id);
           rowDeleted= preparedStatement.executeUpdate() > 0;
        } catch (SQLException e){
            printSQLException(e);
        }
        return  rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate = false;
        try(Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)) {
        preparedStatement.setString(1,user.getName());
        preparedStatement.setString(2,user.getEmail());
        preparedStatement.setString(3,user.getCountry());
        preparedStatement.setInt(4,user.getId());
        rowUpdate=preparedStatement.executeUpdate()>0;
        }catch (SQLException e){
            printSQLException(e);
        }
        return  rowUpdate;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}
