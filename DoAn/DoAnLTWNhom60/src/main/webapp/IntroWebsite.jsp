<%@ page import="service.WebService" %>
<%@ page import="model.InforWebsite" %>
<%@ page import="model.Account" %>
<%@ page import="model.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giới thiệu về HomeDecor</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/IntroWeb.css">
    <link rel="stylesheet" href="css/Style.css">
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<!--header-->
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<!--end header-->
<!--page content-->
<%
    InforWebsite i = (InforWebsite) request.getAttribute("infor");
    Cart cart = (Cart) session.getAttribute("Cart");
    Account account = (Account) session.getAttribute("account");
%>
<div class="container mgt">
    <%String res = (String) request.getAttribute("res");%>
    <span id ="res"><%=(res == null)?"":res%></span>
    <a href="<%=url%>/homePage" class="color-gray lbhv text-decoration-none">Trang chủ  <i class="fa fa-angle-right color-gray" aria-hidden="true"></i>  </a> <span class="text-color">Giới thiệu</span>
    <div class="mt-3" id="para">
        <div id="Part2">
            <h5> GIỚI THIỆU </h5>
            <p> HomeDecor là trang thương mại chuyên cung cấp các sản phẩm nội thất chủ yếu là ghế, phục vụ nhu cầu của
                mọi
                khách hàng. Chúng tôi tin rằng hạnh phúc của mỗi gia đình đều được vun đắp từ nhà, không gian sống tạo
                dựng giá trị cuộc sống. Sẽ luôn có HomeDecor luôn sát cánh, đồng hành cùng bạn trên mọi chặn đường. Với
                con đường mà HomeDecor đã chọn, chúng tôi mong muốn được cùng xây dựng tổ ấm với triệu gia đình Việt.
                Hãy cùng chúng tôi trải nghiệm một cuộc phiêu lưu thú vị vào thế giới nội thất ghế thông qua trang web
                của chúng tôi.Chúng tôi tự hào giới thiệu đến bạn một địa điểm trực tuyến tuyệt vời để khám phá và mua
                sắm những chiếc ghế đẹp và đa dạng</p>
            <p class="m-0"> Website của chúng tôi là điểm đến hoàn hảo cho những ai yêu thích sự thoải mái và phong cách
                trong không gian sống của mình. Với sự đa dạng về kiểu dáng, chất liệu và màu sắc, chúng tôi cam kết
                mang đến cho bạn sự lựa chọn đa dạng để biến những ý tưởng thiết kế của bạn thành hiện thực.</p> <br>
            <p class="anhPhoto"><img
                    src="https://sofakimphu.com/wp-content/uploads/2023/02/z4140108879592_87731ad5e8cec919995831c1002d820a.jpg">
            </p>
            <p> Tại trang web của chúng tôi, bạn sẽ khám phá:</p>
            <p><strong>Sản phẩm đa dạng:</strong> Chúng tôi cung cấp chủ yếu bốn loại ghế, từ ghế văn phòng như dành cho
                giám đốc đến ghế gaming dành cho những thanh niên trẻ đam mê nhiệt huyết. Bất kể bạn đang tìm một chiếc
                ghế để thư giãn thì chúng tôi cũng có ghế thư giãn dành cho bạn lựa chọn, bên cạnh đó những chiếc ghế
                trang trí giúp bạn có thể trang trí phòng ngủ, phòng khách với rất nhiều công dụng khác. </p>
            <p><strong>Thiết kế độc đáo:</strong> Chúng tôi hiểu rằng mỗi người có cá tính và phong cách riêng, vì vậy
                chúng tôi mang đến những thiết kế độc đáo và sáng tạo để phù hợp với mọi sở thích.</p>
            <p><strong>Chất lượng đỉnh cao:</strong> Chất lượng là ưu tiên hàng đầu của chúng tôi. Tất cả các sản phẩm
                được chọn lọc cẩn thận và sản xuất từ các vật liệu chất lượng cao để đảm bảo sự bền bỉ và thoải mái.</p>
            <p><strong>Dịch vụ khách hàng xuất sắc:</strong> Chúng tôi luôn lắng nghe và sẵn sàng hỗ trợ bạn trong quá
                trình mua sắm. Chúng tôi cam kết mang đến trải nghiệm mua sắm trực tuyến thuận tiện và hài lòng.</p>
            <p class="mb-0"><strong>Giao hàng tận nơi:</strong> Chúng tôi sẽ giao sản phẩm trực tiếp đến cửa nhà của
                bạn, tiết kiệm thời gian và công sức.</p><br>
        </div>
    </div>
    <div id="policy">
        <h5> CHÍNH SÁCH MUA HÀNG
            <%if(account.getRole() == 0) {%>
            <button class="editPolicy btnAdd bgcolor bd-full me-1"><i class="fa fa-pencil text-color" data-bs-toggle="modal" data-bs-target="#editPolicy"></i></button>
            <%}%>
        </h5>
        <p><strong>Bảo hành:</strong> <span id="contentGuarantee"><%=i.getGuarantee()%></span> tháng kể từ ngày mua hàng.</p>
        <p><strong>Đổi trả:</strong> trong vòng <span id="exchangeProduct"><%=i.getExchange() %></span> tháng kể từ ngày mua hàng, với điều
            kiện là hàng hóa bị lỗi khi vận chuyển hoặc do nhà sản xuất, chúng tôi sẽ không chịu trách nhiệm đổi trả
            hàng hóa nếu lỗi là do phía khách hàng.</p>
    </div>
    <!--edit policy-->
    <div class="modal fade" id="editPolicy" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm ">
            <div class="modal-content">
                <div class="modal-body">
                    <form class="form " action="editPolicy" method="post" onsubmit="return editGua()">
                        <input type="hidden" name="id" value="<%= i.getId() %>">
                        <div class="row px-2">
                            <div class=" text-end">
                                <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close" data-bs-target="#editPolicy"></button>
                            </div>
                            <h5 class="text-center">CHỈNH SỬA CHÍNH SÁCH</h5>
                            <hr>
                            <div class="col-md-12 m-auto">
                                <div class="mb-3 ">
                                    <label class="form-label pe-3" for="monthGua">Bảo hành</label>
                                    <input type="number" class="month" id="monthGua" name="monthGua" value="<%= i.getGuarantee() %>"> tháng
                                </div>
                                <div class="mb-3 ">
                                    <label class="form-label pe-3" for="monthChange">Đổi trả</label>
                                    <input type="number" class="month" id="monthChange" name="monthChange" value="<%= i.getExchange() %>"> tháng
                                </div>
                            </div>
                            <div class="row p-0">
                                <div class="col-md-12 p-0">
                                    <div class="text-end">
                                        <button class="save" type="submit">LƯU</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--end edit policy-->
    <div id="contact">
        <h5> THÔNG TIN LIÊN HỆ
            <%if(account.getRole() == 0) {%>
            <button class="editContact btnAdd bgcolor bd-full me-1"><i class="fa fa-pencil text-color" title="Chỉnh sửa thông tin liên hệ" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#editContact"></i></button>
            <%}%>
        </h5>
        <p><strong>Địa chỉ:</strong> <span id="address"><%=i.getAddress()%></span>.
        </p>
        <p><strong>Email:</strong> <span id="email"><%=i.getEmail()%></span></p>
        <p><strong>Số điện thoại:</strong> <span id="phoneNumber"><%=i.getPhoneNumber()%></span></p>
    </div>
    <!--edit contact-->
    <div class="modal fade" id="editContact" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-body">
                    <form class="form " action="editContact" method="post" onsubmit="return editContact()">
                        <input type="hidden" name="id" value="<%= i.getId()%>">
                        <div class="row px-2">
                            <span class="d-none" id="id"></span>
                            <div class=" text-end">
                                <button type="button" class="btn-close " data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <h5 class="text-center">CHỈNH SỬA THÔNG TIN LIÊN HỆ</h5>
                            <hr>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Địa chỉ</label><span class="text-danger" id="errEditAddress"></span>
                                    <input type="text" class="form-control" id="editAddress" name="editAddress" value="<%=i.getAddress()%>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email</label><span class="text-danger" id="errEditEmail"></span>
                                    <input type="text" class="form-control" id="editEmail" name="editEmail" value="<%=i.getEmail()%>" >
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Số điện thoại</label><span class="text-danger" id="errEditPhoneNumber"></span>
                                    <input type="text" class="form-control" id="editPhoneNumber" name="editPhoneNumber" value="<%=i.getPhoneNumber()%>" >
                                </div>
                            </div>
                            <div class="row p-0">
                                <div class="col-md-12 p-0">
                                    <div class="text-end">
                                        <button class="save" type="submit">LƯU</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--    end edit contact-->
