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
import java.sql.Date;
import java.util.ArrayList;

@WebServlet(name = "FilByStatus", value = "/filByStatus")
public class FilByStatusInvoice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset= UTF-8");
        String statusText = request.getParameter("status");
        String res = "";
        ArrayList<Invoice> listInvoice = null;
        int status = 0;
        if(statusText.equals("Đã xác nhận")) {
            status = 1;
        }else if(statusText.equals("Đã hủy")) {
            status = 2;
        }
        if(!statusText.equals("")) {
            listInvoice = InvoiceService.getInstance().getListByStatus(status);
            res = "Có " + listInvoice.size() + " đơn hàng có trạng thái '" + statusText + "'";
        }else {
            listInvoice = InvoiceService.getInstance().listInvoice();
        }
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        for (Invoice i : listInvoice) {
            JSONObject invoiceJSON = new JSONObject();
            invoiceJSON.put("id", i.getIdInvoice());
            invoiceJSON.put("idAccount", i.getIdAccount());
            invoiceJSON.put("startDate", i.getStartDate());
            String st ="" ;
            if(i.getStatus() == 0) {
                st ="Chờ xác nhận";
            }else if(i.getStatus() == 1) {
                st ="Đã xác nhận";
            }else {
                st ="Đã hủy";
            }
            invoiceJSON.put("status", st);
            htmlDataArray.put(invoiceJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}
