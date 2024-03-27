package controller;

import model.Account;
import model.VerifyAccount;
import service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;

@WebServlet(name = "VerifyAccount", value = "/verifyAccount")
public class Verify extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String err ="";
        String verifyCodeString = request.getParameter("verify");
        int verifyCode = Integer.parseInt(verifyCodeString);
        String email = request.getParameter("email");
        String url = "";
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("account");
        Account account = null;
        if(obj != null) {
            account = (Account) obj; //lấy ra account bằng session với trường hợp là đăng nhập rồi nhưng tài khoản chưa xác thực, xác thực lại
        }else{
            account = AccountService.getInstance().selectAccountByEmail(email);
        }
        VerifyAccount verifyAccount = AccountService.getInstance().selectVerifyAccountByIdAccount(account.getId());
        LocalDateTime currentTime = LocalDateTime.now();
        Duration duration = Duration.between(verifyAccount.getTimeCode(), currentTime);
        long timeExistCode = duration.getSeconds();
        if(timeExistCode > 600) {
            err ="Mã xác thực đã hết hiệu lực!";
            request.setAttribute("errCode",err);
            request.setAttribute("email",account.getEmail());
        }else if(verifyCode != verifyAccount.getVerifyCode()) {
            err ="Mã xác thực không chính xác!";
            request.setAttribute("errCode",err);
            request.setAttribute("email",account.getEmail());
        }else {
            verifyAccount.setStateVerify(true);
            AccountService.getInstance().updateStateVerify(verifyAccount);
            account.setVerifyAccount(verifyAccount);
            if(obj != null) {
                session.setAttribute("account", account);
                url ="homePage";
            }else{
                url = "SignIn.jsp";
            }
        }
        if(err.length() > 0) {
            url ="VerifyAccount.jsp";
        }
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}

