    package controller;

    import com.google.gson.Gson;
    import model.Category;
    import model.Product;
    import org.json.JSONObject;
    import service.CategoryService;
    import service.ProductService;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.text.NumberFormat;

    @WebServlet(name = "loadDetailProduct", value = "/loadDetailProduct")
    public class LoadDetailProduct extends HttpServlet {
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
                    // Đoạn mã hiện tại để lấy chi tiết sản phẩm...
                    request.setCharacterEncoding("UTF-8");
                    response.setCharacterEncoding("UTF-8");
                    response.setContentType("application/json");

                    String id = request.getParameter("idProduct");
                    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
                     NumberFormat nF = NumberFormat.getCurrencyInstance();
            Product p = ProductService.getInstance().getProductById(Integer.parseInt(id));
            Category category = CategoryService.getInstance().getCategoryById(p.getIdCate());
            JSONObject jsonRes = new JSONObject();
            JSONObject productJSON = new JSONObject();
            productJSON.put("idProduct", p.getIdProduct());
            productJSON.put("imageCenter", url +"\\Products\\" +((p.getImages().isEmpty())?"":p.getImages().get(0).getUrl()));
            productJSON.put("imageDetail",p.getImages());
            productJSON.put("name", p.getName());
            productJSON.put("priceImport", nF.format(p.getPriceImport()));
            productJSON.put("price", nF.format(p.getPrice()));
            productJSON.put("quantityAvailable", p.getQuantityAvailable());
            productJSON.put("color", p.getColor());
            productJSON.put("material", p.getMaterial());
            productJSON.put("description", p.getDescription());
            productJSON.put("width", p.getWidth());
            productJSON.put("height", p.getHeight());
            productJSON.put("length", p.getLength());
            productJSON.put("typeCate", category.getName());
            jsonRes.put("product", productJSON);
            PrintWriter out = response.getWriter();
            response.getWriter().write(jsonRes.toString());
                }
        }

