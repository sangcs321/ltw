package controller;

import model.Product;
import org.json.JSONArray;
import org.json.JSONObject;
import service.ProductService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
@WebServlet(name = "updateStatusProduct", value = "/updateStatusProduct")
public class UpdateStatusProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String id = request.getParameter("id");
        int idP = Integer.parseInt(id);
        String res = "";
        Product p1 = ProductService.getInstance().getProductById(idP);
        try {
            if(ProductService.getInstance().updateStatusProduct(idP, !p1.isStatus())>0) {
                Product p2 = ProductService.getInstance().getProductById(idP);
                res = (p2.isStatus())?"Mở bán sản phẩm thành công!":"Khóa sản phẩm thành công!";
            }
        } catch (SQLException e) {
            res ="Đã xảy ra lỗi!";
        }
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        ArrayList<Product> listProduct = ProductService.getInstance().listAllProduct();
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
}
