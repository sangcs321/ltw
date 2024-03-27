    package controller;

    import model.Account;
    import model.Invoice;
    import model.InvoiceDetail;
    import model.Product;
    import org.json.JSONArray;
    import org.json.JSONObject;
    import service.AccountService;
    import service.InvoiceService;
    import service.ProductService;

    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import java.io.File;
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.text.NumberFormat;
    import java.util.ArrayList;

    @WebServlet(name = "LoadCarousel", value = "/loadCarousel")
    public class LoadCarousel extends HttpServlet {
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            String source = "D:\\ltw\\DoAn\\DoanLTWNhom60\\src\\main\\webapp\\image\\Carousel";
            File file = new File( source);
            File[] files = file.listFiles();
            JSONArray caJSON = new JSONArray();
            for (File f: files) {
               caJSON.put(f.getName());
            }
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("htmlData", caJSON);
            PrintWriter out = response.getWriter();
            out.println(jsonResponse.toString());
        }
        }

