package controller;

import model.Account;
import model.VerifyAccount;
import service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "ChangeInforInPayment", value = "/ChangeInforInPayment")
public class ChangeInforInPayment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String name = request.getParameter("TenHT");
        String phoneNumber = request.getParameter("SDTHT");
        String email = request.getParameter("GmailHT");
        String gender = request.getParameter("gender");
        Date birthDay = Date.valueOf(request.getParameter("HienThiNS"));
        String address = request.getParameter("DCHT");
        String addressReceive = request.getParameter("DCNHHT");
        String buynow = request.getParameter("buynow");
        String res = "";
        if (name == null || name.trim().isEmpty()) {
            res = "Vui lòng nhập họ và tên!";
        } else if (email == null || email.trim().isEmpty()) {
            res = "Vui lòng nhập Email!";
        } else if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            res = "Email không hợp lệ!";
        } else if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
            res = "Vui lòng nhập số điện thoại!";
        } else if (!phoneNumber.matches("^\\d{10}$")) {
            res = "Số điện thoại không hợp lệ!";
        } else if (address == null || address.trim().isEmpty()) {
            res = "Vui lòng nhập địa chỉ!";
        } else if (birthDay == null) {
            res = "Vui lòng chọn ngày sinh!";
        } else {
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("account");
            Account account = (Account) obj;
            Account accountNew = new Account(account.getId(), name, email, phoneNumber, gender, birthDay, address, addressReceive);
            VerifyAccount vrf = AccountService.getInstance().getVrfOfAccount(account.getId());
            accountNew.setVerifyAccount(vrf);
            session.setAttribute("account", accountNew);
            if (AccountService.getInstance().updateInfor(accountNew) > 0) {
                res = "Cập nhật thành công!";
            } else {
                res = "Cập nhật thất bại!";
            }
        }
        request.setAttribute("res", res);
        if(buynow!=null) {
            request.getRequestDispatcher("BuyNow.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("Payment.jsp").forward(request, response);
        }
    }
}