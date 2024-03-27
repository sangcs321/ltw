    package controller;

    import model.Account;
    import model.Category;
    import model.Product;
    import org.json.JSONObject;
    import service.AccountService;
    import service.CategoryService;
    import service.ProductService;

    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.text.NumberFormat;

    @WebServlet(name = "loadDetailAccount", value = "/loadDetailAccount")
    public class LoadDetailAccount extends HttpServlet {
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            String idText = request.getParameter("id");
            int id = Integer.parseInt(idText);
            Account a = AccountService.getInstance().selectById(id);
            JSONObject jsonRes = new JSONObject();
            JSONObject accountJSON = new JSONObject();
            accountJSON.put("id", a.getId());
            accountJSON.put("name", a.getName());
            accountJSON.put("phoneNumber", a.getPhoneNumber());
            accountJSON.put("email", a.getEmail());
            accountJSON.put("password", a.getPassword());
            accountJSON.put("gender", a.getGender());
            accountJSON.put("birthDay", a.getBirthDay());
            accountJSON.put("address", a.getAddress());
            accountJSON.put("addressRecei", a.getAddressReceive());
            String checkStaff = "Khách hàng";
            if(a.getRole() == 1) {
                checkStaff = "Nhân viên";
            }else if(a.getRole() == 0) {
                checkStaff ="Admin";
            }
            accountJSON.put("checkStaff", checkStaff);
            jsonRes.put("account", accountJSON);
            PrintWriter out = response.getWriter();
            response.getWriter().write(jsonRes.toString());
                }
        }

