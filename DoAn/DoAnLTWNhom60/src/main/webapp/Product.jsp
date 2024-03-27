    <%@ page import="java.util.ArrayList" %>
    <%@ page import="model.Product" %>
    <%@ page import="model.Category" %>
    <%@ page import="java.text.NumberFormat" %>
    <%@ page import="model.Cart" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang sản phẩm</title>
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
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>
    <!--header-->
    <header>
        <jsp:include page="Header.jsp"></jsp:include>
    </header>
    <%--end header--%>
    <%
        NumberFormat nF = NumberFormat.getCurrencyInstance();
        ArrayList<String> listColor = (ArrayList<String>) request.getAttribute("listColorP");
        ArrayList<Category> listCate = (ArrayList<Category>) request.getAttribute("listCate");
        Cart cart = (Cart) session.getAttribute("Cart");
        ArrayList<Product> listProductByName = (ArrayList<Product>) request.getAttribute("listProductByName");
        if (listProductByName == null || listProductByName.isEmpty()) {
    %>
    <div class="container p-0 mgt" >
        <a href="<%=url%>/homePage" class="color-gray lbhv text-decoration-none">Trang chủ  <i class="fa fa-angle-right color-gray" aria-hidden="true"></i>  </a> <span class="text-color" id ="sp">Sản phẩm</span>
        <span class="text-color" id ="nameCate"></span>
        <div class="row mt-3">
            <!-- menu left -->
            <div class="col-lg-3">
                <div class="list-group ">
                    <div class="cate" id="cate">
                        <div class="icon-bar my-2 py-1">
                            <i class="fa fa-bars" aria-hidden="true"></i>
                        </div>
                        <div class="cateList d-flex align-items-center justify-content-center p-0" id ="cateList">
                            <h5 class ="my-2">DANH MỤC SẢN PHẨM </h5>
                        </div>
                    </div>
                    <div class="typeChair" id ="typeChair" >
                        <%
                            if (!listCate.isEmpty() && listCate != null) {
                                for (Category c : listCate) {
                        %>
                        <a href="#" class="list-group-item list-group-item-action lt" onclick="loadProductByIdCate('<%=c.getId()%>')"><%=c.getName()%></a>
                        <%}
                        }%>
                    </div>
                </div>
                <div class=" d-none d-md-none d-lg-block mt-3 bg-light border border-1 ">
                    <div class="cate border-bottom" id ="filProduct">
                        <div class="icon-bar my-2 py-1">
                            <i class="fa fa-filter" aria-hidden="true"></i>
                        </div>
                        <div class="cateList d-flex align-items-center justify-content-center p-0"  >
                            <h5 class ="my-2">TÌM THEO</h5>
                        </div>
                    </div>
                    <div class="ps-2" >
                        <h6 class="my-2 fw-bold">Giá sản phẩm</h6>
                        <div class="mb-2"><input type="radio" name ="price" value ="D500000" id="below500000"> <label class="lbhv" for="below500000">Dưới 500.000 ₫</label></div>
                        <div class="mb-2"><input type="radio" name ="price" value ="D1000000" id="below1000000"> <label class="lbhv" for="below1000000">Dưới 1.000.000 ₫</label></div>
                        <div class="mb-2"><input type="radio" name ="price" value ="D5000000" id="below5000000"> <label class="lbhv" for="below5000000">Dưới 5.000.000 ₫</label></div>
                        <div class="mb-2"><input type="radio" name ="price" value ="D10000000" id="below10000000"> <label class="lbhv" for="below10000000">Dưới 10.000.000 ₫</label></div>
                        <div class="mb-2"><input type="radio"  name ="price" value ="Tren10000000" id="above10000000"> <label class="lbhv" for="above10000000">Trên 10.000.000 ₫</label></div>
                        <h6 class="my-2 fw-bold">Màu sản phẩm</h6>
                        <%if(listColor != null && !listColor.isEmpty()) {
                            for (String color: listColor) {%>
                        <div class="mb-2"><input type="radio" name="color" id ="<%=color%>" value ="<%=color%>"> <label class="lbhv" for ="<%=color%>"><%=color%></label></div>
                        <%}
                        }%>
                        <h6 class="my-2 fw-bold">Vật liệu</h6>
                        <div class="mb-2"><input type="radio" name ="material" id="wood" value ="Gỗ"> <label class="lbhv" for="wood">Gỗ</label></div>
                        <div class="mb-2"><input type="radio" name ="material" id="iron" value ="Sắt"> <label class="lbhv" for="iron">Sắt</label></div>
                        <div class="mb-2"><input type="radio" name ="material" id="steel"value ="Thép" > <label class="lbhv" for="steel">Thép</label></div>
                        <div class="mb-2"><input type="radio" name ="material" id="leather" value ="Da" > <label class="lbhv" for="leather">Da</label></div>
                        <div class="mb-2"><input type="radio" name ="material" id="fabric" value ="Vải"> <label class="lbhv" for="fabric">Vải</label></div>
                        <div class="mb-2"><input type="radio" name ="material" id="bamboo" value ="Tre"> <label class="lbhv" for="bamboo">Tre</label></div>
                        <div class="mb-2"><input type="radio" name ="material" id="plastic" value ="Nhựa"> <label class="lbhv" for="plastic">Nhựa</label></div>
                    </div>
                </div>
            </div>
            <!-- end menu left -->
            <!--product-->
            <div class="col-lg-9 ">
                <h5 class = "mt-3 mb-0">DANH SÁCH SẢN PHẨM</h5>
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
                                <h5 class="card-title"><%=p.getName()%></h5>
                                <p class="card-text">
                                <p class="price"><%=nF.format(p.getPrice())%></p>
                                <%
                                    int quantity = 1;
                                    if (cart != null) {
                                        if (cart.get(p.getIdProduct()) != null) {
                                            quantity = cart.get(p.getIdProduct()).getQuantity() + 1;
                                        }
                                    } else {
                                        quantity = p.getQuantity();
                                    }
                                %>
                                <a href ="<%=url%>/cartController?id=<%=p.getIdProduct()%>&quantity=<%=quantity%>"><i class="fa fa-shopping-cart cart" aria-hidden="true" title="Thêm vào giỏ hàng"></i></a>                            </p>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <%String display = request.getAttribute("hiddenLoadmore") +"";%>
                <button class="mt-3 bgcolor-orange border border-0 rounded-1 px-3 py-2 d-<%=display%>" id="loadMore" onclick="loadMore()">Tải thêm</button>
            </div>
        </div>
    </div>
    <%} else {%>
    <%
        String exits = request.getAttribute("exits") + "";
        exits = (exits.equals("null")) ? " " : exits;
    %>
    <div class="container p-0 mgt">
        <h6 class="text-center text-color mt-2 mb-0"><%=exits%>
        </h6>
        <div class="col-md-12">
            <div class="row">
                <%for (Product p : listProductByName) {%>
                <div class="col-md-3 col-sm-4 col-4 mt-3 product">
                    <div class="card">
                        <a href="<%=url%>/detail-product?pid=<%=p.getIdProduct()%>&cid=<%=p.getIdCate()%>">
                            <img src="<%=url%>\Products\<%=(p.getImages().isEmpty())?"":p.getImages().get(0).getUrl()%>" class="card-img-top img_p" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getName()%>
                            </h5>
                            <p class="card-text">
                            <p class="price"><%=nF.format(p.getPrice())%>
                            </p>
                            <%
                                int quantity = 1;
                                if (cart != null) {
                                    if (cart.get(p.getIdProduct()) != null) {
                                        quantity = cart.get(p.getIdProduct()).getQuantity() + 1;
                                    }
                                } else {
                                    quantity = p.getQuantity();
                                }
                            %>
                            <a href ="<%=url%>/cartController?id=<%=p.getIdProduct()%>&quantity=<%=quantity%>"><i class="fa fa-shopping-cart cart" aria-hidden="true" title="Thêm vào giỏ hàng"></i></a>
                            </p>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
    <%}%>
    <footer>
        <jsp:include page="Footer.jsp"></jsp:include>
    </footer>
    </body>
    <script>
        var price = "";
        var color = "";
        var material = "";
        var command = "";
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
                $('#sp').removeClass("text-color");
                $('#sp').addClass("color-gray")
                var nameCate = $(this).text()
                console.log(nameCate);
                $('#nameCate').html('<i class="fa fa-angle-right color-gray" aria-hidden="true"></i> ' + nameCate);
                var unCheckedRadio = $('input[type="radio"][name="price"]:checked, input[type="radio"][name="color"]:checked, input[type="radio"][name="material"]:checked');
                unCheckedRadio.prop('checked', false);
                if (backProduct === idCateCurrent) {
                    $(this).css('color', 'black');
                    loadProduct();
                    backProduct = 0;
                    idCateCurrent = 0;
                    $('#sp').removeClass("color-gray");
                    $('#sp').addClass("text-color")
                    $('#nameCate').html('');
                } else {
                    price = "";
                    color = "";
                    material = "";
                    command = "";
                    $('.lt').css('color', '');
                    $(this).css('color', '#f68e2e')
                    backProduct = idCateCurrent;
                }
            })
            var preChecked = null;
            $('input[name="price"]').click(function () {
                var checked = $('input[name="price"]:checked');
                if (preChecked && checked.is(preChecked)) {
                    checked.prop('checked', false);
                    preChecked = null;
                    price = "";
                    command = "";
                    console.log(idCateCurrent)
                    if (color !== "" || material !== "") {
                        console.log(color, price)
                        filterProduct(command, price, color, material, idCateCurrent)
                    } else if (color !== "" && material !== "") {
                        filterProduct(command, price, color, material, idCateCurrent)
                    } else if (idCateCurrent !== 0) {
                        loadProductByIdCate(idCateCurrent);
                    } else {
                        loadProduct();
                    }
                } else {
                    $('#exits').removeClass("d-none");
                    var priceText = checked.val();
                    price = priceText.replace(/[^\d]/g, ''); // Loại bỏ tất cả các ký tự không phải là số
                    command = priceText.charAt(0);
                    filterProduct(command, price, color, material, idCateCurrent);
                    preChecked = checked;
                }
            });
            $('input[name="color"]').click(function () {
                var checked = $('input[name="color"]:checked');
                if (preChecked && checked.is(preChecked)) {
                    checked.prop('checked', false);
                    preChecked = null;
                    color = "";
                    if (price !== "" || material !== "") {
                        filterProduct(command, price, color, material, idCateCurrent)
                    } else if (price !== "" && material !== "") {
                        filterProduct(command, price, color, material, idCateCurrent)
                    } else if (idCateCurrent !== 0) {
                        loadProductByIdCate(idCateCurrent);
                    } else {
                        loadProduct();
                    }
                } else {
                    $('#exits').removeClass("d-none");
                    color = checked.val();
                    filterProduct(command, price, color, material, idCateCurrent);
                    preChecked = checked;
                }
            });
            $('input[name="material"]').click(function () {
                var checked = $('input[name="material"]:checked');
                if (preChecked && checked.is(preChecked)) {
                    checked.prop('checked', false);
                    preChecked = null;
                    material = "";
                    if (price !== "" || color !== "") {
                        filterProduct(command, price, color, material, idCateCurrent)
                    } else if (price !== "" && color !== "") {
                        filterProduct(command, price, color, material, idCateCurrent)
                    } else if (idCateCurrent !== 0) {
                        loadProductByIdCate(idCateCurrent);
                    } else {
                        loadProduct();
                    }
                } else {
                    $('#exits').removeClass("d-none");
                    material = checked.val();
                    filterProduct(command, price, color, material, idCateCurrent);
                    preChecked = checked;
                }
            });

        });

        function filterProduct(command, price, color, material) {
            document.getElementById("loadMore").classList.add("d-none");
            $.ajax({
                url: "filterProduct",
                method: "GET",
                data: {
                    color: color,
                    price: price,
                    material: material,
                    command: command,
                    idCate: idCateCurrent
                },
                success: function (data) {
                    var jsonData = JSON.parse(data);

                    var htmlData = jsonData.htmlData;
                    var productExits = jsonData.productExits;
                    var url = jsonData.url;
                    var exists = document.getElementById("exits");
                    exists.innerHTML = "CÓ " + productExits + " KẾT QUẢ TÌM KIẾM PHÙ HỢP";
                    var row = document.getElementById("content");
                    row.innerHTML = ""; // Clear existing content
                    for (var i = 0; i < htmlData.length; i++) {
                        var p = htmlData[i];
                        row.innerHTML += "<div class=\"col-lg-4 col-sm-6 mt-3 product\">\n" +
                            "                            <div class=\"card\">\n" +
                            "                                <a href=\"detail-product?pid=" + p.idProduct + "&cid=" + p.idCate + "\">\n"+
                            "                                    <img src=\"" + p.imageUrl + "\" class=\"card-img-top img_p\" alt=\"...\">\n" +
                            "                                </a>\n" +
                            "                                <div class=\"card-body\">\n" +
                            "                                    <h5 class=\"card-title\">" + p.name + "</h5>\n" +
                            "                                    <p class=\"card-text\">\n" +
                            "                                    <p class=\"price\">" + p.price + "\n" +
                            "                                    <a href =\""+url+"/cartController?id="+p.idProduct+"&quantity="+p.quantity+"\"><i class=\"fa fa-shopping-cart cart\" aria-hidden=\"true\" title=\"Thêm vào giỏ hàng\"></i></a>\n" +
                            "                                    </p>\n" +
                            "                                </div>\n" +
                            "                            </div>\n" +
                            "                        </div>";
                    }
                },
            });
        }

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
    </script>
    </html>