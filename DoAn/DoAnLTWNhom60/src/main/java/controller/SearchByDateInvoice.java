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

@WebServlet(name = "SearchByDate", value = "/searchByDate")
public class SearchByDateInvoice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset= UTF-8");
        String dateText = request.getParameter("date");
        Date date = java.sql.Date.valueOf(dateText);
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        ArrayList<Invoice> listInvoice = InvoiceService.getInstance().searchByStartDate(date);
        for (Invoice i : listInvoice) {
            JSONObject invoiceJSON = new JSONObject();
            invoiceJSON.put("id", i.getIdInvoice());
            invoiceJSON.put("idAccount", i.getIdAccount());
            invoiceJSON.put("startDate", i.getStartDate());
            String status ="" ;
            if(i.getStatus() == 0) {
                status ="Chờ xác nhận";
            }else if(i.getStatus() == 1) {
                status ="Đã xác nhận";
            }else {
                status ="Đã hủy";
            }
            invoiceJSON.put("status", status);
            htmlDataArray.put(invoiceJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", "Có " +listInvoice.size() + " đơn hàng xuất ngày '" + date.toString() + "'");
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}
