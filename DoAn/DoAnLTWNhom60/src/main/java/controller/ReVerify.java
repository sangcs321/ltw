package controller;

import model.Account;
import model.VerifyAccount;
import service.AccountService;
import util.Email;
import util.NumberRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;

@WebServlet(name = "reVerifyCode", value = "/reVerifyCode")
public class ReVerify extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("account");
        Account account = null;
        if(obj != null) {
            account = (Account) obj; //lấy ra account bằng session với trường hợp là đăng nhập rồi nhưng tài khoản chưa xác thực, xác thực lại
        }else{
            account = AccountService.getInstance().selectAccountByEmail(email);
        }
        String code = NumberRandom.getSoNgauNhien();
        int codeNew = Integer.parseInt(code);
        LocalDateTime timeNew = LocalDateTime.now();
        if(AccountService.getInstance().updateVerify(codeNew, timeNew,  account.getId()) > 0) {
            Email.sendEmail(account.getEmail(), "Xác thực tài khoản", "Mã xác thực tài khoản HomeDecor của bạn là: " + code);
            request.setAttribute("email", account.getEmail());
        }
        try {
            request.getRequestDispatcher("VerifyAccount.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}

