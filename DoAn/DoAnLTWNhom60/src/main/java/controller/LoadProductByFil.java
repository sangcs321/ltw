package controller;

import model.Cart;
import model.Product;
import service.ProductService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.ArrayList;
import org.json.JSONObject;
import org.json.JSONArray;

@WebServlet(name = "filterProduct", value = "/filterProduct")
public class LoadProductByFil extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String priceText = request.getParameter("price");
        int price = 0;
        if(!priceText.equals("")) {
            price = Integer.parseInt(priceText);
        }
        String color = request.getParameter("color")+"";
        String material = request.getParameter("material")+"";
        String command = request.getParameter("command")+"";
        String idCateText = request.getParameter("idCate");
        int idCate = 0;
        if(idCateText != null) {
            idCate = Integer.parseInt(idCateText);
        }
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("Cart");        PrintWriter out = response.getWriter();

        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        int quantity = 1;
        ArrayList<Product> listProduct = ProductService.getInstance().listProductByFil(command,price, color, material, idCate );
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        for (Product p : listProduct) {
            if (cart != null) {
                if (cart.get(p.getIdProduct()) != null) {
                    quantity = cart.get(p.getIdProduct()).getQuantity() + 1;
                } else {
                    quantity = p.getQuantity();
                }
            }
            JSONObject productJSON = new JSONObject();
            productJSON.put("idProduct", p.getIdProduct());
            productJSON.put("idCate", p.getIdCate());
            productJSON.put("imageUrl", url +"\\Products\\" +((p.getImages().isEmpty())?"":p.getImages().get(0).getUrl()));
            productJSON.put("name", p.getName());
            productJSON.put("price", nF.format(p.getPrice()));
            productJSON.put("quantity", quantity);
            htmlDataArray.put(productJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("productExits", listProduct.size());
        jsonResponse.put("url", url);
        out.println(jsonResponse.toString());
    }
}

