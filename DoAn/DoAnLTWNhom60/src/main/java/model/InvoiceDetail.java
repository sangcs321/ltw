package model;

public class InvoiceDetail {
    private int idInvoice;
    private int idProduct;
    private double price;
    private int quantity;

    public InvoiceDetail(int idInvoice, int idProduct, double price, int quantity) {
        this.idInvoice = idInvoice;
        this.idProduct = idProduct;
        this.price = price;
        this.quantity = quantity;
    }

    public int getIdInvoice() {
        return idInvoice;
    }

    public void setIdInvoice(int idInvoice) {
        this.idInvoice = idInvoice;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
