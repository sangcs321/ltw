package controller;
import javax.servlet.http.*;

import model.Account;

import service.AccountService;
import util.Email;
import util.Encrypt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.security.SecureRandom;
@WebServlet(name = "changePassword", value = "/changePassword")
public class ChangePassword extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String password = req.getParameter("password");
        String newpassword = req.getParameter("new_password");
        String repassword = req.getParameter("re_password");
        String passEncrypt = Encrypt.toSHA1(password);
        String repassEncrypt = Encrypt.toSHA1(repassword);
        String err = "";
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if(password==null){
            err="Vui lòng nhập mật khẩu hiện tại!";
            req.setAttribute("errPass",err);
        }
        if(newpassword==null){
            err="Vui lòng nhập mật khẩu hiện tại!";
            req.setAttribute("errNewPass",err);
        }
        if(repassword==null){
            err="Vui lòng nhập mật khẩu hiện tại!";
            req.setAttribute("errReNewPass",err);
        }else if(password==newpassword){
            err="Mật khẩu mới trùng với mật khẩu hiện tại!";
            req.setAttribute("errNewPass",err);
        }
        else if(!newpassword.equals(repassword)){
            err="Mật khẩu mới không chính xác";
            req.setAttribute("errReNewPass",err);
        }
        else if(passEncrypt.equals(account.getPassword())){
            AccountService.updatePassword(repassEncrypt,account.getId());
            session.setAttribute("password",newpassword);
            err="Đổi mật khẩu thành công!";
            req.setAttribute("success",err);
        }else{
            err="Mật khẩu hiện tại không chính xác!";
            req.setAttribute("errPass",err);
        }
        req.getRequestDispatcher("ChangePW.jsp").forward(req,resp);

    }
}
