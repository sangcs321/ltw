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
import java.text.NumberFormat;
import java.util.ArrayList;

@WebServlet(name = "delProduct", value = "/delProduct")
public class DelProduct extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String res = "";
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        ArrayList<Product> listProduct = null;
        if(ProductService.getInstance().delProduct(id)>0) {
            listProduct = ProductService.getInstance().listAllProduct();
            res = "Xóa thành công!";
        }else {
            res = "Đã xảy ra lỗi!";
            listProduct = ProductService.getInstance().listAllProduct();
        }
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
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}

