package dao;

import model.Category;
import model.Product;
import util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;

public class DAOCategory {
    /*
   load danh sách danh mục sản phẩm
   @return ArrayList<Category>
    */
    // Hiển thị danh sách các danh mục trong giao diện người dùng
    public static ArrayList<Category> listCategory() {
        ArrayList<Category> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "Select id, name from categories";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Category category = new Category(id, name);
                list.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    // Lấy thông tin về một danh mục dựa trên id
    public static Category getCategoryById(int id) {
        Category category = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "Select id, name from categories where id =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int idCate = resultSet.getInt("id");
                String name = resultSet.getString("name");
                category = new Category(id, name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return category;
    }
    //Thêm danh mục
    public static int insertCategory(Category c) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into categories(name) " +
                "values(?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, c.getName());
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    //Xoá danh mục
    public static synchronized int delCategory(int id) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement s = connection.prepareStatement("select id from categories where id =?");
            s.setInt(1, id);
            ResultSet resultSet = s.executeQuery();
            if (resultSet.next()) {
                s = connection.prepareStatement("delete from suppliers where idCate =?");
                s.setInt(1, id);
                s.executeUpdate();
                s = connection.prepareStatement("delete from products where idCate =?");
                s.setInt(1, id);
                s.executeUpdate();
                s = connection.prepareStatement("delete from categories where id =?");
                s.setInt(1, id);
                re = s.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return re;
    }
    // Cập nhật danh mục
    public static synchronized int updateCategory(Category c) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement s = connection.prepareStatement("select id from categories where id =?");
            s.setInt(1, c.getId());
            ResultSet resultSet = s.executeQuery();
            if (resultSet.next()) {
                s = connection.prepareStatement("UPDATE categories SET " + "name = ? " + "WHERE id =?");
                s.setString(1, c.getName());
                s.setInt(2, c.getId());
                re = s.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return re;
    }
}
