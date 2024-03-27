    package controller;
    import org.json.JSONObject;
    import javax.servlet.ServletException;
    import javax.servlet.annotation.MultipartConfig;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import javax.servlet.http.Part;
    import java.io.File;
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.nio.file.Paths;
    import java.util.ArrayList;
    import java.util.Arrays;
    import java.util.List;
    @WebServlet(name = "EditCarousel", value = "/editCarousel")
    @MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
            maxFileSize = 1024 * 1024 * 10, // 10MB
            maxRequestSize = 1024 * 1024 * 50)
    public class EditCarousel extends HttpServlet {
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            String realPath = getServletContext().getRealPath("/");
            String relativePath = "image" + File.separator + "Carousel";
            String fullPath = realPath + File.separator + relativePath;
            String source = "D:\\ltw\\DoAn\\DoanLTWNhom60\\src\\main\\webapp\\image\\Carousel";
            File fileSource = new File(source);
            File[] files = fileSource.listFiles();
            ArrayList<String> imgList = new ArrayList<>();
            for (File f: files) {
                imgList.add(f.getName());
            }
            String[] imgs = request.getParameterValues("imageAvai");
            if(imgs != null) {
                for (int i = 0; i < imgs.length; i++) {
                    imgs[i] = imgs[i].substring(15);
                }
            }
            List<String> urlList = new ArrayList<>();
            for (String url: imgList) {
                urlList.add(url);
            }
            // Xác định và xóa các phần tử lặp lại
            List<String> elementsToRemove = new ArrayList<>();
            if (imgs != null) {
                elementsToRemove.addAll(Arrays.asList(imgs));
            }
            urlList.removeAll(elementsToRemove);
            for(String url: urlList) {
                File f = new File(source + File.separator + url);
                f.delete();
            }
            String res = "Chỉnh sửa thành công!";;
            for (Part part : request.getParts()) {
                if (isFilePart(part)) {
                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    try {
                        if (fileName != null && !fileName.isEmpty()) {
                            part.write(fullPath + File.separator + fileName);
                            part.write(source + File.separator + fileName);
                        }
                    }catch (Exception e) {
                        res = "Đã xảy ra lỗi!";
                    }
                }
            }
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("res", res);
            PrintWriter out = response.getWriter();
            out.println(jsonResponse.toString());
        }
        private boolean isFilePart(Part part) {
            return part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty();
        }
        }

