<%@ page import="model.Account" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán</title>
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
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Cart.css">
    <link rel="stylesheet" href="css/ChangeInfor.css">
    <link rel="stylesheet" href="css/Payment.css">
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
    Account a =(Account) session.getAttribute("account");
    if (a == null) {
%>
<div class="container p-0 mgt text-center fw-bold">Bạn chưa đăng nhập! <a href = <%=url%>/SignIn.jsp>Đăng nhập</a></div>
<%
        return;
    }
%>
<%
    Product p =(Product) session.getAttribute("BuyNowProduct");
    Integer quantity =(Integer) session.getAttribute("BuyNowQuantity");
    NumberFormat nF = NumberFormat.getCurrencyInstance();
    double sumPay = 0;
    if (!a.getVerifyAccount().isStateVerify()) {
%>
<div class="container p-0 mgt text-center fw-bold">Bạn chưa xác thực tài khoản <a href = <%=url%>/reVerifyCode>Xác thực ngay</a></div>
<%
}else if (a != null && p!=null) {
    sumPay+=p.getPrice()*quantity;
    session.setAttribute("Sum",sumPay);
    double shippingFee=0;
%>
<div class="container p-0 mgt">
    <a href="<%=url%>/homePage" class="color-gray lbhv text-decoration-none">Trang chủ  <i class="fa fa-angle-right color-gray" aria-hidden="true"></i>  </a> <span class="text-color">Thanh toán</span>
    <div class="row p-2 mt-3 bgcolor">
        <div class="col-lg-4 col-sm-4 my-1">
            <h5 class="text-color text-start"><i class="fa fa-user-circle-o text-color" aria-hidden="true"></i> THÔNG TIN KHÁCH HÀNG</h5>
            <div class="mt-3">
                <label for="fullName">Họ tên: <span id="fullName"><%=a.getName()%></span></label>
            </div>
            <div class="mt-2">
                <label for="phoneNumber">Số điện thoại: <span id="phoneNumber"><%=a.getPhoneNumber()%></span></label>
            </div>
            <div class="mt-2">
                <label for="email">Email:</label> <span id="email"><%=a.getEmail()%></span>
            </div>
        </div>
        <div class="col-lg-6 col-sm-6 mt-1 ">
            <h5 class="text-color text-start"> <i class="fa fa-map-marker text-color" aria-hidden="true"></i> ĐỊA CHỈ NHẬN HÀNG</h5>
            <span class="mt-3 d-block" id="address"><%=a.getAddressReceive()%></span>
        </div>
        <div class="col-lg-2 col-sm-2 mt-1 text-end">
            <button class="btnAdd bgcolor bd-full" id ="editInFor" data-bs-toggle="modal" data-bs-target="#changeInfor"><i class="fa fa-pencil text-color " title="Chỉnh sửa thông tin liên hệ" aria-hidden="true"></i></button>
        </div>
        <div class="modal fade" id="changeInfor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content ">
                    <div class="modal-body">
                        <form id="changeNam" onsubmit="return check()" method="post" action="ChangeInforInPayment">
                            <%
                                String res = (String) request.getAttribute("res");
                                res =(res == null)?"":res;
                            %>
                            <table>
                                <thead>
                                <div class=" text-end">
                                    <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <tr>
                                    <td colspan ="4">
                                        <h5 class = "pt-3 pb-1"> THAY ĐỔI THÔNG TIN </h5>
                                        <div class="text-danger text-center w-100" id="error"><%=res%></div>
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        <%
                                            if (a.getVerifyAccount().isStateVerify()) {%>
                                        <label class="w-100">Tài khoản đã xác thực <i class="fa fa-check-circle text-success" aria-hidden="true"></i></label>
                                        <%} else {%>
                                        <label class="w-100 ">Tài khoản của bạn chưa xác thực, <a href="reVerifyCode">xác thực ngay</a></label>
                                        <%}%>
                                    </td>
                                </tr>
                                <tr id="changeName">
                                    <td >
                                        <label>Họ và tên</label>
                                    </td>
                                    <td class="w-50">
                                        <div id="InName">
                                            <input id="HienThiTen" name="TenHT" type="text" value="<%=a.getName()%>">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changeSDT">
                                    <td>
                                        <label> Số điện thoại </label>
                                    </td>
                                    <td>
                                        <div id="InSDT">
                                            <input id="HienThiSDT" name="SDTHT" type="text" value="<%=a.getPhoneNumber()%>">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changegGmail">
                                    <td>
                                        <label>Email</label>
                                    </td>
                                    <td>
                                        <div id="InGmail">
                                            <input id="HienThiGmail" name="GmailHT" type="text" value="<%=a.getEmail()%>">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Giới tính</label>
                                    </td>
                                    <td >
                                        <div class = "gender">
                                            <label class="ms-0" for="male">Nam</label><input class="ms-2 me-3" type="radio" id="male" name="gender" value="Nam" <%= a.getGender().equals("Nam") ? "checked" : "" %> >
                                            <label for="female">Nữ</label> <input class="ms-2 me-3" type="radio" id="female" name="gender" value="Nữ" <%= a.getGender().equals("Nữ") ? "checked" : "" %>>
                                            <label for="other">Khác</label> <input class="ms-2 me-3" type="radio" id="other" name="gender" value="Khác" <%= a.getGender().equals("Khác") ? "checked" : "" %>>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changeNgaySinh">
                                    <td>
                                        <label>Ngày sinh</label>
                                    </td>
                                    <td>
                                        <div id="InNS">
                                            <input id="HienThiNS" name="HienThiNS" type="date" value="<%=a.getBirthDay()%>">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changeDC">
                                    <td>
                                        <label> Địa chỉ</label>
                                    </td>
                                    <td>
                                        <div id="InDiaChi">
                                            <input id="HienThiDC" name="DCHT" type="text" value="<%=a.getAddress()%>">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="changeDCReceive">
                                    <td>
                                        <label> Địa chỉ nhận hàng</label>
                                    </td>
                                    <td>
                                        <div id="">
                                            <input id="HienThiDCReice" name="DCNHHT" type="text" value="<%=a.getAddressReceive()%>">
                                            <input hidden="hidden" name="buynow" value="buynow">
                                        </div>
                                    </td>
                                </tr>
                                <tr id="SubmitSB">
                                    <td colspan="2">
                                        <div><button id="submit" name="SB" onclick="" style="color: white"> LƯU </button></div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row bgcolor mt-3">
        <div class="col-md-12 d-flex justify-content-center">
            <table class="my-4 tb">
                <thead>
                <tr class="tr">
                    <td class="w40">STT</td>
                    <td class="w300">SẢN PHẨM</td>
                    <td>MÀU SẮC</td>
                    <td>VẬT LIỆU</td>
                    <td>KÍCH THƯỚC</td>
                    <td>ĐƠN GIÁ</td>
                    <td>SỐ LƯỢNG</td>
                    <td>THÀNH TIỀN</td>
                </tr>
                </thead>
                <tbody>
                <tr class="tr">
                    <td class="w40">1</td>
                    <td class="w300">
                        <div class="item d-flex justify-content-center">
                            <div class="item_img">
                                <img src="<%=url%>/Products/<%=(p.getImages().isEmpty())?"":p.getImages().get(0).getUrl()%>"
                                     class="card-img-top img_p_cart" alt="..."/>
                            </div>
                            <span class="item_text"><%=p.getName()%></span>
                        </div>
                    </td>
                    <td>
                        <%=p.getColor()%>
                    </td>
                    <td>
                        <%=p.getMaterial()%>
                    </td>
                    <td>
                        <%=p.formatSize(p.getLength())%>x<%=p.formatSize(p.getWidth())%>x<%=p.formatSize(p.getHeight())%>
                    </td>
                    <td>
                        <%=nF.format(p.getPrice())%>
                    </td>
                    <td>
                        <%=quantity%>
                    </td>
                    <td>
                        <%=nF.format(p.getPrice()*quantity)%>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row bgcolor mt-3 p-2">
        <div class="col-lg-12 mt-1">
            <h5>PHƯƠNG THỨC THANH TOÁN</h5>
        </div>
        <div class="col-lg-12 my-1">
            <div class="row">
                <div class="col-lg-8 col-sm-4 col-3"></div>
                <div class="col-lg-4 col-sm-8 col-9 mt-1 ps-5">
                    <div class=" mt-3">
                        <p class="mb-3 color-gray">Tổng tiền hàng:
                            <span class="float-end"><%=nF.format(sumPay)%></span>
                        </p>
                        <p class="mb-3 color-gray">Tiền vận chuyển:
                            <span class="float-end" id="moneyShip"><%=nF.format(shippingFee)%></span>
                        </p>
                        <p class="mb-3 color-gray">Tổng thanh toán:
                            <span class="float-end"><%=nF.format(sumPay+shippingFee)%></span>
                        </p>
                    </div>
                    <div class="pay text-end mt-2">
                        <a href="<%=url%>/BuyNow">
                            <button id="btnPay" >Đặt hàng</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
}else if((String)session.getAttribute("doneBuyNow")!=null){
%>
<div class="container p-0 mgt text-center fw-bold">Đơn hàng của bạn đã được đặt. Bạn có thể kiểm tra lại đơn hàng trên Email! <a href = <%=url%>/product>Mua hàng tiếp!</a></div>
<div class="text-center mb-4">
    <img src="image/comfirm.png" alt="" class="imgbg">
</div>
<%
    }
%>
<!--end page content-->
<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
<script>
    function updateTotalMoney() {
        $('tr').each(function () {
            var amountText = $(this).find('td:eq(6) span').text();
            var priceText = $(this).find('td:eq(5) span').text();
            priceText = priceText.replace(/\./g, "");
            var amount = parseInt(amountText);
            var price = parseInt(priceText);
            var total = amount * price;
            total = total.toLocaleString('en-US');
            total = total.replace(/\,/g, ".")
            $(this).find('td:eq(7) span').text(total);
        })
    }
    updateTotalMoney(); //gọi hàm tính thành tiền sau khi load web
    function totalMoneyPay() {
        var total = 0;
        $('tr').each(function () {
            var moneyText = $(this).find('td:eq(7) span').text();
            moneyText = moneyText.replace(/\./g, "");
            var money = parseInt(moneyText);
            if (!isNaN(money)) {
                total += money;
            }
        })
        total = total.toLocaleString('en-US');
        total = total.replace(/\,/g, ".")
        $('#totalMoney').text(total);
        $('#totalPay').text(total);
    }
    totalMoneyPay();
</script>
</body>
</html>