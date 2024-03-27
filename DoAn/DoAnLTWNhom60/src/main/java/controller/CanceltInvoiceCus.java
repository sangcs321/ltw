package controller;

import model.Invoice;
import org.json.JSONArray;
import org.json.JSONObject;
import service.InvoiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "cancelInvoiceCus", value = "/cancelInvoiceCus")
public class CanceltInvoiceCus extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String res = "";
        if (InvoiceService.getInstance().updateStatus(id, 2) > 0) {
            InvoiceService.getInstance().backQuantity(id);
             res = "Đã hủy đơn hàng!";
        } else {
            res = "Đã xảy ra lỗi!";
        }
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        ArrayList<Invoice> listInvoice = InvoiceService.getInstance().getListByStatus(0);
        for (Invoice i : listInvoice) {
            JSONObject invoiceJSON = new JSONObject();
            invoiceJSON.put("id", i.getIdInvoice());
            invoiceJSON.put("idAccount", i.getIdAccount());
            invoiceJSON.put("startDate", i.getStartDate());
            invoiceJSON.put("totalPrice", i.totalPrice());
            htmlDataArray.put(invoiceJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}
