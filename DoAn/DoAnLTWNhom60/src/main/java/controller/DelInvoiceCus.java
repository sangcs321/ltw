package controller;

import model.Account;
import model.Invoice;
import org.json.JSONArray;
import org.json.JSONObject;
import service.InvoiceService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.ArrayList;

@WebServlet(name = "DelInvoiceCus", value = "/delInvoiceCus")
public class DelInvoiceCus extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String status = request.getParameter("status");
        String res = "";
        ArrayList<Invoice> listInvoice = null;
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("account");
        Account account = (obj != null)?(Account) obj:null;
        if(InvoiceService.getInstance().delInvoiceCus(id)>0) {
            listInvoice = InvoiceService.getInstance().getListOfCus((status.equals("confirm")?1:2),0, account.getId());
            res = "Xóa thành công!";
        }else {
            res = "Đã xảy ra lỗi!";
            listInvoice = InvoiceService.getInstance().getListOfCus((status.equals("confirm")?1:2),0, account.getId());
        }
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        for (Invoice i : listInvoice) {
            JSONObject invoiceJSON = new JSONObject();
            invoiceJSON.put("id", i.getIdInvoice());
            invoiceJSON.put("startDate", i.getStartDate());
            invoiceJSON.put("totalPrice", nF.format(i.totalPrice()));
            htmlDataArray.put(invoiceJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}

