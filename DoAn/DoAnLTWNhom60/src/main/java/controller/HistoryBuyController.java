package controller;

import model.Account;
import model.Invoice;
import model.Product;
import service.AccountService;
import service.InvoiceService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "History", value = "/history")
public class HistoryBuyController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("account");
        if (obj == null) {
            response.sendRedirect("SignIn.jsp");
        } else {
            Account account = (Account) obj;
            ArrayList<Invoice> listInvoiceWaitting = InvoiceService.getInstance().getListOfCus(0, 0, account.getId());
            request.setAttribute("listInvoiceWaitting", listInvoiceWaitting);
            ArrayList<Invoice> listInvoiceConfirmed = InvoiceService.getInstance().getListOfCus(1, 0, account.getId());
            request.setAttribute("listInvoiceConfirmed", listInvoiceConfirmed);
            ArrayList<Invoice> listInvoiceCanceled = InvoiceService.getInstance().getListOfCus(2, 0, account.getId());
            request.setAttribute("listInvoiceCanceled", listInvoiceCanceled);
            try {
                request.getRequestDispatcher("HistoryBuy.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    }
}

