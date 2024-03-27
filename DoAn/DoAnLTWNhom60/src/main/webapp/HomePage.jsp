<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="model.Category" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.Cart" %>
<%@ page import="model.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
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
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<!--header-->
<header>
    <jsp:include page="Header.jsp"></jsp:include>
</header>
<!--end header-->
<!--page content-->
<%
    NumberFormat nF = NumberFormat.getCurrencyInstance();
    ArrayList<String> listColor = (ArrayList<String>) request.getAttribute("listColorP");
    ArrayList<String> listCarousel = (ArrayList<String>) request.getAttribute("listCarousel");
    Cart cart = (Cart) session.getAttribute("Cart");
    Account account = (Account) session.getAttribute("account");
%>
<div class="container p-0 mgt">
    <div class="row">
        <!-- menu left -->
        <div class="col-lg-3">
            <div class="list-group ">
                <div class="cate" id="cate">
                    <div class="icon-bar my-2 py-1">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </div>
                    <div class="cateList d-flex align-items-center justify-content-center p-0" id="cateList">
                        <h5 class="my-2">DANH MỤC SẢN PHẨM </h5>
                    </div>
                </div>
                <div class="typeChair" id="typeChair">
                    <%ArrayList<Category> listCate = (ArrayList<Category>) request.getAttribute("listCate");%>
                    <%if (!listCate.isEmpty() && listCate != null) {%>
                    <%for (Category c : listCate) {%>
                    <a href="#" class="list-group-item list-group-item-action lt"
                       onclick="loadProductByIdCate('<%=c.getId()%>')"><%=c.getName()%>
                    </a>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <%
                Product latestProduct = (Product) request.getAttribute("latestP");
                if (latestProduct != null) {
            %>
            <div class="mt-3 d-none d-md-none d-lg-block ">
                <h5 class="m-0 text-center" id="titleCate">SẢN PHẨM MỚI NHẤT</h5>
                <hr class="mt-2 mb-2"/>
                <div class="card">
                    <a href="<%=url%>/detail-product?pid=<%=latestProduct.getIdProduct()%>&cid=<%=latestProduct.getIdCate()%>">
                        <img src="<%=url%>\Products\<%=(latestProduct.getImages().isEmpty())?"":latestProduct.getImages().get(0).getUrl()%>" class="card-img-top img_p" alt="...">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title"><%=latestProduct.getName()%>
                        </h5>
                        <p class="card-text">
                        <p class="price"><%=nF.format(latestProduct.getPrice())%>
                        </p>
                        <%
                            int quantity = 1;
                            if (cart != null) {
                                if (cart.get(latestProduct.getIdProduct()) != null) {
                                    quantity = cart.get(latestProduct.getIdProduct()).getQuantity() + 1;
                                }
                            } else {
                                quantity = latestProduct.getQuantity();
                            }
                        %>
                        <a href ="<%=url%>/cartController?id=<%=latestProduct.getIdProduct()%>&quantity=<%=quantity%>"><i class="fa fa-shopping-cart cart" aria-hidden="true" title="Thêm vào giỏ hàng"></i></a>
                    </div>
                </div>
            </div>
            <%}%>
            <%
                Product bestSaler = (Product) request.getAttribute("bestSaler");
                if(bestSaler != null) {
            %>
            <div class="mt-3 d-none d-md-none d-lg-block">
                <h5 class="m-0 text-center">SẢN PHẨM BÁN CHẠY NHẤT</h5>
                <hr class="mt-2 mb-2"/>
                <div class="card">
                    <a href="<%=url%>/detail-product?pid=<%=bestSaler.getIdProduct()%>&cid=<%=bestSaler.getIdCate()%>">
                        <img src="<%=url%>/Products/<%=(bestSaler.getImages().isEmpty())?"":bestSaler.getImages().get(0).getUrl()%>" class="card-img-top img_p" alt="...">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title"><%=bestSaler.getName()%></h5>
                        <p class="card-text">
                        <p class="price"><%=nF.format(bestSaler.getPrice())%></p></p>
                        <%
                            int quantity = 1;
                            if (cart != null) {
                                if (cart.get(bestSaler.getIdProduct()) != null) {
                                    quantity = cart.get(bestSaler.getIdProduct()).getQuantity() + 1;
                                }
                            } else {
                                quantity = bestSaler.getQuantity();
                            }
                        %>
                        <a href ="<%=url%>/cartController?id=<%=bestSaler.getIdProduct()%>&quantity=<%=quantity%>"><i class="fa fa-shopping-cart cart" aria-hidden="true" title="Thêm vào giỏ hàng"></i></a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
        <!-- end menu left -->
        <!-- carousel -->
        <div class="col-lg-9 ">
            <%if(account != null && (account.getRole() == 0 || account.getRole() == 1)){%>
            <div class="text-end mb-1">
                <button type ="button" class="btnAdd bgcolor bd-full" id ="btnAddImage" data-bs-toggle="modal" data-bs-target="#editCarousel" onclick="innerCarousel()">
                    <i class="fa fa-pencil text-color" aria-hidden="true" title="Chỉnh sửa carousel" ></i>
                </button>
            </div>
            <%}%>
            <%if(listCarousel != null && !listCarousel.isEmpty()) {%>
            <div id="carouselExampleIndicators" class="carousel slide d-none d-md-none d-lg-block "
                 data-bs-ride="carousel">
                <div id = "innerCarousel1">
                    <div class="carousel-indicators">
                        <%
                            int i = 0;
                            for (String s : listCarousel) {
                        %>
                        <button type="button" data-bs-target="#carouselExampleIndicators"
                                data-bs-slide-to="<%=i%>" class="active" aria-current="true"
                                aria-label="Slide <%=i+1%>"
                        ></button>
                        <%
                                i++;
                            }%>
                    </div>
                </div>
                <div id = "innerCarousel2">
                    <div class="carousel-inner">
                        <%
                            boolean firstItem = true;
                            for (String s : listCarousel) {
                        %>
                        <div class="carousel-item <%= firstItem ? "active" : "" %>">
                            <img src="image/Carousel/<%= s %>" class="d-block img_p" alt="...">
                        </div>
                        <%
                                firstItem = false; // Đánh dấu đã qua thẻ đầu tiên
                            }
                        %>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <%}%>
            <div class="modal fade" id="editCarousel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <form class="form " action="" method="post">
                                <div class="row px-2">
                                    <div class=" text-end">
                                        <button type="button" class="btn-close " data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <h5 class="text-center">CHỈNH SỬA CAROUSEL</h5>
                                    <hr>
                                    <div class="col-md-12 m-auto">
                                        <div id ="image">
                                            <label class="form-label">Hình ảnh<span class="text-danger">*</span></label><span id="errImg1" class="text-danger"></span>
                                        </div>
                                        <div class="text-end mb-3">
                                            <button type ="button" class="btnAdd bgcolor bd-full" id ="btnAddImageEdit" onclick="addInput()"><i class="fa fa-plus-circle text-color" aria-hidden="true" title="Thêm hình ảnh" ></i></button>
                                        </div>
                                    </div>
                                    <div class="row p-0">
                                        <div class="col-md-12 p-0">
                                            <div class="text-end">
                                                <button class="save " type="button" onclick="editCarousel()">LƯU</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--end carousel-->
            <!--product-->
            <h5 class="mt-3 mb-0">DANH SÁCH SẢN PHẨM</h5>
            <h6 class="text-center text-color mt-2 mb-0" id="exits"></h6>
            <div class="row" id="content">
                <%ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listP");
                    if (!listProduct.isEmpty() && listProduct != null) {
                        for (Product p : listProduct) {%>
                <div class="col-lg-4 col-sm-6 col-6 mt-3 product">
                    <div class="card">
                        <a href="<%=url%>/detail-product?pid=<%=p.getIdProduct()%>&cid=<%=p.getIdCate()%>">
                            <img src="<%=url%>\Products\<%=(p.getImages().isEmpty())?"":p.getImages().get(0).getUrl()%>" class="card-img-top img_p" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getName()%>
                            </h5>
                            <p class="card-text">
                            <p class="price"><%=nF.format(p.getPrice())%></p>
                            <%
                                int quantityBS = 1;
                                if (cart != null) {
                                    if (cart.get(p.getIdProduct()) != null) {
                                        quantityBS = cart.get(p.getIdProduct()).getQuantity() + 1;
                                    } else {
                                        quantityBS = p.getQuantity();
                                    }
                                }
                            %>
                            <a href ="<%=url%>/cartController?id=<%=p.getIdProduct()%>&quantity=<%=quantityBS%>"><i class="fa fa-shopping-cart cart" aria-hidden="true" title="Thêm vào giỏ hàng"></i></a>
                            </p>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <%String display = request.getAttribute("hiddenLoadmore") + "";%>
            <button class="mt-3 bgcolor-orange border border-0 rounded-1 px-3 py-2 d-<%=display%>" id="loadMore"
                    onclick="loadMore()">Tải thêm
            </button>
        </div>
    </div>
</div>
<!-- End Page content -->
<!--footer-->
<footer>
    <jsp:include page="Footer.jsp"></jsp:include>
</footer>
<!--end footer-->
<script>
    var idCateCurrent = 0;
    var backProduct = 0;
    $(document).ready(function () {
        // ẩn hiện danh mục
        $('#cate').click(function () {
            var typeChair = $('#typeChair');
            if (typeChair.css("display") === "none") {
                typeChair.css("display", "block");
            } else {
                typeChair.css("display", "none");
            }
        })
        $('.lt').click(function () {
            var unCheckedRadio = $('input[type="radio"][name="price"]:checked, input[type="radio"][name="color"]:checked, input[type="radio"][name="material"]:checked');
            unCheckedRadio.prop('checked', false);
            if (backProduct === idCateCurrent) {
                $(this).css('color', 'black');
                loadProduct();
                backProduct = 0;
                idCateCurrent = 0;
            } else {
                $('.lt').css('color', '');
                $(this).css('color', '#f68e2e')
                backProduct = idCateCurrent;
            }
        })
    });
    function loadMore() {
        var count = document.getElementsByClassName("product").length;
        $.ajax({
            url: "loadMore",
            method: "GET",
            data: {
                exits: count,
                idCate: idCateCurrent
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML += data;
            },
        });
    }

    function loadProductByIdCate(idCate) {
        document.getElementById("loadMore").classList.remove("d-none")
        document.getElementById("exits").classList.add("d-none");
        $.ajax({
            url: "loadProductByIdCate",
            method: "GET",
            data: {
                cid: idCate
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
        });
        idCateCurrent = idCate;
    }

    function loadProduct() {
        document.getElementById("loadMore").classList.remove("d-none")
        document.getElementById("exits").classList.add("d-none");
        $.ajax({
            url: "loadProduct",
            method: "GET",
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
        });
    }
    function displaySelectedImage(input) {
        var fileInput = input;
        var selectedFile = fileInput.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            // Tìm img tương ứng trong phạm vi cha của input
            var imgElement = input.parentElement.querySelector('.selectedImage');
            imgElement.classList.remove("d-none");
            imgElement.src = e.target.result;
        };

        if (selectedFile) {
            reader.readAsDataURL(selectedFile);
        }
    }

    function addInput() {
        var container = document.getElementById('image');
        var newInput = document.createElement('div');
        newInput.className = 'mb-3 d-flex align-items-center';
        newInput.innerHTML = `<img src="" class="card-img-top img_p_cart selectedImage me-2 d-none" alt="..."/> <input type="file" name ="image" class="form-control imageInput" onchange="displaySelectedImage(this)" style ="height:40px"> <button type ="button" class="btnAdd bgcolor bd-full ms-2 remove" onclick="removeInput(this)" style ="height:40px"><i class="fa fa-minus-circle text-color" aria-hidden="true" title="Xóa hình ảnh" ></i></button>`;
        container.appendChild(newInput);
    }
    function removeInput(button) {
        var container = document.getElementById('image');
        var divToRemove = button.parentNode; // Lấy đến div chứa nút xóa
        container.removeChild(divToRemove);
    }
    function innerCarousel() {
        $.ajax({
            type: "GET",
            url: "loadCarousel",
            success: function (data) {
                var htmlData = data.htmlData;
                var container = document.getElementById('image');
                container.innerHTML = "";
                for (var i = 0; i < htmlData.length; i++) {
                    var c = htmlData[i];
                    var newInput = document.createElement('div');
                    newInput.className = 'mb-3 d-flex align-items-center';
                    newInput.innerHTML = `<img src="image/Carousel/${c}"" class="card-img-top img_p_cart me-2" alt="..."/> <input type="text" class="form-control " name="imageAvai" value="image/Carousel/${c}" style ="height:40px"> <button type="button" class="btnAdd bgcolor bd-full ms-2  remove" style ="height:40px" onclick="removeInput(this)"><i class="fa fa-minus-circle text-color" aria-hidden="true" title="Xóa hình ảnh"></i></button>`;
                    container.appendChild(newInput);
                }
            },
            error: function () {
                console.error("Không thể tải chi tiết sản phẩm");
            }
        });
    };
    function editCarousel() {
        var formData = new FormData();
        var fileInputs = document.getElementsByName('image');
        for (var i = 0; i < fileInputs.length; i++) {
            var fileInput = fileInputs[i];
            formData.append('image', fileInput.files[0]);
        }
        var imgAvai = document.getElementsByName("imageAvai");
        for (var i = 0; i < imgAvai.length; i++) {
            formData.append('imageAvai', imgAvai[i].value);
        }
        $.ajax({
            url: 'editCarousel',
            type: 'post',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data) {
                alert(data.res);
                location.reload();
            },
            error: function(error) {
                console.error("Xảy ra lỗi:", error);
            }
        });
    }
</script>
</body>
</html>