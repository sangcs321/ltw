package controller;
import model.Category;
import model.InforWebsite;
import org.json.JSONObject;
import service.CategoryService;
import service.WebService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "LoadFooter", value = "/loadFooter")
public class LoadFooter extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        try {
            InforWebsite i = WebService.getInstance().selectByid(1);
            JSONObject introJson = new JSONObject();
            introJson.put("address", i.getAddress());
            introJson.put("email", i.getEmail());
            introJson.put("phoneNumber", i.getPhoneNumber());
            JSONObject res = new JSONObject();
            res.put("inforWebSite", introJson);
            PrintWriter out = response.getWriter();
            out.write(res.toString());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

