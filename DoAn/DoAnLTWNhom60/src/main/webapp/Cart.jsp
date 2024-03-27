<%@ page import="java.util.Iterator" %>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
</head>
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
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<!--header-->
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<!--end header-->
<div class="container mgt">
    <a href="<%=url%>/homePage" class="color-gray lbhv text-decoration-none">Trang chủ  <i class="fa fa-angle-right color-gray" aria-hidden="true"></i>  </a> <span class="text-color">Giỏ hàng</span>
    <% Cart cart = (Cart) session.getAttribute("Cart");
        if (cart != null && !cart.list().isEmpty()) {%>
    <div class="row bgcolor mt-3">
        <div class="col-lg-12">
            <table class="mt-4">
                <thead>
                <%
                    String errQuantity = (String) request.getAttribute("errQuantity");
                    errQuantity = (errQuantity == null) ? "" : errQuantity;
                %>
                <p class="mb-0 mt-4 text-danger text-center"><%=errQuantity%></p>
                <tr>
                    <td class="w40">STT</td>
                    <td class="w300">SẢN PHẨM</td>
                    <td>MÀU SẮC</td>
                    <td>VẬT LIỆU</td>
                    <td>KÍCH THƯỚC</td>
                    <td>ĐƠN GIÁ</td>
                    <td>SỐ LƯỢNG</td>
                    <td COLSPAN="2">THAO TÁC</td>
                </tr>
                </thead>
                <tbody>
                <%
                    NumberFormat nF = NumberFormat.getCurrencyInstance();
                    Iterator< Product> it = cart.list().iterator();
                    int stt = 1;
                    Product p;
                    while(it.hasNext()) {
                        p = it.next();
                %>
                <tr>
                    <td class="w40"><%=stt%></td>
                    <td class="w300">
                        <div class="item d-flex justify-content-center">
                            <div class="item_img">
                                <img src="<%=url%>/Products/<%=(p.getImages().isEmpty())?"":p.getImages().get(0).getUrl()%>" class="card-img-top img_p_cart" alt="..."/>
                            </div>
                            <span class="item_text"><%=p.getName()%></span>
                        </div>
                    </td>
                    <td >
                        <%=p.getColor()%>
                    </td>
                    <td >
                        <%=p.getMaterial()%>
                    </td>
                    <td >
                        <%=p.formatSize(p.getLength())%>x<%=p.formatSize(p.getWidth())%>x<%=p.formatSize(p.getHeight())%>
                    </td>
                    <td >
                        <%=nF.format(p.getPrice())%>
                    </td>
                    <td ><%=p.getQuantity()%></td>
                    <td >
                        <form action="updateQuantity" method="post"  onsubmit="return checkQuantity()" >
                            <input type="text" class="quantity" id = "quantity"  name="quantity" value = "<%=p.getQuantity()%>"/>
                            <input type="hidden" name="id" value="<%=p.getIdProduct()%>"/>
                            <button class="update" type="submit" title="Cập nhật số lượng">Cập Nhật</button>
                        </form>
                    </td>
                    <td>
                        <form action="delProductInCart" method="post" onsubmit="return getConfirmation()">
                            <input type="hidden" name="id" value="<%=p.getIdProduct()%>"/>
                            <button class="delete" title="Xóa sản phẩm" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#delProduct"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                        </form>
                    </td>
                </tr>
                <%
                        stt++;
                    }
                %>
                </tbody>
            </table>
            <div class="totalPay mt-4 text-end">
                <span id="tt">THÀNH TIỀN: </span>  <%=nF.format(cart.total())%>
            </div>
            <div class="pay my-2">
                <a href="<%=url%>/Payment.jsp">
                    <button id="btnPay">Thanh toán</button>
                </a>
            </div>
        </div>
    </div>
    <%} else {%>
    <div class="text-center mt-4 mb-3 fs-2 color-gray ">Giỏ hàng gì mà trống vậy nè >.<<a href="<%=url%>/product" class="text-color text-decoration-none fs-5"> Lấp đầy ở đây nè ^.^</a></div>
    <div class="text-center mb-4">
        <img src="image/cart-empty.png" alt="" class="imgbg">
    </div>

    <%}%>
</div>

<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
</body>
<script>
    $(document).ready(function () {
        function calculateTotal() {
            var totalMoney = 0;
            var money = 0;
            var amount = 0;
            $('tr').each(function () {
                var moneyText = $(this).find('td:eq(5)').text();
                var amountText = $(this).find('.amount').val();
                moneyText = moneyText.replace(/\./g, "");
                var money = parseFloat(moneyText);
                var amount = parseFloat(amountText);
                if (!isNaN(money) && !isNaN(amount)) {
                    totalMoney += money * amount;
                }
            });
            totalMoney = totalMoney.toLocaleString('en-US');
            totalMoney = totalMoney.replace(/\,/g, ".")
            $('#total').text(totalMoney);
        }
        // Gọi hàm tính tổng tiền khi tải trang
        calculateTotal()
    });
    function checkQuantity() {
        var numericCharacters = /^\d+$/;
        if($('#quantity').val() < 0 || !$('#quantity').val().match(numericCharacters)) {
            $('#quantity').css('border', '1px solid red')
                return false;
        }
        return true;
    }
    function getConfirmation(){
        var retVal = confirm("Bạn có chắc muốn xóa ?");
        if( retVal == true ){
            return true;
        }
        return false;
    }
</script>
</html>