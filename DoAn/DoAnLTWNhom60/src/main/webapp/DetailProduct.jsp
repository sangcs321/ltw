<%@ page import="model.Product" %>
<%@ page import="model.Image" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.Category" %>
<%@ page import="model.Cart" %>
<%@ page import="controller.PaymentBuyNow" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết sản phẩm</title>
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
    <script src="slider/owlcarousel/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="slider/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="slider/owlcarousel//assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/DetailProduct.css">
</head>
<body>
<!--header-->
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<!--end header-->
<!--Chi tiết sản phẩm-->
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%
    NumberFormat nF = NumberFormat.getCurrencyInstance();
    Cart cart = (Cart) session.getAttribute("Cart");
    Product product = (Product) request.getAttribute("product");
    if (product != null) {
%>
<div class="container-fluid mgt">
    <div class="container">
        <a href="<%=url%>/homePage" class="color-gray lbhv text-decoration-none">Trang chủ  <i class="fa fa-angle-right color-gray" aria-hidden="true"></i> </a>
        <a href="<%=url%>/product"class="color-gray lbhv text-decoration-none">Sản phẩm  <i class="fa fa-angle-right color-gray" aria-hidden="true">  </i></a>
        <span class="text-color"><%=product.getName()%></span>
    </div>
    <div class="container bgcolor mt-3">
        <!--Thông tin sản phẩm-->
        <div class="d-md-none d-sm-block d-block pt-2 " >
            <span class="nameProduct" name ="nameProduct"><%=product.getName()%></span>
            <p class="t" name ="amount-sold">300 Đã bán</p>
            <p class="price" name ="price"><%=nF.format(product.getPrice())%></p>
        </div>
        <!--end thông tin sản phẩm-->
        <div class="row">
            <div class="col-md-12 col-lg-9">
                <div class="row">
                    <!--Hình sản phẩm-->
                    <div class="col-lg-5 col-md-7  ">
                        <div class="row pt-3">
                            <div class="col-md-12">
                                <img src="<%=url%>\Products\<%=(product.getImages().isEmpty())?"":product.getImages().get(0).getUrl()%>" class="card-img-top img_p" id = "img_center" alt="...">
                            </div>
                            <div class="col-md-12 mt-3">
                                <div class="owl-carousel">
                                    <%
                                        for(Image img: product.getImages()) { %>
                                    <div class="pe-2">
                                        <img src="<%=url%>/Products/<%=img.getUrl()%>" alt="" class="img_p_detail" onmouseover="changeImg('<%=url%>/Products/<%=img.getUrl()%>')">
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end hình sản phẩm-->
                    <!--Thông tin sản phẩm-->
                    <div class="col-lg-7 col-md-5">
                        <div class="row mt-3">
                            <div class="col-lg-12 d-md-block d-sm-none d-none">
                                <span class="nameProduct" name ="nameProduct"><%=product.getName()%></span>
                                <p class="m-0 mb-4" ><span class="t color-gray" name ="amount-sold">300</span> <span class="t color-gray"> Đã bán</span> </p>
                                <p class="price m-0 mb-4" name ="price"><%=nF.format(product.getPrice())%></p>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 ">
                                <p class = "color-gray m-0 mb-4 "><%=product.getQuantityAvailable()%> sản phẩm có sẵn</p>
                                <span class="color-gray">Vận chuyển <i class="fa fa-truck" aria-hidden="true"></i> <span id ="address">Thủ Đức</span> </span>
                                <div class="amount-product my-4">
                                    <div class="t">
                                        <p class="color-gray">Số lượng</p>
                                    </div>
                                    <div class="dai">
                                        <button id="decrease" type="button">-</button>
                                        <div class="amount">
                                            <input type="text" id="amount" name="quantity" value="1"/>
                                        </div>
                                        <button id="increase" type="button">+</button>
                                    </div>
                                </div>
                                <div class="row" >
                                    <div class ="col-lg-12 d-flex" >
                                        <div class=" add-cart">
                                            <%
                                                int quantity = 1;
                                                if (cart != null) {
                                                    if (cart.get(product.getIdProduct()) != null) {
                                                        quantity = cart.get(product.getIdProduct()).getQuantity() + 1;
                                                    }
                                                } else {
                                                    quantity = product.getQuantity();
                                                }
                                            %>
                                            <a href="<%=url%>/cartController?id=<%=product.getIdProduct()%>&quantity=<%=quantity%>">
                                                <button type="button">Thêm vào giỏ hàng <i class="fa fa-shopping-cart cart"></i></button>
                                            </a>

                                        </div>
                                        <div class="ms-3 pay">
                                            <a href ="<%=url%>/PaymentBuyNow?id=<%=product.getIdProduct()%>&quantity=1" id="buy-now-link">
                                                <button id="buynow">Mua ngay</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end thông tin sản phẩm-->
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-12">
                        <h5>MÔ TẢ SẢN PHẨM</h5>
                        <p class="mb-2">- <%=product.getDescription()%></p>
                    </div>
                </div>
                <div class="row mt-1">
                    <div class="col-md-12">
                        <h5>CHI TIẾT SẢN PHẨM</h5>
                        <p>- Chiều dài: <%=product.formatSize(product.getLength())%>cm</p>
                        <p>- Chiều rộng: <%=product.formatSize(product.getWidth())%>cm</p>
                        <p>- Chiều cao: <%=product.formatSize(product.getHeight())%>cm</p>
                        <p>- Vật liệu: <%=product.getMaterial()%></p>
                        <p>- Màu sắc: <%=product.getColor()%></p>
                    </div>
                </div>
            </div>
            <%
                Product productSimilar = (Product) request.getAttribute("productSimilar");
                if (productSimilar != null) {
            %>
            <div class="col-md-3 d-lg-block d-md-none d-sm-none d-none pt-3">
                <h5 class="m-0 text-center" id="titleCate">SẢN PHẨM TƯƠNG TỰ</h5>
                <hr class="mt-2 mb-2"/>
                <div class="card">
                    <a href="<%=url%>/detail-product?pid=<%=productSimilar.getIdProduct()%>&cid=<%=productSimilar.getIdCate()%>">
                        <img src="<%=url%>\Products\<%=(productSimilar.getImages().isEmpty())?"":productSimilar.getImages().get(0).getUrl()%>" class="card-img-top img_p" alt="...">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title"><%=productSimilar.getName()%></h5>
                        <p class="card-text">
                        <p class="price"><%=nF.format(productSimilar.getPrice())%></p>
                        <%
                            int qty = 1;
                            if (cart != null) {
                                if (cart.get(productSimilar.getIdProduct()) != null) {
                                    qty = cart.get(productSimilar.getIdProduct()).getQuantity() + 1;
                                }
                            } else {
                                qty = productSimilar.getQuantity();
                            }
                        %>
                        <a href="<%=url%>/cartController?id=<%=productSimilar.getIdProduct()%>&quantity=<%=qty%>"><i class="fa fa-shopping-cart cart" aria-hidden="true" title ="Thêm vào giỏ hàng"></i></a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>
<%}%>
<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
</body>
<script>
    function changeImg(newSrc) {
        var img_center = document.getElementById('img_center');
        console.log(newSrc)
        img_center.src = newSrc;
    }
    $(document).ready(function () {
        $(".owl-carousel").owlCarousel();
        var count = 1;
        var increase = $('#increase');
        var decrease = $('#decrease');
        var amount = $('#amount');
        var url="<%=url%>";
        var productId=<%=product.getIdProduct()%>;
        var buynowlink= document.getElementById("buy-now-link");
        increase.click(function () {
            count++;
            amount.val(count);
            buynowlink.href=`${url}/PaymentBuyNow?id=${productId}&quantity=${count}`
        })
        decrease.click(function () {
            if (count > 1 ) {
                count--;
            }
            amount.val(count);
            buynowlink.href=`${url}/PaymentBuyNow?id=${productId}&quantity=${count}`
        })

    })
    function checkQuantity(event) {
        // Lấy giá trị của input
        const inputValue = document.getElementById("amount").value;
        var quantityAvai=<%=product.getQuantityAvailable()%>;
        // Kiểm tra nếu input lớn hơn quantityAvai
        if (parseInt(inputValue) > quantityAvai) {
            // Không cho đi
            event.preventDefault();
            // Hiển thị alert thông báo
            alert("Số lượng trong kho không đủ!");
        }
    }

    // Gắn sự kiện cho nút submit
    document.getElementById("buynow").addEventListener("click", checkQuantity);
</script>
</html>