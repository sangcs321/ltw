package controller;

import model.Category;
import service.CategoryService;
import model.Account;
import model.Invoice;
import model.Product;
import model.Supplier;
import service.ProductService;
import service.SupplierService;
import service.AccountService;
import service.InvoiceService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "manage", value = "/manage")
public class ManageController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("account");
        if (obj == null) {
            response.sendRedirect("SignIn.jsp");
        } else {
            ArrayList<Invoice> listAllInvoice = InvoiceService.getInstance().listInvoice();
            request.setAttribute("listAllInvoice", listAllInvoice);
            ArrayList<Supplier> suplist = SupplierService.getInstance().listAllSupplier();
            request.setAttribute("listAllSup", suplist);
            ArrayList<Category> listCategory = CategoryService.getInstance().listCategory();
            request.setAttribute("listCategory", listCategory);
            ArrayList<Product> listAllProduct = ProductService.getInstance().listAllProduct();
            request.setAttribute("listAllProduct", listAllProduct);
            ArrayList<Account> listAllAccount = AccountService.getInstance().listAllAccount();
            request.setAttribute("listAllAccount", listAllAccount);
            try {
                request.getRequestDispatcher("ManageAdmin.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    }
}

