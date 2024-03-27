package service;
import dao.DAOProduct;
import model.Image;
import model.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class ProductService {
    static ProductService instance;
    private ProductService() {
    }
    public static ProductService getInstance() {
        if (instance == null)
            instance = new ProductService();
        return instance;
    }
    /*
    load 6 sản phẩm, có tham số offset là vị trí sản phẩm bắt đầu load
    @param offset
    @return ArrayList<Product>
    */
    public ArrayList<Product> listSixProduct(int offset) {
        ArrayList<Product> listProduct = DAOProduct.listSixProduct(offset);
        ArrayList<Image> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setImages(listImageOfProduct);
        }
        return listProduct;
    }
    /*
   lấy ra sản phẩm theo id sản phẩm
   @param id
   @return Product
    */
    public Product getProductById(int id) {
       Product product = DAOProduct.getProductById(id);
       ArrayList<Image> listImageOfProduct = DAOProduct.listImageOfProduct(product);
       product.setImages(listImageOfProduct);
       return product;
    }
    /*
   load sản phẩm theo mã danh mục
   @param id, offset
   @return ArrayList<Product>
   */
    public ArrayList<Product> listProductByIdCate(int id, int offset) {
        ArrayList<Product> listProduct = DAOProduct.listProductByIdCate(id, offset);
        ArrayList<Image> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setImages(listImageOfProduct);
        }
        return listProduct;
    }
    /*
    load danh sách sản phẩm nếu sản phẩm đó có tên chứa chuỗi nhập vào thanh tìm kiếm
    @param nameProduct
    @return ArrayList<Product>
    */
    public ArrayList<Product> listProductByName(String name) {
        ArrayList<Product> listProduct = DAOProduct.listProductByName(name);
        ArrayList<Image> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setImages(listImageOfProduct);
        }
        return listProduct;
    }
    /*Lấy ra sản phẩm mới nhất dựa vào id lớn nhất của sản phẩm
    @return Product
    */
    public Product latestProduct() {
        Product product = DAOProduct.latestProduct();
        if(product != null) {
            ArrayList<Image> listImageOfProduct = DAOProduct.listImageOfProduct(product);
            product.setImages(listImageOfProduct);
        }
        return product;
    }
    /*
   load danh sách màu sản phẩm để thực hiện lọc sản phẩm
   @return ArrayList<String>
   */
    public ArrayList<String> listColorP() {
      return DAOProduct.listColorP();
    }
    public ArrayList<Product> listProductByFil(String command, int priceFil, String colorFil, String materialFil, int idCate) {
        ArrayList<Product> listProduct = DAOProduct.listProductByFil(command, priceFil, colorFil, materialFil, idCate);
        ArrayList<Image> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setImages(listImageOfProduct);
        }
        return listProduct;
    }
    public int insertProduct(Product p) {
        return DAOProduct.insertProduct(p);
    }
    public int insertImageProduct(int id, String url) {
        return DAOProduct.insertImageProduct(id, url);
    }
    public ArrayList<Product> listAllProduct() {
        ArrayList<Product> listProduct = DAOProduct.listAllProduct();
        ArrayList<Image> listImageOfProduct = null;
        for(Product p:listProduct) {
            listImageOfProduct = DAOProduct.listImageOfProduct(p);
            p.setImages(listImageOfProduct);
        }
        return listProduct;
    }
    public int updateStatusProduct(int id, boolean status) throws SQLException {
        return DAOProduct.updateStatusProduct(id, status);
    }
    public ArrayList<Image> getImgsByIdP(int idP) {
        return DAOProduct.getImgsByIdP(idP);
    }
    public int delImgOfProduct(int id, String urlImage) throws SQLException {
        return DAOProduct.delImgOfProduct(id, urlImage);
    }
    public int updateProduct(Product p) throws SQLException {
        return DAOProduct.updateProduct(p);
    }
    public Product productSimilar(int idCate) {
        Product product = DAOProduct.productSimilar(idCate);
        if(product != null) {
            ArrayList<Image> listImageOfProduct = DAOProduct.listImageOfProduct(product);
            product.setImages(listImageOfProduct);
        }
        return product;
    }
    public int delProduct(int id) {
        try {
            return  DAOProduct.delProduct(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static int decreaseQuantity(Product p, int quantity){
        return DAOProduct.decreaseQuantity(p,quantity);
    }
    public int updateQuantity(int id, int quantity) {
        return DAOProduct.updateQuantity(id, quantity);
    }

}