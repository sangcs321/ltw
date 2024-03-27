package service;

import dao.DAOInvoice;
import dao.DAOProduct;
import model.Image;
import model.Invoice;
import model.InvoiceDetail;
import model.Product;

import java.sql.Date;
import java.util.ArrayList;

public class InvoiceService {
    static InvoiceService instance;

    private InvoiceService() {
    }

    public static InvoiceService getInstance() {
        if (instance == null)
            instance = new InvoiceService();
        return instance;
    }

    public ArrayList<Invoice> listInvoice() {
        ArrayList<Invoice> list = DAOInvoice.listInvoice();
        for (Invoice i : list) {
            i.setDetails(DAOInvoice.listDetail(i.getIdInvoice()));
        }
        return list;
    }
    public Invoice selectById(int idInvoice) {
        Invoice invoice = DAOInvoice.selectById(idInvoice);
        if (invoice != null) {
            invoice.setDetails(DAOInvoice.listDetail(idInvoice));
        }
        return invoice;
    }

    public int delInvoice(int idInvoice) {
        return DAOInvoice.delInvoice(idInvoice);
    }
    public int delInvoiceCus(int idInvoice) {
        return DAOInvoice.delInvoiceCus(idInvoice);
    }

    public int updateStatus(int idInvoice, int status) {
        return DAOInvoice.updateStatus(idInvoice, status);
    }
    public ArrayList<Invoice> getListByStatus(int st) {
        ArrayList<Invoice> list = DAOInvoice.getListByStatus(st);
        for (Invoice i : list) {
            i.setDetails(DAOInvoice.listDetail(i.getIdInvoice()));
        }
        return list;
    }
    public ArrayList<Invoice> searchByStartDate(Date d) {
        ArrayList<Invoice> list = DAOInvoice.searchByStartDate(d);
        for (Invoice i : list) {
            i.setDetails(DAOInvoice.listDetail(i.getIdInvoice()));
        }
        return list;
    }
    public ArrayList<Invoice> getListOfCus(int st,int hide, int idAcc) {
        ArrayList<Invoice> list = DAOInvoice.getListOfCus(st, hide, idAcc);
        for (Invoice i : list) {
            i.setDetails(DAOInvoice.listDetail(i.getIdInvoice()));
        }
        return list;
    }
    public int insertInvoice(Invoice in){
        return DAOInvoice.insertInvoice(in);
    }
    public Invoice latestInvoice() {
        return DAOInvoice.latestInvoice();
    }
    public int insertInvoiceDetail(InvoiceDetail idt){
        return DAOInvoice.insertInvoiceDetail(idt);
    }
    public int idBestSaler(){return DAOInvoice.idBestSaler();}
    public void backQuantity(int id) {
        Invoice invoice = selectById(id);
        for(InvoiceDetail i : invoice.getDetails()) {
            ProductService.getInstance().updateQuantity(i.getIdProduct(), i.getQuantity());
        }
    }
}
