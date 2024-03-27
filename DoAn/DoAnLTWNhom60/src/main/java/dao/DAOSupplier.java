package dao;

import model.Supplier;
import model.VerifyAccount;
import util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAOSupplier {
    public static int insertSupplier(Supplier supplier) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into suppliers(name, phoneNumber,email, idCate, address) values(?,?,?,?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1, supplier.getNameSup());
            pr.setString(2, supplier.getPhoneNumber());
            pr.setString(3, supplier.getEmail());
            pr.setInt(4, supplier.getIdCate());
            pr.setString(5, supplier.getAddress());
            re = pr.executeUpdate();
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }

    public static ArrayList<Supplier> listAllSupplier() {
        ArrayList<Supplier> re = new ArrayList<>();
        Connection connect = JDBCUtil.getConnection();
        try {
            String sql = "select s.id, s.name, s.phoneNumber, s.email, s.idCate, s.address\n" +
                    "from suppliers s";
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int idSup = resultSet.getInt("id");
                String nameSup = resultSet.getString("name");
                String phoneSup = resultSet.getString("phoneNumber");
                String emailSup = resultSet.getString("email");
                int idCate = resultSet.getInt("idCate");
                String addressSup = resultSet.getString("address");
                Supplier supplier = new Supplier(idSup, nameSup, phoneSup, emailSup, idCate, addressSup);
                re.add(supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return re;
    }
    public static int delSupplier(int idSupplier) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
            String sql = "delete  from suppliers where id =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idSupplier);
            re = pr.executeUpdate();
            JDBCUtil.closeConnection(connection);
        } catch (SQLException e) {

        }
        return re;
    }
    public static Supplier selectSupById(int idSup) {
        Supplier re = null;
        try{
            Connection connection = JDBCUtil.getConnection();
            String sql = "select id, name, phoneNumber, email, idCate, address " +
                    "from suppliers " +
                    "where id = ? ";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idSup);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phoneNumber");
                String email = resultSet.getString("email");
                int idCate = resultSet.getInt("idCate");
                String address = resultSet.getString("address");
                re = new Supplier(id,name,phone,email,idCate,address);
            }

            JDBCUtil.closeConnection(connection);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static synchronized int updateInforSupplier(Supplier sup) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
            try {
                PreparedStatement  s = connection.prepareStatement("select id from suppliers where id= ?" );
                s.setInt(1, sup.getIdSup());
                ResultSet resultSet = s.executeQuery();
                if (resultSet.next()) {
                    re = s.executeUpdate("UPDATE suppliers SET name='" + sup.getNameSup() +
                            "', phoneNumber='" + sup.getPhoneNumber() +
                            "', email='" + sup.getEmail() +
                            "', idCate='" + sup.getIdCate() +
                            "', address='" + sup.getAddress() +
                            "' WHERE id=" + sup.getIdSup());
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            JDBCUtil.closeConnection(connection);

        return re;
    }

    public static void main(String[] args) {

    }
}
