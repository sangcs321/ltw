package controller;

import model.*;
import service.ProductService;
import util.Email;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.text.NumberFormat;
import java.util.Iterator;

@WebServlet(name = "PaymentBuyNow", value = "/PaymentBuyNow")
public class PaymentBuyNow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
        String idProductText = request.getParameter("id");
        int idProduct = Integer.parseInt(idProductText);
        String quantityText = request.getParameter("quantity");
        int quantity = Integer.parseInt(quantityText);
        Product p = ProductService.getInstance().getProductById(idProduct);
        HttpSession session = request.getSession();
        session.setAttribute("BuyNowProduct", p);
        session.setAttribute("BuyNowQuantity", quantity);
        response.sendRedirect(url + "/BuyNow.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}