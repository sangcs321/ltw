package controller;
import model.Product;
import org.json.JSONArray;
import org.json.JSONObject;
import service.ProductService;
import java.io.*;
import java.nio.file.Paths;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet(name = "addProduct", value = "/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String name = request.getParameter("nameProduct");
        double priceImport = Double.parseDouble(request.getParameter("priceImpProductAdd"));
        double price = Double.parseDouble(request.getParameter("priceProductAdd"));
        String typeCate = request.getParameter("cateChair");
        int idCate = 3;
        if(typeCate.equals("Ghế thư giãn")){
            idCate = 4;
        }else if(typeCate.equals("Ghế trang trí")) {
            idCate = 1;
        }else if(typeCate.equals("Ghế gaming")) {
            idCate = 2;
        }
        Double length = Double.parseDouble(request.getParameter("length"));
        Double width = Double.parseDouble(request.getParameter("width"));
        Double height = Double.parseDouble(request.getParameter("height"));
        String material = request.getParameter("material");
        String color = request.getParameter("color");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("des");
        Product product = new Product(idCate,  name,  priceImport,  price,  description,  color,  material,  width,  height,  length,quantity);
        String realPath = getServletContext().getRealPath("/Products");
        String res = "Thêm sản phẩm thành công!";
        if(ProductService.getInstance().insertProduct(product)>0) {
            Product productLatest = ProductService.getInstance().latestProduct();
                for (Part part : request.getParts()) {
                    if (isFilePart(part)) {
                        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                       // String newFileName = generateUniqueIdentifier() + "_" + fileName;
                        if (fileName != null && !fileName.isEmpty()) {
                            if(ProductService.getInstance().insertImageProduct(productLatest.getIdProduct(), fileName)<1) {
                                res = "Đã xảy ra lỗi!";
                            }
                        }
                        part.write(realPath + File.separator + fileName);
                        part.write("D:\\ltw\\DoAn\\DoanLTWNhom60\\src\\main\\webapp\\Products" + File.separator + fileName);
                    }
                }
        }
        ArrayList<Product> listProduct = ProductService.getInstance().listAllProduct();
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        for (Product p : listProduct) {
            JSONObject productJSON = new JSONObject();
            productJSON.put("idProduct", p.getIdProduct());
            productJSON.put("imageUrl", url +"/Products/" +((p.getImages().isEmpty())?"":p.getImages().get(0).getUrl()));
            productJSON.put("name", p.getName());
            productJSON.put("price", nF.format(p.getPrice()));
            productJSON.put("color", p.getColor());
            productJSON.put("quantity", p.getQuantityAvailable());
            productJSON.put("status", (p.isStatus())?"Đang bán":"Ngưng bán");
            htmlDataArray.put(productJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }

    private boolean isFilePart(Part part) {
        return part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty();
    }
    public static String generateUniqueIdentifier() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

}
