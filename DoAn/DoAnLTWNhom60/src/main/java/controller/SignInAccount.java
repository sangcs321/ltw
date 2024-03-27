package controller;

import dao.DAOAccount;
import model.Account;
import model.VerifyAccount;
import service.AccountService;
import util.Encrypt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "signInAccount", value = "/signInAccount")
public class SignInAccount extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Nhận thông tin từ yêu cầu đăng nhập
        String userName = request.getParameter("idFormInput");
        String password = request.getParameter("idFormPass");
        String err = "";
        //Kiểm tra điều kiện ở phía server
        if ((userName == null || userName.trim().isEmpty()) && (password == null || password.trim().isEmpty())) {
            err = "Bạn chưa nhập tên đăng nhập hoặc mật khẩu!";
        } else if (userName == null || userName.trim().isEmpty()) {
            err = "Bạn chưa nhập tên đăng nhập!";
        } else if (password == null || password.trim().isEmpty()) {
            err = "Bạn chưa nhập mật khẩu!";
        } else if (userName.length() > 50 || !userName.matches("^[a-zA-Z0-9_]+$")) {
            err = "Tên đăng nhập không hợp lệ!";
        } else {
            if (AccountService.getInstance().checkExistUserName(userName)) {
                String encryptPass = Encrypt.toSHA1(password);
                Account account = AccountService.getInstance().getAccount(userName, encryptPass);
                if(account != null){
                    if(!account.isStatus()){
                        err = "Tài khoản của bạn đã bị cấm!";
                    }else {
                        VerifyAccount vrf = AccountService.getInstance().getVrfOfAccount(account.getId());
                        account.setVerifyAccount(vrf);
                        HttpSession session = request.getSession();
                        session.setAttribute("account", account);
                        response.sendRedirect("homePage");
                        return;
                    }
                } else {
                    err = "Tài khoản hoặc mật khẩu không chính xác!";
                }
            } else {
                err = "Tài khoản hoặc mật khẩu không chính xác!";
            }
        }
        request.setAttribute("err", err);
        request.getRequestDispatcher("SignIn.jsp").forward(request, response);
    }
}
