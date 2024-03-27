package controller;
import model.Cart;
import model.Product;
import service.ProductService;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.ArrayList;
@WebServlet(name = "loadProductByIdCate", value = "/loadProductByIdCate")
public class LoadProductByIdCate extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String cid = request.getParameter("cid");
        ArrayList<Product> listSixProduct = ProductService.getInstance().listProductByIdCate(Integer.parseInt(cid), 0);
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("Cart");
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        int quantity = 1;
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        for(Product p: listSixProduct){
            if (cart != null) {
                if (cart.get(p.getIdProduct()) != null) {
                    quantity = cart.get(p.getIdProduct()).getQuantity() + 1;
                } else {
                    quantity = p.getQuantity();
                }
            }
            out.println(" <div class=\"col-lg-4 col-sm-6 mt-3 product\">\n" +
                    "                            <div class=\"card\">\n" +
                    "                                <a href=\"detail-product?pid=" + p.getIdProduct() + "&cid=" + p.getIdCate() + "\">\n"+
                                                    "<img src=\"" + url + "\\Products\\" + ((p.getImages().isEmpty())?"":p.getImages().get(0).getUrl()) + "\" class=\"card-img-top img_p\" alt=\"...\">"+
                    "                                </a>\n" +
                    "                                <div class=\"card-body\">\n" +
                    "                                    <h5 class=\"card-title\">"+p.getName()+"</h5>\n" +
                    "                                    <p class=\"card-text\">\n" +
                    "                                    <p class=\"price\">"+nF.format(p.getPrice())+"\n" +
                    "                                    <a href =\""+url+"/cartController?id="+p.getIdProduct()+"&quantity="+quantity+"\"><i class=\"fa fa-shopping-cart cart\" aria-hidden=\"true\" title=\"Thêm vào giỏ hàng\"></i></a>\n" +
                    "                                    </p>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                        </div>");
        }

    }
}

