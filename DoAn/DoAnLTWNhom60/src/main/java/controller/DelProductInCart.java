package controller;

import model.Cart;
import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "delProductInCart", value = "/delProductInCart")
public class DelProductInCart extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        HttpSession session = request.getSession();
        String idProductText = request.getParameter("id");
        int idProduct = Integer.parseInt(idProductText);
        System.out.println(idProduct);
        Cart cart = (Cart) session.getAttribute("Cart");
        cart.remove(idProduct);
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

