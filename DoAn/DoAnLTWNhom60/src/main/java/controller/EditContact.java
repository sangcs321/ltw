package controller;
import model.InforWebsite;
import service.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name = "editContact", value = "/editContact")
public class EditContact extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        try {
            String idText = request.getParameter("id");
            int id = Integer.parseInt(idText);
            String address = request.getParameter("editAddress");
            String email = request.getParameter("editEmail");
            String phoneNumber = request.getParameter("editPhoneNumber");
            InforWebsite updatedInfo = new InforWebsite(id, address, email, phoneNumber);
            int result = WebService.getInstance().updateContact(updatedInfo);
            String res = "";
            InforWebsite i = null;
            if (result > 0) {
                i = WebService.getInstance().selectByid(id);
                res ="Cập nhật thành công!";
            } else {
                i = WebService.getInstance().selectByid(id);
                res="Cập nhật không thành công!";
            }
            request.setAttribute("infor", i);
            request.setAttribute("res", res);
        } catch (NumberFormatException | SQLException e) {
            throw new ServletException("Error processing form data", e);
        }
        request.getRequestDispatcher("IntroWebsite.jsp").forward(request, response);
    }
}
