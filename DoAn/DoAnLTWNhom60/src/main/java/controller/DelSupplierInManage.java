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
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;

@WebServlet(name = "DelSupplierInManage", value = "/DelSupplierInManage")
public class DelSupplierInManage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("html/text; charset= UTF-8");
        String idSupText = request.getParameter("id");
        int idSup = Integer.parseInt(idSupText);
        String res = "";
        JSONObject jsonResponse = new JSONObject();
        JSONArray htmlDataArray = new JSONArray();
//        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        ArrayList<Supplier> suplist = null;
        if(SupplierService.getInstance().delSupplier(idSup)>0) {
            suplist = SupplierService.getInstance().listAllSupplier();
            res = "Xóa thành công!";
        }else {
            res = "Đã xảy ra lỗi!";
            suplist = SupplierService.getInstance().listAllSupplier();
        }
        for(Supplier s : suplist){
            JSONObject supJSON = new JSONObject();
            supJSON.put("idSup",s.getIdSup());
            supJSON.put("nameSup",s.getNameSup());
            supJSON.put("phoneSup",s.getPhoneNumber());
            supJSON.put("addressSup",s.getAddress());
            supJSON.put("nameCate",s.typeCate(s.getIdCate()));
            supJSON.put("emailSup",s.getEmail());
            htmlDataArray.put(supJSON);
        }
        jsonResponse.put("htmlData",htmlDataArray);
        jsonResponse.put("res", res);
        PrintWriter out= response.getWriter();
        out.println(jsonResponse.toString());
    }
        public String typeCate(int idCate){
        if(idCate==3)return "Ghế văn phòng";
        else if(idCate==4) return "Ghế thư giãn";
        else if(idCate==1) return "Ghế trang trí";
        else if(idCate==2) return "Ghế Gaming";
        return null;
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    public static void main(String[] args) {
        ArrayList<Supplier> suplist =SupplierService.getInstance().listAllSupplier();
        for(Supplier s : suplist){
            System.out.println(s.getIdSup());
        }
    }

}