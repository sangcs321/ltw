package controller;

import model.Supplier;
import org.json.JSONObject;
import service.SupplierService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoadDetailSupplier", value = "/LoadDetailSupplier")
public class LoadDetailSupplier extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String idText = request.getParameter("id");
        int id = Integer.parseInt(idText);
        Supplier s = SupplierService.getInstance().selectSupById(id);
        JSONObject jsonRes = new JSONObject();
        JSONObject supJSON = new JSONObject();
        supJSON.put("id", s.getIdSup());
        supJSON.put("name", s.getNameSup());
        supJSON.put("phoneNumber", s.getPhoneNumber());
        supJSON.put("email", s.getEmail());
        supJSON.put("typeCate", s.typeCate(s.getIdCate()));
        supJSON.put("address", s.getAddress());
        jsonRes.put("supplier", supJSON);
        PrintWriter out = response.getWriter();
        response.getWriter().write(jsonRes.toString());
    }
}