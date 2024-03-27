package controller;

import dao.DAOSupplier;
import model.Supplier;
import org.json.JSONArray;
import org.json.JSONObject;
import service.SupplierService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "EditSupplier", value = "/EditSupplier")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class EditSupplier extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        String name = request.getParameter("nameSupEdit");
        String address = request.getParameter("addressSupEdit");
        String phone = request.getParameter("phoneSupEdit");
        String email = request.getParameter("emailSupEdit");
        String typeCate = request.getParameter("cateChairSupEdit");
        int idCate = 3;
        if (typeCate.equals("Ghế thư giãn")) {
            idCate = 4;
        } else if (typeCate.equals("Ghế trang trí")) {
            idCate = 1;
        } else if (typeCate.equals("Ghế gaming")) {
            idCate = 2;
        }
        String res = "";
        Supplier sup = new Supplier(id,name,phone,email,idCate,address);
        try {
            if(DAOSupplier.updateInforSupplier(sup)>0) {
                res = "Thay đổi thông tin thành công!";
            }else {
                res = "Thay đổi thông tin thất bại!";
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ArrayList<Supplier> suplist = SupplierService.getInstance().listAllSupplier();
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        for (Supplier s : suplist) {
            JSONObject supJSON = new JSONObject();
            supJSON.put("idSup", s.getIdSup());
            supJSON.put("nameSup", s.getNameSup());
            supJSON.put("phoneSup", s.getPhoneNumber());
            supJSON.put("addressSup", s.getAddress());
            supJSON.put("nameCate", s.typeCate(s.getIdCate()));
            supJSON.put("emailSup", s.getEmail());
            htmlDataArray.put(supJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}