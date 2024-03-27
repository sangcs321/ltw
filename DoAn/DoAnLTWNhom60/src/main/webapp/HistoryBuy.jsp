<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Invoice" %>
<%@ page import="model.InvoiceDetail" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lịch sử mua hàng</title>
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
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Manage.css">
</head>
<body>
<!--header-->
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<!--end header-->
<% NumberFormat nF = NumberFormat.getCurrencyInstance();
%>
<div class="container bgcolor mgt">
    <div class="row mt-2">
        <div class="col-lg-4">
            <h5 >Lịch sử mua hàng <i class="fa fa-clock-o" aria-hidden="true"></i></h5>
            <div class="d-flex" id="status">
                <button class="btn" id ="wait" type="button">Chờ xác nhận</button>
                <button class="btn" id ="confirm" type="button">Đã xác nhận</button>
                <button class="btn" id ="cancle"type="button">Đã hủy</button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 overflow-hidden">
            <table class="mb-3" id = "wattingConfirm">
                <thead>
                <tr>
                    <td class="w40">STT</td>
                    <td>MÃ HÓA ĐƠN</td>
                    <td>NGÀY MUA</td>
                    <td>TỔNG TIỀN</td>
                </tr>
                </thead>
                <tbody id="innerInvoice">
                <%
                    ArrayList<Invoice> listInvoiceWaitting = (ArrayList<Invoice>) request.getAttribute("listInvoiceWaitting");
                    if (!listInvoiceWaitting.isEmpty() && listInvoiceWaitting != null)
                    {
                        int stt = 1;
                        for (Invoice i : listInvoiceWaitting) {
                %>
                <tr data-bs-toggle="modal" data-bs-target="#detailInvoice" onclick="detailInvoice(<%=i.getIdInvoice()%>)">
                    <td class="w40">
                        <%=stt%>
                    </td>
                    <td>
                       <%=i.getIdInvoice()%>
                    </td>
                    <td>
                       <%=i.getStartDate()%>
                    </td>
                    <td>
                        <%=nF.format(i.totalPrice())%>
                    </td>
                    <td>
                        <div class="d-flex w-100 justify-content-center">
                            <button class="btnAdd bgcolor bd-full"  data-bs-toggle="modal" data-bs-target="#" onclick="cancelInvoice(<%=i.getIdInvoice()%>)"><i class="fa fa-times text-color"  title="Huỷ đơn hàng" aria-hidden="true"></i></button>
                        </div>
                    </td>
                </tr>
                <%
                            stt++;
                        }
                    }
                %>
                </tbody>
            </table>
            <table class="mb-3 d-none" id = "confirmed">
                <thead>
                <tr>
                    <td class="w40">STT</td>
                    <td>MÃ HÓA ĐƠN</td>
                    <td>NGÀY MUA</td>
                    <td>TỔNG TIỀN</td>
                </tr>
                </thead>
                <tbody id="innerInvoiceConfirm">
                <%
                    ArrayList<Invoice> listInvoiceConfirmed = (ArrayList<Invoice>) request.getAttribute("listInvoiceConfirmed");
                    if (!listInvoiceConfirmed.isEmpty() && listInvoiceConfirmed != null)
                    {
                        int stt = 1;
                        for (Invoice i : listInvoiceConfirmed) {
                %>
                <tr data-bs-toggle="modal" data-bs-target="#detailInvoice" onclick="detailInvoice(<%=i.getIdInvoice()%>)">
                    <td class="w40">
                        <%=stt%>
                    </td>
                    <td>
                        <%=i.getIdInvoice()%>
                    </td>
                    <td>
                        <%=i.getStartDate()%>
                    </td>
                    <td>
                        <%=nF.format(i.totalPrice())%>
                    </td>
                    <td>
                        <div class="d-flex w-100 justify-content-center">
                            <button class="delete btnAdd bgcolor bd-full" data-bs-toggle="modal" data-bs-target="#" onclick="delInvoice('<%=i.getIdInvoice()%>', 'confirm')"><i class="fa fa-trash-o text-color" title="Xóa" aria-hidden="true"></i></button>
                        </div>
                    </td>
                </tr>
                <%
                            stt++;
                        }
                    }
                %>
                </tbody>
            </table>
            <table class="mb-3 d-none" id = "canceled">
                <thead>
                <tr>
                    <td class="w40">STT</td>
                    <td>MÃ HÓA ĐƠN</td>
                    <td>NGÀY MUA</td>
                    <td>TỔNG TIỀN</td>
                </tr>
                </thead>
                <tbody id="innerInvoiceCancel">
                <%
                    ArrayList<Invoice> listInvoiceCanceled = (ArrayList<Invoice>) request.getAttribute("listInvoiceCanceled");
                    if (!listInvoiceCanceled.isEmpty() && listInvoiceCanceled != null)
                    {
                        int stt = 1;
                        for (Invoice i : listInvoiceCanceled) {
                %>
                <tr data-bs-toggle="modal" data-bs-target="#detailInvoice" onclick="detailInvoice(<%=i.getIdInvoice()%>)">
                    <td class="w40">
                        <%=stt%>
                    </td>
                    <td>
                        <%=i.getIdInvoice()%>
                    </td>
                    <td>
                        <%=i.getStartDate()%>
                    </td>
                    <td>
                        <%=nF.format(i.totalPrice())%>
                    </td>
                    <td>
                        <div class="d-flex w-100 justify-content-center">
                            <button class="delete btnAdd bgcolor bd-full" data-bs-toggle="modal" data-bs-target="#" onclick="delInvoiceCancel('<%=i.getIdInvoice()%>', 'cancel')"><i class="fa fa-trash-o text-color" title="Xóa" aria-hidden="true"></i></button>
                        </div>
                    </td>
                </tr>
                <%
                            stt++;
                        }
                    }
                %>
                </tbody>
            </table>
            <div class="modal fade" id="detailInvoice" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content ">
                        <div class="modal-body">
                            <div class="container">
                                <div class="row ">
                                    <div class=" text-end">
                                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <h5 class="pb-2 text-center title">CHI TIẾT HOÁ ĐƠN</h5>
                                    <hr>
                                    <div class="col-md-12">
                                        <p class="fw-bold">Tên khách hàng: <span id="nameCus"></span></p>
                                        <p class="fw-bold">Số điện thoại: <span id="phoneCus"></span> </p>
                                        <p class="fw-bold">Email: <span id="emailCus"></span></p>
                                        <p class="fw-bold">Địa chỉ: <span id="addressCus"></span> </p>
                                        <p class="fw-bold">Mã hóa đơn: <span id="idInvoice"></span> </p>
                                        <p class="fw-bold">Phí vận chuyển: ₫<span id="transFee">0</span> </p>
                                        <p class="fw-bold">Phương thức thanh toán: <span id="payMethod">Thanh toán khi nhận hàng</span> </p>
                                        <div class="col-lg-12 overflow-auto">
                                            <table >
                                                <thead>
                                                <tr>
                                                    <td class="w40">STT</td>
                                                    <td>MÃ SẢN PHẨM</td>
                                                    <td class="w300">TÊN SẢN PHẨM</td>
                                                    <td class="w110">MÀU SẮC</td>
                                                    <td class="w110">SỐ LƯỢNG</td>
                                                    <td class="w110">ĐƠN GIÁ</td>
                                                    <td>THÀNH TIỀN</td>
                                                </tr>
                                                </thead>
                                                <tbody id ="innerDetailInvoice">
                                                <tr>
                                                    <td class="w40">1</td>
                                                    <td>1</td>
                                                    <td class="w300">
                                                        <div class="item d-flex justify-content-center">
                                                            <div class="item_img">
                                                                <img src="" class="card-img-top img_p_cart" alt="..."/>
                                                            </div>
                                                            <span class="item_text"></span>
                                                        </div>
                                                    </td>
                                                    <td class="w110">Xanh</td>
                                                    <td class="w110">1</td>
                                                    <td class="w110"></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold">TỔNG TIỀN</td>
                                                    <td class="fw-bold" colspan="6"></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
