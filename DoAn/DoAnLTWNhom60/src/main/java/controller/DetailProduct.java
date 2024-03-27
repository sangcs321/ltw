package controller;

import model.Product;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "detail-product", value = "/detail-product")
public class DetailProduct extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String pid = request.getParameter("pid");
        String cidText = request.getParameter("cid");
        int cid = 0;
        if (cidText != null) {
            cid = Integer.parseInt(cidText);
        }
        Product product = ProductService.getInstance().getProductById(Integer.parseInt(pid));
        request.setAttribute("product", product);
        Product productSimilar = ProductService.getInstance().productSimilar(cid);
        request.setAttribute("productSimilar", productSimilar);
        try {
            request.getRequestDispatcher("DetailProduct.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}

