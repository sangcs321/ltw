package controller;

import model.Invoice;
import model.Product;
import org.json.JSONArray;
import org.json.JSONObject;
import service.InvoiceService;
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

@WebServlet(name = "AcceptInvoice", value = "/acceptInvoice")
public class AcceptInvoice extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String res = "";
        if (InvoiceService.getInstance().updateStatus(id, 1) > 0) {
             res = "Đã xác nhận đơn hàng!";
        } else {
            res = "Đã xảy ra lỗi!";
        }
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        ArrayList<Invoice> listInvoice = InvoiceService.getInstance().listInvoice();
        for (Invoice i : listInvoice) {
            JSONObject invoiceJSON = new JSONObject();
            invoiceJSON.put("id", i.getIdInvoice());
            invoiceJSON.put("idAccount", i.getIdAccount());
            invoiceJSON.put("startDate", i.getStartDate());
            String status ="";
            if(i.getStatus() == 0) {
                status = "Chờ xác nhận";
            }else if(i.getStatus() == 1) {
                status ="Đã xác nhận";
            }else {
                status = "Đã hủy";
            }
            invoiceJSON.put("status", status);
            htmlDataArray.put(invoiceJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}
