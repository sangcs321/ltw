package dao;
import model.InforWebsite;
import util.JDBCUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class DaoWeb {
    // Lấy thông tin website
    public static InforWebsite selectByid(int id) {
        InforWebsite inforWebsite = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "Select email, address, phoneNumber, guarantee, exchange from infor_web where id=?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String phoneNumber = resultSet.getString("phoneNumber");
                int guarantee = resultSet.getInt("guarantee");
                int exchange = resultSet.getInt("exchange");
                inforWebsite = new InforWebsite(id, address, email, phoneNumber, guarantee, exchange);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return inforWebsite;
    }
    // Cập nhật chính sách
    public static synchronized int updatePolicy(InforWebsite i) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement s = connection.prepareStatement("select id from infor_web where id =?");
            s.setInt(1, i.getId());
            ResultSet resultSet = s.executeQuery();
            if (resultSet.next()) {
                s = connection.prepareStatement("UPDATE infor_web SET guarantee = ?, exchange = ? WHERE id = ?");
                s.setInt(1, i.getGuarantee());
                s.setInt(2, i.getExchange());
                s.setInt(3, i.getId());
                re = s.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return re;
    }
    // Cập nhật thông tin liên hệ
    public static synchronized int updateContact(InforWebsite i) throws SQLException {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement s = connection.prepareStatement("select id from infor_web where id =?");
            s.setInt(1, i.getId());
            ResultSet resultSet = s.executeQuery();
            if (resultSet.next()) {
                s = connection.prepareStatement("UPDATE infor_web SET address = ?, email = ?, phoneNumber = ? WHERE id = ?");
                s.setString(1, i.getAddress());
                s.setString(2, i.getEmail());
                s.setString(3, i.getPhoneNumber());
                s.setInt(4, i.getId());
                re = s.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBCUtil.closeConnection(connection);
        return re;
    }
}
