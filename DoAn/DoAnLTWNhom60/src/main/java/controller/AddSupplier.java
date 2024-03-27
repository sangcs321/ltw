package controller;

import model.Supplier;
import org.json.JSONArray;
import org.json.JSONObject;
import service.SupplierService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet(name = "AddSupplier", value = "/AddSupplier")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class AddSupplier extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String nameSup = request.getParameter("nameSupAdd");
        String addressSup = request.getParameter("addressSupAdd");
        String phoneSup = request.getParameter("phoneSupAdd");
        String emailSup = request.getParameter("emailSupAdd");
        String typeCate = request.getParameter("cateChairSupAdd");
        int idCate = 3;
        if (typeCate.equals("Ghế thư giãn")) {
            idCate = 4;
        } else if (typeCate.equals("Ghế trang trí")) {
            idCate = 1;
        } else if (typeCate.equals("Ghế gaming")) {
            idCate = 2;
        }
        String err = "";
        String res = "";
        if (nameSup.equals("")) {
            err = "Vui lòng nhập tên nhà cung cấp!";
            request.setAttribute("errNameSupAdd", err);
        } else if (phoneSup.equals("")) {
            err = "Vui lòng nhập số điện thoại nhà cung cấp!";
            request.setAttribute("errPhoneSupAdd", err);
        } else if (emailSup.equals("")) {
            err = "Vui lòng nhập Email nhà cung cấp!";
            request.setAttribute("errEmailSupAdd", err);
        } else if (addressSup.equals("")) {
            err = "Vui lòng nhập địa chỉ!";
            request.setAttribute("errAddressSupAdd", err);
        } else {
            Supplier supplier = new Supplier(nameSup, phoneSup, emailSup, idCate, addressSup);
            System.out.println(supplier);
            if (SupplierService.getInstance().insertSupplier(supplier) > 0) {
                res = "Thêm nhà cung cấp thành công!";
            }
        }

        ArrayList<Supplier> suplist = SupplierService.getInstance().listAllSupplier();
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
        for (Supplier s : suplist) {
            JSONObject supJSON = new JSONObject();
            supJSON.put("idSup", s.getIdSup());
            supJSON.put("nameSup", s.getNameSup());
            supJSON.put("phoneSup", s.getPhoneNumber());
            supJSON.put("addressSup", s.getAddress());
            supJSON.put("nameCate", s.typeCate(s.getIdCate()));
            supJSON.put("emailSup", s.getEmail());
            htmlDataArray.put(supJSON);
        }
        jsonResponse.put("htmlData", htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
    }


    public static void main(String[] args) {
        ArrayList<Supplier> suplist = SupplierService.getInstance().listAllSupplier();
        for (Supplier s : suplist
        ) {
            System.out.println(s.toString());
        }

    }
}