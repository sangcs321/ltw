package controller;

import model.Category;
import model.InforWebsite;
import model.Product;
import service.CategoryService;
import service.InvoiceService;
import service.ProductService;
import service.WebService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "IntroWebsite", value = "/introWebsite")
public class InforController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        try {
            InforWebsite i = WebService.getInstance().selectByid(1);
            request.setAttribute("infor", i);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            request.getRequestDispatcher("IntroWebsite.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }
}
