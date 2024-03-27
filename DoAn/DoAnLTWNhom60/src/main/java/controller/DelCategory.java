package controller;
import model.Category;
import org.json.JSONArray;
import org.json.JSONObject;
import service.CategoryService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
@WebServlet(name = "delCategory", value = "/delCategory")
public class DelCategory extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String idCategoryText = request.getParameter("id");
            int idCate = Integer.parseInt(idCategoryText);
            String res = "";
            JSONObject jsonResponse = new JSONObject();
            JSONArray htmlDataArray = new JSONArray();
            ArrayList<Category> listCategory = null;
            if (CategoryService.getInstance().delCategory(idCate) > 0) {
                listCategory = CategoryService.getInstance().listCategory();
                res = "Xóa thành công!";
            } else {
                res = "Đã xảy ra lỗi!";
                listCategory = CategoryService.getInstance().listCategory();
            }
            for (Category c : listCategory) {
                JSONObject cateJSON = new JSONObject();
                cateJSON.put("id", c.getId());
                cateJSON.put("name", c.getName());
                htmlDataArray.put(cateJSON);
            }
            jsonResponse.put("htmlData", htmlDataArray);
            jsonResponse.put("res", res);
            PrintWriter out = response.getWriter();
            out.println(jsonResponse.toString());
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
