package dao;

import model.Invoice;
import model.InvoiceDetail;
import model.Product;
import util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;

public class DAOInvoice {
    public static ArrayList<Invoice> listInvoice() {
        ArrayList<Invoice> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, idAccount, address, transFee, payMethod, startDate, status from invoices where hideAdmin =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, 0);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idAccount = resultSet.getInt("idAccount");
                String address = resultSet.getString("address");
                double transFee = resultSet.getDouble("transFee");
                String payMethod = resultSet.getString("payMethod");
                Date startDate = resultSet.getDate("startDate");
                int status = resultSet.getInt("status");
                Invoice invoice = new Invoice(id, idAccount, address, transFee, payMethod, startDate, status);
                list.add(invoice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static Invoice selectById(int idInvoice) {
        Invoice invoice = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, idAccount, address, transFee, payMethod, startDate, status from invoices";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idAccount = resultSet.getInt("idAccount");
                String address = resultSet.getString("address");
                double transFee = resultSet.getDouble("transFee");
                String payMethod = resultSet.getString("payMethod");
                Date startDate = resultSet.getDate("startDate");
                int status = resultSet.getInt("status");
                invoice = new Invoice(id, idAccount, address, transFee, payMethod, startDate, status);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
           return invoice;
    }
    public static ArrayList<InvoiceDetail> listDetail(int idInvoice) {
        ArrayList<InvoiceDetail> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, idProduct, price, quantity from invoice_details where id =?";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idInvoice);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idProduct = resultSet.getInt("idProduct");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                InvoiceDetail detail = new InvoiceDetail(id, idProduct, price, quantity);
                list.add(detail);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static synchronized int delInvoice(int idInvoice) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement( "select id, idAccount, address, transFee, payMethod, startDate, status from invoices where id =?");
            pr.setInt(1, idInvoice);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                pr = connection.prepareStatement("update invoices set hideAdmin =? where id =?");
                pr.setInt(1, 1);
                pr.setInt(2, idInvoice);
                re = pr.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static synchronized int delInvoiceCus(int idInvoice) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement( "select id, idAccount, address, transFee, payMethod, startDate, status from invoices where id =?");
            pr.setInt(1, idInvoice);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                pr = connection.prepareStatement("update invoices set hideCus =? where id =?");
                pr.setInt(1, 1);
                pr.setInt(2, idInvoice);
                re = pr.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static synchronized int updateStatus(int idInvoice, int status) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement( "select id, idAccount, address, transFee, payMethod, startDate, status from invoices where id =?");
            pr.setInt(1, idInvoice);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                pr = connection.prepareStatement("update invoices set status =? where id =?");
                pr.setInt(1, status);
                pr.setInt(2, idInvoice);
                re = pr.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static ArrayList<Invoice> getListByStatus(int st) {
        ArrayList<Invoice> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, idAccount, address, transFee, payMethod, startDate, status from invoices where status =? and hideAdmin =?" ;
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, st);
            pr.setInt(2, 0);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idAccount = resultSet.getInt("idAccount");
                String address = resultSet.getString("address");
                double transFee = resultSet.getDouble("transFee");
                String payMethod = resultSet.getString("payMethod");
                Date startDate = resultSet.getDate("startDate");
                int status = resultSet.getInt("status");
                Invoice invoice = new Invoice(id, idAccount, address, transFee, payMethod, startDate, status);
                list.add(invoice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static ArrayList<Invoice> getListOfCus(int st,int hide, int idAcc) {
        ArrayList<Invoice> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, idAccount, address, transFee, payMethod, startDate, status from invoices where status =? and idAccount =? and hideCus =?" ;
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, st);
            pr.setInt(2, idAcc);
            pr.setInt(3, hide);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idAccount = resultSet.getInt("idAccount");
                String address = resultSet.getString("address");
                double transFee = resultSet.getDouble("transFee");
                String payMethod = resultSet.getString("payMethod");
                Date startDate = resultSet.getDate("startDate");
                int status = resultSet.getInt("status");
                Invoice invoice = new Invoice(id, idAccount, address, transFee, payMethod, startDate, status);
                list.add(invoice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static ArrayList<Invoice> searchByStartDate(Date d) {
        ArrayList<Invoice> list = new ArrayList<>();
        Connection connection = JDBCUtil.getConnection();
        String sql = "select id, idAccount, address, transFee, payMethod, startDate, status from invoices where startDate =?" ;
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setDate(1, d);
            ResultSet resultSet = pr.executeQuery();
            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                int idAccount = resultSet.getInt("idAccount");
                String address = resultSet.getString("address");
                double transFee = resultSet.getDouble("transFee");
                String payMethod = resultSet.getString("payMethod");
                Date startDate = resultSet.getDate("startDate");
                int status = resultSet.getInt("status");
                Invoice invoice = new Invoice(id, idAccount, address, transFee, payMethod, startDate, status);
                list.add(invoice);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static int insertInvoice(Invoice in) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String date = new java.sql.Date(System.currentTimeMillis()).toString();
        String sql = "insert into invoices(idAccount , address, transFee, payMethod, StartDate) " +
                "values(?,?,?,?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, in.getIdAccount());
            pr.setString(2, in.getAddress());
            pr.setDouble(3, in.getTransFee());
            pr.setString(4, in.getPayMethod());
            pr.setString(5, date);
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static Invoice latestInvoice() {
        Invoice invoice = null;
        Connection connection = JDBCUtil.getConnection();
        String sql = "select i.id, i.idAccount, i.address, i.transFee, i.payMethod, i.startDate, i.status \n" +
                "                              from invoices as i order by i.id DESC\n" +
                "limit 1";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int idInvoice = resultSet.getInt("id");
                int idAccount = resultSet.getInt("idAccount");
                String address = resultSet.getString("address");
                double transFee = resultSet.getDouble("transFee");
                String payMethod = resultSet.getString("payMethod");
                Date startDate = resultSet.getDate("startDate");
                int status = resultSet.getInt("status");
                invoice = new Invoice(idInvoice,idAccount,address,transFee,payMethod,startDate,status);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return invoice;
    }
    public static int insertInvoiceDetail(InvoiceDetail idt) {
        int re = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into invoice_details(id, IdProduct, price, quantity) " +
                "values(?,?,?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, idt.getIdInvoice());
            pr.setInt(2, idt.getIdProduct());
            pr.setDouble(3, idt.getPrice());
            pr.setInt(4, idt.getQuantity());
            re = pr.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return re;
    }
    public static int idBestSaler(){
        int idProduct = 0;
        Connection connection = JDBCUtil.getConnection();
        String sql = "select d.idProduct, sum(d.quantity) as tong\n" +
                "                from invoice_details as d join invoices as i on d.id = i.id \n" +
                "                where i.status = 1 \n" +
                "                group by d.idProduct \n" +
                "                order by tong DESC  \n" +
                "                limit 1;";
        try {
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                idProduct = resultSet.getInt("idProduct");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return idProduct;
    }


}