<script>
    $(document).ready(function () {
        function setBgFirt() {
            $('#status button').each(function () {
                if($(this).text() === "Chờ xác nhận" ) {
                    $(this).css('color','#f68e2e');
                    $(this).css('border-bottom','1px solid #f68e2e');
                }
            })
        }
        setBgFirt();
        //chọn bảng trạng thái đơn hàng
        $('#status button').click(function () {
            var selectedType = $(this).text();
            $('#status button').css('color','');
            $('#status button').css('border-bottom','');
            $(this).css('color','#f68e2e');
            $(this).css('border-bottom','1px solid #f68e2e');
            if(selectedType === "Chờ xác nhận") {
                $('#wattingConfirm').removeClass('d-none');
                    $('#confirmed').addClass('d-none');
                $('#canceled').addClass('d-none');
            }else if(selectedType === "Đã xác nhận") {
                $('#confirmed').removeClass('d-none');
                $('#wattingConfirm').addClass('d-none');
                $('#canceled').addClass('d-none');
            }else if(selectedType === "Đã hủy") {
                $('#canceled').removeClass('d-none');
                $('#wattingConfirm').addClass('d-none');
                $('#confirmed').addClass('d-none');
            }
        })
    })
    function detailInvoice(idInvoice) {
        $.ajax({
            type: "GET",
            url: "loadDetailInvoice",
            data: {
                id: idInvoice,
            },
            success: function (data) {
                // Cập nhật nội dung modal với dữ liệu JSON nhận được
                var htmlData = data.htmlData;
                var i = data.invoice;
                var total = data.total;
                $('#nameCus').text(i.name);
                $('#phoneCus').text(i.phoneNumber);
                $('#emailCus').text(i.email);
                $('#addressCus').text(i.address);
                $('#idInvoice').text(i.idInvoice);
                $('#transFee').text(i.transFee);
                $('#payMethod').text(i.payMethod);
                var row = document.getElementById("innerDetailInvoice");
                row.innerHTML ="";
                for (var i = 0; i < htmlData.length; i++) {
                    var p = htmlData[i];
                    row.innerHTML += "<tr onclick=\"buyBack("+p.idProduct+ "," +p.idCate + ")\">\n" +
                        "    <td class=\"w40\">" + (i+1) + "</td>\n" +
                        "    <td>" + p.idProduct + "</td>\n" +
                        "    <td class=\"w300\">\n" +
                        "        <div class=\"item d-flex justify-content-center\">\n" +
                        "            <div class=\"item_img\">\n" +
                        "                <img src=\"" + p.image + "\" class=\"card-img-top img_p_cart\" alt=\"...\"/>\n" +
                        "            </div>\n" +
                        "            <span class=\"item_text\">" + p.nameProduct + "</span>\n" +
                        "        </div>\n" +
                        "    </td>\n" +
                        "    <td class=\"w110\">" + p.color + "</td>\n" +
                        "    <td class=\"w110\">" + p.quantity + "</td>\n" +
                        "    <td class=\"w110\">" + p.price + "</td>\n" +
                        "    <td>" + p.totalPrice + "</td>\n" +
                        "</tr>\n";
                }
                row.innerHTML += "<tr>" +
                    "<td class=\"fw-bold\">TỔNG TIỀN</td>"+
                    "<td class=\"fw-bold\" colspan=\"6\">"+total+"</td>"+
                    "</tr>";
            },
            error: function () {
                console.error("Không thể tải chi tiết tài khoản");
            }
        });
    }
    function buyBack(idProduct, idCate) {
        var redirectUrl = 'detail-product?pid=' + idProduct +'&cid=' +idCate;
        window.location.href = redirectUrl;
    }
    function cancelInvoice(id) {
        var confirmation = confirm("Bạn có chắc muốn hủy đơn hàng này ?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "cancelInvoiceCus",
                data: {id: id},
                success: function (data) {
                    var jsonData = JSON.parse(data);
                    var htmlData = jsonData.htmlData;
                    var res = jsonData.res;
                    alert(res);
                    var row = document.getElementById("innerInvoice");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var ivc = htmlData[i];
                        row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailInvoice\" onclick=\"detailInvoice(" + ivc.id + ")\">\n" +
                            "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                            "                                    <td>" + ivc.id + "</td>\n" +
                            "                                    <td>" + ivc.startDate + "</td>\n" +
                            "                                    <td>" + ivc.totalPrice + "</td>\n" +
                            "                                    <td>\n" +
                            "                                        <button class=\"delete btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"cancelInvoice(" + ivc.id + ")\"><i class=\"fa fa-times text-color\"  title=\"Hủy đơn hàng\" aria-hidden=\"true\"></i></button>\n" +
                            "                                    </td>\n" +
                            "                                </tr>";
                    }
                },
                error: function (error) {
                    console.error("Xảy ra lỗi:", error);
                }
            });
        }
    }
        function delInvoice(id, status) {
            var confirmation = confirm("Bạn có chắc muốn xóa đơn hàng này ?");
            if (confirmation) {
                $.ajax({
                    type: "POST",
                    url: "delInvoiceCus",
                    data: {id: id, status: status},
                    success: function (data) {
                        var jsonData = JSON.parse(data);
                        var htmlData = jsonData.htmlData;
                        var res = jsonData.res;
                        alert(res);
                        var row = document.getElementById("innerInvoiceConfirm");
                        row.innerHTML = ""; // Clear existing content
                        for (var i = 0; i < htmlData.length; i++) {
                            var ivc = htmlData[i];
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailInvoice\" onclick=\"detailInvoice(" + ivc.id + ")\">\n" +
                                "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                                "                                    <td>" + ivc.id + "</td>\n" +
                                "                                    <td>" + ivc.startDate + "</td>\n" +
                                "                                    <td>" + ivc.totalPrice + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"delInvoice(" + ivc.id + ")\"><i class=\"fa fa-times text-color\"  title=\"Hủy đơn hàng\" aria-hidden=\"true\"></i></button>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                        }
                    },
                    error: function (error) {
                        console.error("Xảy ra lỗi:", error);
                    }
                });
            }
        }
        function delInvoiceCancel(id,status) {
            var confirmation = confirm("Bạn có chắc muốn xóa đơn hàng này ?");
            if (confirmation) {
                $.ajax({
                    type: "POST",
                    url: "delInvoiceCus",
                    data: {id: id, status: status},
                    success: function (data) {
                        var jsonData = JSON.parse(data);
                        var htmlData = jsonData.htmlData;
                        var res = jsonData.res;
                        alert(res);
                        var row = document.getElementById("innerInvoiceCancel");
                        row.innerHTML = ""; // Clear existing content
                        for (var i = 0; i < htmlData.length; i++) {
                            var ivc = htmlData[i];
                            row.innerHTML += "<tr data-bs-toggle=\"modal\" data-bs-target=\"#detailInvoice\" onclick=\"detailInvoice(" + ivc.id + ")\">\n" +
                                "                                    <td class=\"w40\">" + (i + 1) + "</td>\n" +
                                "                                    <td>" + ivc.id + "</td>\n" +
                                "                                    <td>" + ivc.startDate + "</td>\n" +
                                "                                    <td>" + ivc.totalPrice + "</td>\n" +
                                "                                    <td>\n" +
                                "                                        <button class=\"btnAdd bgcolor bd-full\"  data-bs-toggle=\"modal\" data-bs-target=\"#\" onclick=\"delInvoice(" + ivc.id + ")\"><i class=\"fa fa-times text-color\"  title=\"Hủy đơn hàng\" aria-hidden=\"true\"></i></button>\n" +
                                "                                    </td>\n" +
                                "                                </tr>";
                        }
                    },
                    error: function (error) {
                        console.error("Xảy ra lỗi:", error);
                    }
                });
            }
        }
</script>
</body>
</html>