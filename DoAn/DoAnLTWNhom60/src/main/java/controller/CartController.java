package controller;

import model.Cart;
import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "cartController", value = "/cartController")
public class CartController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        HttpSession session = request.getSession();
        String idProductText = request.getParameter("id");
        int idProduct = Integer.parseInt(idProductText);
        String quantityText = request.getParameter("quantity");
        int quantity = Integer.parseInt(quantityText);
        Cart c = (Cart) session.getAttribute("Cart");
        if(c == null) c= new Cart();
        if (c.get(idProduct) != null) {
            int quantityAvailable = c.get(idProduct).getQuantityAvailable();
            if(quantity <= quantityAvailable) {
                c.put(idProduct, quantity);
            }else {
                request.setAttribute("errQuantity","Trong kho chỉ còn lại " + quantityAvailable + " sản phẩm '" +c.get(idProduct).getName() +"'");
            }
        }else{
            Product p = ProductService.getInstance().getProductById(idProduct);
            if (p != null) c.put(p);
        }
        session.setAttribute("Cart", c);
        try {
            request.getRequestDispatcher("Cart.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}