</div>
<!--end page content-->
<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
<script>
    $(document).ready(function () {
        if($('#res').text() !== "") {
            alert($('#res').text());
        }
    })
    function  editGua() {
        var monthGua = document.getElementById("monthGua");
        var monthChange = document.getElementById("monthChange");

        var flag = true;

        if(monthGua.value === "") {
            flag = false;
            monthGua.style.borderColor = 'red';
        }else {
            monthGua.style.borderColor = '#dee2e6';
        }
        if(monthChange.value === "") {
            flag = false;
            monthChange.style.borderColor = 'red';
        }else {
            monthChange.style.borderColor = '#dee2e6';
        }
        if(monthGua.value <0){
            flag = false;
            monthGua.style.borderColor = 'red';
        }else{
            monthGua.style.borderColor = '#dee2e6';
        }
        if(monthChange.value < 0 ){
            flag = false;
            monthChange.style.borderColor = 'red';
        }else{
            monthChange.style.borderColor = '#dee2e6';
        }
        return flag;
    }
    function editContact() {

        var address = document.getElementById("editAddress");
        var email = document.getElementById("editEmail");
        var phone =document.getElementById("editPhoneNumber");

        var errorAddress = document.getElementById("errEditAddress");
        var errEditEmail = document.getElementById("errEditEmail");
        var errEditPhoneNumber = document.getElementById("errEditPhoneNumber");

        var flag = true;
        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var tellReg = /^\d{10}$/;

        if(address.value === "") {
            errorAddress.innerHTML ='*Vui lòng nhập địa chỉ!'
            flag = false;
        }else {
            errorAddress.innerHTML ='';
        }
        if(email.value === "") {
            errEditEmail.innerHTML ='*Vui lòng nhập email!'
            flag = false;
        }else if(!email.value.match(emailReg)){
            errEditEmail.innerHTML ='*Email không hợp lệ!';
            flag = false;
        }else{
            errEditEmail.innerHTML = '';
        }
        if(phone.value === "") {
            errEditPhoneNumber.innerHTML ='*Vui lòng nhập số điện thoại!'
            flag = false;
        }else if(!phone.value.match(tellReg)){
            errEditPhoneNumber.innerHTML ='*Số điện thoại không hợp lệ!';
            flag = false;
        }else{
            errEditPhoneNumber.innerHTML = '';
        }
        return flag;
    }
</script>
</body>

</html>