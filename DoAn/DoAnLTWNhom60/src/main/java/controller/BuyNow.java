package controller;

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
import java.util.Iterator;

@WebServlet(name = "BuyNow", value = "/BuyNow")
public class BuyNow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        Product p = (Product) session.getAttribute("BuyNowProduct");
        int quantity = (Integer) session.getAttribute("BuyNowQuantity");
        double sum=(double) session.getAttribute("Sum");
        String name = a.getName();
        String phone=a.getPhoneNumber();
        String email=a.getEmail();
        String address=a.getAddressReceive();
        String startContent="Thông tin khách hàng: "+"<br>"+"Họ và tên: "+name+"<br>"+"Số điện thoại: "+phone+"<br>"+"Email: "+email+"<br>"+"Địa chỉ nhận hàng: "+address+"<br>";
        String content="Các sản phẩm đã đặt hàng:"+"<br>";
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        String endContent="Tổng tiền: "+nF.format(sum);
        Invoice invoice = new Invoice(0,a.getId(),address,0,"Thanh toán khi nhận hàng",new Date(2023,12,27),0);
        if(InvoiceService.getInstance().insertInvoice(invoice)>0) {
            Invoice lastest = InvoiceService.getInstance().latestInvoice();
            InvoiceDetail idt = new InvoiceDetail(lastest.getIdInvoice(), p.getIdProduct(), p.getPrice(), quantity);
            InvoiceService.getInstance().insertInvoiceDetail(idt);
            ProductService.getInstance().decreaseQuantity(p,quantity);
            content = "-Sản phẩm: " + p.getName() +" Giá: "+nF.format(p.getPrice())+ " Số lượng: " + quantity + "<br>";
        }
        session.setAttribute("BuyNowProduct", null);
        session.setAttribute("BuyNowQuantity", null);
        session.setAttribute("doneBuyNow","done");
        Email.sendEmail(a.getEmail(), "Xác nhận đơn hàng từ HomeDecor", startContent + "<br>" + content + endContent);
        response.sendRedirect(url + "/BuyNow.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}