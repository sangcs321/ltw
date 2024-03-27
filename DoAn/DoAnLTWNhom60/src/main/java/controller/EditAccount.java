package controller;

import dao.DAOAccount;
import model.Account;
import org.json.JSONArray;
import org.json.JSONObject;
import service.AccountService;
import util.Encrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
@WebServlet(name = "editAccount", value = "/editAccount")
public class EditAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String pw = request.getParameter("password");
        String password = "";
        if(!pw.equals(AccountService.getInstance().selectById(id).getPassword())) {
            password = Encrypt.toSHA1(pw);
        }
        String gender = request.getParameter("gender");
        Date birthDay = Date.valueOf(request.getParameter("birthDay"));
        String address = request.getParameter("address");
        String addressReceive = request.getParameter("addressRecei");
        String per = request.getParameter("role");
        int role = 0;
        if(per.equals("Nhân viên")) {
            role = 1;
        }else if(per.equals("Khách hàng")) {
            role = 2;
        }
        String res = "";
        Account account = new Account(id, name, email, password, phoneNumber, gender, birthDay, address, addressReceive,role);
        try {
            if(DAOAccount.updateInforAccount(account) > 0) {
                res = "Thay đổi thông tin thành công!";
            }else {
                res = "Thay đổi thông tin thất bại!";
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
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
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}
