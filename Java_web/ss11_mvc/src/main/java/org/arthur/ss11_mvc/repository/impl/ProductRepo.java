package org.arthur.ss11_mvc.repository.impl;

import org.arthur.ss11_mvc.model.Product;
import org.arthur.ss11_mvc.repository.IRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IRepo {
    private String URL = "jdbc:mysql://localhost:3306/product_management?useSSL=false";
    private String USERNAME = "root";
    private String PASSWORD = "12345678";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO Products (id, name, price,description) VALUE(?,?,?,?);";
    private static final String SELECT_PRODUCT_BY_ID = "select id,name,price,description from Products where id =? and isActive =1;";
    private static final String SELECT_ALL_PRODUCT = "select * from Products where isActive =1;";
    private static final String DELETE_PRODUCT_SQL = "update Products set isActive = 0 where id = ?;";
    private static final String UPDATE_PRODUCT_SQL = "update Products set name = ?,price= ?, description =? where id = ?;";

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
    public List<Product> getAll() {
        List<Product> productList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                productList.add(new Product(id, name, price, description));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return productList;
    }

    @Override
    public boolean add(Product product) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL);) {
            preparedStatement.setInt(1,product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setDouble(3,product.getPrice());
            preparedStatement.setString(4,product.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return true;
    }

    @Override
    public boolean delete(int id) {
    boolean rowDelete = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL);) {
            preparedStatement.setInt(1,id);
            rowDelete = preparedStatement.executeUpdate()>0;
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    return rowDelete;
    }

    @Override
    public boolean update(Product product) throws SQLException {
        boolean rowUpdate = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL);) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2,product.getPrice());
            preparedStatement.setString(3,product.getDescription());
            preparedStatement.setInt(4,product.getId());

           rowUpdate= preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdate;
    }

    @Override
    public Product getProductByID(int id) throws SQLException {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);) {
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                Double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
               product=new Product(id, name, price, description);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
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
