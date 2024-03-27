package model;
import java.sql.*;
import java.util.ArrayList;

public class Invoice {
    private int idInvoice;
    private int idAccount;
    private String address;
    private double transFee;
    private String payMethod;
    private Date startDate;
    private int status;
    private ArrayList<InvoiceDetail> details;

    public Invoice(int idInvoice, int idAccount, String address, double transFee, String payMethod, Date startDate, int status) {
        this.idInvoice = idInvoice;
        this.idAccount = idAccount;
        this.address = address;
        this.transFee = transFee;
        this.payMethod = payMethod;
        this.startDate = startDate;
        this.status = status;
    }

    public int getIdInvoice() {
        return idInvoice;
    }

    public void setIdInvoice(int idInvoice) {
        this.idInvoice = idInvoice;
    }

    public int getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(int idAccount) {
        this.idAccount = idAccount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getTransFee() {
        return transFee;
    }

    public void setTransFee(double transFee) {
        this.transFee = transFee;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public ArrayList<InvoiceDetail> getDetails() {
        return details;
    }

    public void setDetails(ArrayList<InvoiceDetail> details) {
        this.details = details;
    }
    public double totalPrice() {
        double re =0;
        for (InvoiceDetail ivd: details) re += ivd.getPrice() * ivd.getQuantity();
        return re;
    }
}
