package controller;

import model.Account;
import model.VerifyAccount;
import org.json.JSONArray;
import org.json.JSONObject;
import service.AccountService;
import util.Email;
import util.Encrypt;
import util.NumberRandom;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "addAccount", value = "/addAccount")
public class AddAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String passwordEncrypt = Encrypt.toSHA1(password);
        String rePassword = request.getParameter("rePw");
        String email = request.getParameter("email");
        String res = "";
        String errUser ="";
        String errEmail ="";
        if (AccountService.getInstance().checkExistUserName(userName)) {
            errUser = "Tên tài khoản đã tồn tại!";
        } else if (AccountService.getInstance().checkExistEmail(email)) {
            errEmail = "Email đã tồn tại!";
        } else {
            Account account = new Account(userName, passwordEncrypt, email);
            if (AccountService.getInstance().registerAccount(account) > 0) {
                Account accountAferRegis = AccountService.getInstance().selectAccountByUserName(account.getUserName());
                String verifyCodeString = NumberRandom.getSoNgauNhien();
                int verifyCode = Integer.parseInt(verifyCodeString);
                LocalDateTime timeCode = LocalDateTime.now();
                VerifyAccount verifyAccount = new VerifyAccount(accountAferRegis.getId(), verifyCode, timeCode, false);
                if (AccountService.getInstance().insertVerify(verifyAccount) > 0) {
                    Email.sendEmail(accountAferRegis.getEmail(), "Xác thực tài khoản", "Mã xác thực tài khoản HomeDecor của bạn là: " + verifyCode);
                    request.setAttribute("email", accountAferRegis.getEmail());
                }
                res = "Thêm tài khoản thành công!";
            }else {
                res = "Thêm tài khoản thất bại!";
            }
        }
        ArrayList<Account> listAccount = AccountService.getInstance().listAllAccount();
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        for (Account a : listAccount) {
            JSONObject accountJSON = new JSONObject();
            accountJSON.put("id", a.getId());
            accountJSON.put("name", a.getName());
            accountJSON.put("email", a.getEmail());
            String per2 = "Khách hàng";
            if(a.getRole() == 0) {
                per2 = "Admin";
            }else if(a.getRole() == 1) {
                per2 ="Nhân viên";
            }
            accountJSON.put("role", per2);
            String vrf = "Chưa xác thực";
            if (a.getVerifyAccount().isStateVerify()) {
                vrf = "Đã xác thực";
            }
            accountJSON.put("vrf", vrf);
            String status = "Đã khóa";
            if (a.isStatus()) {
                status = "Hoạt động";
            }
            accountJSON.put("status", status);
            htmlDataArray.put(accountJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        jsonResponse.put("user", userName);
        jsonResponse.put("email", email);
        jsonResponse.put("errUser", errUser);
        jsonResponse.put("errEmail", errEmail);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}
