package controller;
import model.Category;
import org.json.JSONObject;
import service.CategoryService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "loadDetailCategory", value = "/loadDetailCategory")
public class LoadDetailCategory extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String categoryId = request.getParameter("id");
        int categoryIdInt = Integer.parseInt(categoryId);

        Category c = CategoryService.getInstance().getCategoryById(categoryIdInt);
        JSONObject jsonRes = new JSONObject();
        JSONObject categoryJSON = new JSONObject();
        categoryJSON.put("id", c.getId());
        categoryJSON.put("name", c.getName());
        jsonRes.put("category", categoryJSON);

        PrintWriter out = response.getWriter();
        out.write(jsonRes.toString());
    }
}

