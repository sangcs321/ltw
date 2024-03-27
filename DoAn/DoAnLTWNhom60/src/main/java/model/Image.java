package model;

public class Image {
    private int idImage;
    private int idProduct;
    private String url;

    public Image() {
    }

    public Image(int idImage, int idProduct, String url) {
        this.idImage = idImage;
        this.idProduct = idProduct;
        this.url = url;
    }
    public Image( String url) {
        this.url = url;
    }

    public int getIdImage() {
        return idImage;
    }

    public void setIdImage(int idImage) {
        this.idImage = idImage;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "url= " + url;
    }
}
