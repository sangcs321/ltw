    package controller;

    import dao.DAOProduct;
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
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.text.NumberFormat;
    import java.util.ArrayList;

    @WebServlet(name = "loadDetailInvoice", value = "/loadDetailInvoice")
    public class LoadDetailInvoice extends HttpServlet {
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            String idText = request.getParameter("id");
            int id = Integer.parseInt(idText);
            Invoice i = InvoiceService.getInstance().selectById(id);
            Account a = AccountService.getInstance().selectById(i.getIdAccount());
            ArrayList<Product> listP = new ArrayList<>();
            for (InvoiceDetail detail : i.getDetails()) {
                Product p = ProductService.getInstance().getProductById(detail.getIdProduct());
                p.setQuantity(detail.getQuantity());
                listP.add(p);
            }
            JSONObject jsonRes = new JSONObject();
            JSONObject invoiceJSON = new JSONObject();
            JSONArray htmlDataArray = new JSONArray();
            invoiceJSON.put("idInvoice", i.getIdInvoice());
            invoiceJSON.put("transFee", i.getTransFee());
            invoiceJSON.put("payMethod", i.getPayMethod());
            invoiceJSON.put("address", i.getAddress());
            invoiceJSON.put("name", a.getName());
            invoiceJSON.put("phoneNumber", a.getPhoneNumber());
            NumberFormat nF = NumberFormat.getCurrencyInstance();
            double totalPrice = 0;
            String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
            for(Product p: listP) {
                JSONObject productJSON = new JSONObject();
                productJSON.put("idProduct", p.getIdProduct());
                productJSON.put("idCate", p.getIdCate());
                productJSON.put("nameProduct", p.getName());
                productJSON.put("price", nF.format(p.getPrice()));
                productJSON.put("quantity", p.getQuantity());
                productJSON.put("color", p.getColor());
                String urlImage = (p.getImages().isEmpty())?"":p.getImages().get(0).getUrl();
                productJSON.put("image", url +"/Products/" +urlImage);
                productJSON.put("totalPrice", nF.format(p.getPrice()*p.getQuantity()));
                htmlDataArray.put(productJSON);
                totalPrice += p.getPrice()*p.getQuantity();
            }
            jsonRes.put("htmlData", htmlDataArray);
            jsonRes.put("invoice", invoiceJSON);
            jsonRes.put("total",nF.format(totalPrice));
            PrintWriter out = response.getWriter();
            response.getWriter().write(jsonRes.toString());
        }
        }

