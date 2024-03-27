package model;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;

public class Product {
    private int idProduct;
    private int idCate;
    private String name;
    private double priceImport;
    private double price;
    private String description;
    private String color;
    private String material;
    private double width;
    private double height;
    private double length;
    private int quantityAvailable;
    private int quantity;
    private boolean status;
    private ArrayList<Image> images;

    public Product() {
    }

    public Product(int idProduct, int idCate, String name, double priceImport, double price, String description, String color, String material, double width, double height, double length, int quantity, int quantityAvailable, ArrayList<Image> images) {
        this.idProduct = idProduct;
        this.idCate = idCate;
        this.name = name;
        this.priceImport = priceImport;
        this.price = price;
        this.description = description;
        this.color = color;
        this.material = material;
        this.width = width;
        this.height = height;
        this.length = length;
        this.quantity = quantity;
        this.quantityAvailable = quantityAvailable;
        this.images = images;
    }

    public Product(int idProduct, int idCate, String name, double priceImport, double price, String description, String color, String material, double width, double height, double length, int quantity, int quantityAvailable) {
        this.idProduct = idProduct;
        this.idCate = idCate;
        this.name = name;
        this.priceImport = priceImport;
        this.price = price;
        this.description = description;
        this.color = color;
        this.material = material;
        this.width = width;
        this.height = height;
        this.length = length;
        this.quantityAvailable = quantityAvailable;
        this.quantity = quantity;
    }
    public Product(int idCate, String name, double priceImport, double price, String description, String color, String material, double width, double height, double length, int quantityAvailable) {
        this.idCate = idCate;
        this.name = name;
        this.priceImport = priceImport;
        this.price = price;
        this.description = description;
        this.color = color;
        this.material = material;
        this.width = width;
        this.height = height;
        this.length = length;
        this.quantityAvailable = quantityAvailable;
    }

    public Product(int idProduct, int idCate, String name, double priceImport, double price, String description, String color, String material, double width, double height, double length, int quantity, int quantityAvailable, boolean status) {
        this.idProduct = idProduct;
        this.idCate = idCate;
        this.name = name;
        this.priceImport = priceImport;
        this.price = price;
        this.description = description;
        this.color = color;
        this.material = material;
        this.width = width;
        this.height = height;
        this.length = length;
        this.quantityAvailable = quantityAvailable;
        this.quantity = quantity;
        this.status = status;
    }
    public Product(int idProduct, int idCate, String name, double priceImport, double price, String description, String color, String material, double width, double height, double length, int quantityAvailable) {
        this.idProduct = idProduct;
        this.idCate = idCate;
        this.name = name;
        this.priceImport = priceImport;
        this.price = price;
        this.description = description;
        this.color = color;
        this.material = material;
        this.width = width;
        this.height = height;
        this.length = length;
        this.quantityAvailable = quantityAvailable;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdCate() {
        return idCate;
    }

    public void setIdCate(int idCate) {
        this.idCate = idCate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPriceImport() {
        return priceImport;
    }

    public void setPriceImport(int priceImport) {
        this.priceImport = priceImport;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getLength() {
        return this.length;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPriceImport(double priceImport) {
        this.priceImport = priceImport;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantityAvailable() {
        return quantityAvailable;
    }

    public void setQuantityAvailable(int quantityAvailable) {
        this.quantityAvailable = quantityAvailable;
    }

    public ArrayList<Image> getImages() {
        return images;
    }

    public void setImages(ArrayList<Image> images) {
        this.images = images;
    }

    public void quantityUp() {
        this.quantity++;
    }

    public void quantityUp(int quantity) {
        setQuantity(quantity);
    }

    public String formatSize(double size) {
        // Tạo mẫu định dạng với hai chữ số sau dấu thập phân
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        // Làm tròn số và áp dụng định dạng
        String formattedNumber = decimalFormat.format(size);
       return formattedNumber;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "idProduct=" + idProduct +
                ", idCate=" + idCate +
                ", name='" + name + '\'' +
                ", priceImport=" + priceImport +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", color='" + color + '\'' +
                ", material='" + material + '\'' +
                ", width=" + width +
                ", height=" + height +
                ", length=" + length +
                ", quantityAvailable=" + quantityAvailable +
                ", quantity=" + quantity +
                ", status=" + status +
                ", images=" + images +
                '}';
    }
    public static void main(String[] args) {
        Product p = new Product();
        NumberFormat nF
                = NumberFormat
                .getCurrencyInstance();

        // Print amount in defined currency
//        System.out.println(nF.format(price));
    }
}
