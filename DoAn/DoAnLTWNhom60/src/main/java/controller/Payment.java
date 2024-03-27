package controller;

import com.google.gson.annotations.Until;
import model.*;
import service.InvoiceService;
import service.ProductService;
import util.Email;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;

@WebServlet(name = "Payment", value = "/Payment")
public class Payment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("Cart");
        Iterator<Product>  it = cart.list().iterator();
        double sum=(double) session.getAttribute("Sum");
        String name = a.getName();
        String phone=a.getPhoneNumber();
        String email=a.getEmail();
        String address=a.getAddressReceive();
        String startContent="Thông tin khách hàng: "+"<br>"+"Họ và tên: "+name+"<br>"+"Số điện thoại: "+phone+"<br>"+"Email: "+email+"<br>"+"Địa chỉ nhận hàng: "+address+"<br>";
        String content="Các sản phẩm đã đặt hàng:"+"<br>";
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String endContent="Tổng tiền: "+nF.format(sum);
        Product p;
        Invoice invoice = new Invoice(0,a.getId(),address,0,"Thanh toán khi nhận hàng",new Date(2023,12,27),0);
        if(InvoiceService.getInstance().insertInvoice(invoice)>0) {
            Invoice lastest = InvoiceService.getInstance().latestInvoice();
            while (it.hasNext()) {
                p = it.next();
                InvoiceDetail idt = new InvoiceDetail(lastest.getIdInvoice(), p.getIdProduct(), p.getPrice(), p.getQuantity());
                InvoiceService.getInstance().insertInvoiceDetail(idt);
                ProductService.getInstance().decreaseQuantity(p, p.getQuantity());
                content += "-Sản phẩm: " + p.getName() +" Giá: "+nF.format(p.getPrice())+ " Số lượng: " + p.getQuantity() + "<br>";
            }
            session.setAttribute("donePayment","done");
            session.setAttribute("Cart", null);
            Email.sendEmail(a.getEmail(), "Xác nhận đơn hàng từ HomeDecor", startContent + "<br>" + content + endContent);
            response.sendRedirect(url + "/Payment.jsp");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}