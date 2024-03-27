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
import java.sql.SQLException;
import java.util.ArrayList;
@WebServlet(name = "editCategory", value = "/editCategory")
public class EditCategory extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String categoryId = request.getParameter("categoryId");
            int categoryIdInt = Integer.parseInt(categoryId);
            String name = request.getParameter("nameCateEdit");
            Category newCategory = new Category(categoryIdInt, name);
            String res = "";
            try {
                if (CategoryService.getInstance().updateCategory(newCategory) > 0) {
                    res = "Chỉnh sửa danh mục thành công!";
                } else {
                    res = "Đã xảy ra lỗi!";
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log stack trace
                res = "Đã xảy ra lỗi!";
            }
            ArrayList<Category> listCategory = CategoryService.getInstance().listCategory();
            JSONObject jsonResponse = new JSONObject();
            JSONArray htmlDataArray = new JSONArray();
            for (Category c : listCategory) {
                JSONObject categoryJSON = new JSONObject();
                categoryJSON.put("id", c.getId());
                categoryJSON.put("name", c.getName());
                htmlDataArray.put(categoryJSON);
            }
            jsonResponse.put("htmlData", htmlDataArray);
            jsonResponse.put("res", res);
            PrintWriter out = response.getWriter();
            out.println(jsonResponse.toString());
    }
}


