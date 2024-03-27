package controller;

import model.Image;
import model.Product;
import org.json.JSONArray;
import org.json.JSONObject;
import service.ProductService;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "editProduct", value = "/editProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class EditProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String name = request.getParameter("nameProductEdit");
        String priceImport = request.getParameter("priceImpProductEdit");
        String price = request.getParameter("priceProductEdit");
        String typeCate = request.getParameter("cateChairEdit");
        String length = request.getParameter("lengthEdit");
        String width = request.getParameter("widthEdit");
        String height = request.getParameter("heightEdit");
        String material = request.getParameter("materialEdit");
        String color = request.getParameter("colorEdit");
        String quantity = request.getParameter("quantityEdit");
        String des = request.getParameter("desEdit");
        String[] imgs = request.getParameterValues("imageAvai");
        if(imgs != null) {
            for (int i = 0; i < imgs.length; i++) {
                imgs[i] = imgs[i].substring(9);
            }
        }
        String res ="Chỉnh sửa thành công!";
        int idCate = 3;
        if(typeCate.equals("Ghế thư giãn")){
            idCate = 4;
        }else if(typeCate.equals("Ghế trang trí")) {
            idCate = 1;
        }else if(typeCate.equals("Ghế gaming")) {
            idCate = 2;
        }
        Product newProduct = new Product(id, idCate, name, Double.parseDouble(priceImport), Double.parseDouble(price), des, color, material, Double.parseDouble(width), Double.parseDouble(height), Double.parseDouble(length), Integer.parseInt(quantity));
        try {
            if(ProductService.getInstance().updateProduct(newProduct) > 0) {
                ArrayList<Image> imgList = ProductService.getInstance().getImgsByIdP(id);
                List<String> urlList = new ArrayList<>();
                for (Image img: imgList) {
                    urlList.add(img.getUrl());
                }
                // Xác định và xóa các phần tử lặp lại
                List<String> elementsToRemove = new ArrayList<>();
                if (imgs != null) {
                    elementsToRemove.addAll(Arrays.asList(imgs));
                }
                urlList.removeAll(elementsToRemove);
                for (String url: urlList) {
                    if(ProductService.getInstance().delImgOfProduct(id,url) <= 0) {
                        res = "Đã xảy ra lỗi!";
                    }
                }
            }else {
                res ="Đã xảy ra lỗi!";
            }
            String realPath = getServletContext().getRealPath("/Products");
            for (Part part : request.getParts()) {
                if (isFilePart(part)) {
                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    String newFileName = generateUniqueIdentifier() + "_" + fileName;
                    if (fileName != null && !fileName.isEmpty()) {
                        if(ProductService.getInstance().insertImageProduct(id, newFileName)<1) {
                            res = "Đã xảy ra lỗi!";
                        }
                    }
                    part.write(realPath + File.separator + newFileName);
                    part.write("D:\\ltw\\DoAn\\DoanLTWNhom60\\src\\main\\webapp\\Products" + File.separator + newFileName);
                }
            }
        } catch (SQLException e) {
            res ="Đã xảy ra lỗi!";
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