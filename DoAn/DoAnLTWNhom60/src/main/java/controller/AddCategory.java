package controller;
import model.Category;
import org.json.JSONArray;
import org.json.JSONObject;
import service.CategoryService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "addCategory", value = "/addCategory")
public class AddCategory extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        String categoryName = request.getParameter("nameCateAdd");
        Category category = new Category(categoryName);
        String res = "";
        // Thêm danh mục vào cơ sở dữ liệu
        if (CategoryService.getInstance().insertCategory(category) > 0) {
            res = "Thêm danh mục thành công!";
        } else {
            res = "Đã xảy ra lỗi khi thêm danh mục!";
        }
        ArrayList<Category> listCategory = CategoryService.getInstance().listCategory();
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        for (Category c : listCategory) {
            JSONObject cateJSON = new JSONObject();
            cateJSON.put("id", c.getId());
            cateJSON.put("name", c.getName());
            htmlDataArray.put(cateJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        // Gửi JSON response về client
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }
}