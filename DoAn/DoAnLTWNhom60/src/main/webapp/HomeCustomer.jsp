<%@ page import="model.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/Style.css">
</head>
<body>
<header>
    <div class="container-fluid bgcolor-orange" >
        <div class="container ">
            <div class="row ">
                <div class="col-md-9 col-sm-9 col-8 col-4 d-flex align-items-center  ">
                    <a class ="nav-link" href="#"> <img style="width: 150px" src="image/logoWeb.png">
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-4 py-3 px-0 d-flex align-items-center justify-content-end">
                    <ul class="d-flex m-0 list-unstyled justify-content-end">
                        <li class="px-3 pt-1"><a class="nav-link active" aria-current="page" href="#"><i class="fa fa-phone" aria-hidden="true"></i></a></li>
                        <li class="px-3 pt-1"><a class="nav-link" href="#"><i
                                class="fa fa-facebook-official" aria-hidden="true"></i></a></li>
                        <li class="px-3 pt-1"><a class="nav-link" href="#"><i
                                class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        <li class="px-3 pt-1"><a class="nav-link" href="#"><i
                                class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container-luid bd bgcolor">
        <div class="container p-0 ">
            <div class="row">
                <div class="col-lg-12 col-md-2 col-sm-2 col-2">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light pt-2 ">
                        <div class="container-fluid px-0">
                            <button class="navbar-toggler mt-1 " type="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                                    aria-controls="navbarTogglerDemo01" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                                <div class="col-md-12 col-lg-4 col-sm-12">
                                    <ul class="navbar-nav w-100  mb-2 mb-lg-0">
                                        <li class="nav-item hv "><a class="nav-link ps-0 "
                                                                    aria-current="page" href=HomePage.jsp>Trang chủ</a></li>
                                        <li class="nav-item hv"><a class="nav-link" href="IntroWebsite.jsp">Giới
                                            thiệu</a></li>
                                        <li class="nav-item dropdown hv"><a
                                                class="nav-link dropdown-toggle" href="#" id=""
                                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Sản phẩm </a>
                                            <ul class="dropdown-menu" aria-labelledby="">
                                                <li><a class="dropdown-item" href="#">Ghế văn phòng</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Ghế thư giãn</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Ghế trang trí</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Ghế gaming</a></li>
                                            </ul>
                                        </li>
                                        <li class="nav-item hv d-lg-none ">
                                            <ul class="navbar-nav justify-content-end ">
                                                <li class="nav-item dropdown hv"><a
                                                        class="nav-link dropdown-toggle" href="#"
                                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Tài khoản </a>
                                                    <ul class="dropdown-menu" aria-labelledby="">
                                                        <li class ="dropdown-item"> Xin chào: <span class = "fw-bold " class = "name">MinhQuan</span></li>
                                                        <li>
                                                            <hr class="dropdown-divider">
                                                        </li>
                                                        <li><a class="dropdown-item" href="HistoryBuy.jsp">Lịch sử mua hàng</a></li><li>
                                                        <hr class="dropdown-divider">
                                                        <li><a class="dropdown-item" href="ChangeInfor.jsp">Thay đổi thông tin</a></li><li>
                                                        <hr class="dropdown-divider">
                                                    </li>
                                                        <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                                                        <li>
                                                            <hr class="dropdown-divider">
                                                        </li>
                                                        <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>

                                </div>
                                <div class="col-lg-6 col-sm-8 col-8 bd-full  rounded-2 d-md-none d-sm-none d-none d-lg-block">
                                    <form class = "">
                                        <div class="form-search">
                                            <input class="form-control border-0" type="search"
                                                   placeholder="Nội dung tìm kiếm" aria-label="Search">
                                            <button class="btn border-0" type="submit">
                                                <i class="fa fa-search" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-lg-2  d-lg-block d-md-none d-none ">
                                    <ul class="navbar-nav justify-content-end">
                                        <%
                                            Object object = session.getAttribute("account");
                                            Account account = null;
                                            if(object != null)
                                                account = (Account) object;
                                            if(account == null){
                                        %>
                                        <a href="SignIn.jsp"> Đăng nhập </a>
                                        <%
                                            }else{
                                        %>
                                        <li class="nav-item hv pe-2"><a class="nav-link" href="#"><button class = "position-relative border-0 bg-light "><i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 25px"></i><span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">99+<span class="visually-hidden">unread messages</span></span>
                                        </button> </a> </li>
                                        <li class="nav-item dropdown hv  d-flex align-items-center"><a
                                                class="nav-link dropdown-toggle" href="#"
                                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Tài khoản </a>
                                            <ul class="dropdown-menu" aria-labelledby="">
                                                <li class ="dropdown-item"> Xin chào: <span class = "fw-bold " class = "name"><%= account.getName() %></span></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li><li>
                                                <hr class="dropdown-divider">
                                                <li><a class="dropdown-item" href="ChangeInfor.jsp">Thay đổi thông tin</a></li><li>
                                                <hr class="dropdown-divider">
                                            </li>
                                                <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                                            </ul>
                                        </li>
                                        <% }%>

                                    </ul>

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="col-md-10 col-sm-10 col-10 d-lg-none " style="padding: 11px 0" >
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-10 bd-full rounded-2   ">
                            <form class = "">
                                <div class="form-search">
                                    <input class="form-control border-0" type="search"
                                           placeholder="Nội dung tìm kiếm" aria-label="Search">
                                    <button class="btn border-0" type="submit">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-2 col-sm-2 col-2 ps-2 d-flex align-items-center">
                            <a class="nav-link" href="#">
                                <button class = "position-relative border-0 bg-light "><i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 25px"></i><span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">99+<span class="visually-hidden">unread messages</span></span>
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="container p-0 mgt" >
    <div class="row">
        <!-- menu left -->
        <div class="col-lg-3">
            <div class="list-group d-none d-md-none d-lg-block ">
                <div class="cate" id="cate">
                    <div class="icon-bar my-2 py-1">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </div>
                    <div class="cateList d-flex align-items-center justify-content-center p-0" id ="cateList">
                        <h5 class ="my-2">DANH MỤC SẢN PHẨM </h5>
                    </div>
                </div>
                <div class="typeChair" id ="typeChair" >
                    <a href="#" class="list-group-item list-group-item-action">Ghế văn phòng </a>
                    <a href="#" class="list-group-item list-group-item-action">Ghế thư giãn</a>
                    <a href="#" class="list-group-item list-group-item-action">Ghế trang trí</a>
                    <a href="#" class="list-group-item list-group-item-action">Ghế gaming</a>
                </div>
            </div>
            <div class="mt-3 d-none d-md-none d-lg-block ">
                <h5 class="m-0 text-center" id="titleCate">SẢN PHẨM MỚI NHẤT</h5>
                <hr class = "mt-2 mb-2"/>
                <div class="card">
                    <a href="DetailProduct.jsp">
                        <img src=" https://i.pinimg.com/564x/c4/d8/88/c4d8881ff372b46b2b9f98ae07d9886a.jpg" class="card-img-top img_p" alt="...">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Ghế gấu len cừu cao cấp</h5>
                        <p class="card-text">
                        <p class="price">₫1.000.000</p></p>
                        <a href="Cart.jsp"><i class="fa fa-shopping-cart cart" aria-hidden="true" title ="Thêm vào giỏ hàng"></i></a>
                    </div>
                </div>
            </div>
            <div class="mt-3 d-none d-md-none d-lg-block     ">
                <h5 class="m-0 text-center" >SẢN PHẨM BÁN CHẠY NHẤT</h5>
                <hr class = "mt-2 mb-2"/>
                <div class="card">
                    <a href="DetailProduct.jsp">
                        <img src="https://down-vn.img.susercontent.com/file/sg-11134201-7r9a2-llujnaskifkp71" class="card-img-top img_p" alt="...">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">Ghế xoay</h5>
                        <p class="card-text">
                        <p class="price">₫1.000.000</p></p>
                        <a href="Cart.jsp"><i class="fa fa-shopping-cart cart" aria-hidden="true" title ="Thêm vào giỏ hàng"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- end menu left -->
        <!-- carousel -->
        <div class="col-lg-9">
            <div class="filter d-flex text-center">
                <div class="pt-2 pe-4">
                    <i class="fa fa-filter" aria-hidden="true"></i> <span>Lọc:</span>
                </div>
                <div class="option pe-2">
                    <ul class="navbar-nav ps-2">
                        <li class="nav-item dropdown hv"><a
                                class="nav-link dropdown-toggle" href="#"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Giá </a>
                            <ul class="dropdown-menu" aria-labelledby="">
                                <li><a class="dropdown-item" href="#">Dưới 500.000</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Dưới 1.000.000</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Dưới 10.000.000</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Trên 10.000.000</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="option pe-2">
                    <ul class="navbar-nav ps-2">
                        <li class="nav-item dropdown hv"><a
                                class="nav-link dropdown-toggle" href="#"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Màu sắc </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Nâu</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Xám</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Trắng</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Đỏ</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="option pe-2">
                    <ul class="navbar-nav ps-2">
                        <li class="nav-item dropdown hv"><a
                                class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Vật liệu </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Gỗ</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Inox</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Sắt</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Nhựa</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Nhôm</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="carouselExampleIndicators" class="carousel slide"
                 data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="0" class="active" aria-current="true"
                            aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img  src="image/slide1.jpg"
                              class="d-block img_p" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="image/slide2.jpg"
                             class="d-block img_p" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="image/slide3.jpg"
                             class="d-block img_p" alt="...">
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
            <!--end carousel-->
            <!--product-->
            <div class="row mt-3">
                <h5 class = "m-0 ">DANH SÁCH SẢN PHẨM</h5>
                <div class="col-lg-4 col-sm-6 mt-3">
                    <div class="card">
                        <a href="DetailProduct.jsp">
                            <img src=" https://i.pinimg.com/236x/27/50/7c/27507ccedd97a1940a2d19e09a3e593c.jpg" class="card-img-top img_p" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Ghế Papasan</h5>
                            <p class="card-text">
                            <p class="price">₫1.000.000</p></p>
                            <a href="Cart.jsp"><i class="fa fa-shopping-cart cart" aria-hidden="true" title ="Thêm vào giỏ hàng"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 mt-3">
                    <div class="card">
                        <a href="DetailProduct.jsp">
                            <img src="https://homeoffice.com.vn/images/detailed/47/ghe-sofa-don-vang-dong-nem-xanh-gsd68046-01_hq87-34.jpeg" class="card-img-top img_p" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Ghế tựa trang trí </h5>
                            <p class="card-text">
                            <p class="price">₫1.000.000</p></p>
                            <a href="Cart.jsp"><i class="fa fa-shopping-cart cart" aria-hidden="true" title ="Thêm vào giỏ hàng"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 mt-3">
                    <div class="card">
                        <a href="DetailProduct.jsp">
                            <img src="https://down-vn.img.susercontent.com/file/sg-11134201-22120-grkmwu1es6kv78" class="card-img-top img_p" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Ghế máy tính trang trí </h5>
                            <p class="card-text">
                            <p class="price">₫1.000.000</p></p>
                            <a href="Cart.jsp"><i class="fa fa-shopping-cart cart" aria-hidden="true" title ="Thêm vào giỏ hàng"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 mt-3">
                    <div class="card">
                        <a href="DetailProduct.jsp">
                            <img src="https://down-vn.img.susercontent.com/file/sg-11134201-22120-grkmwu1es6kv78" class="card-img-top img_p" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Ghế máy tính trang trí </h5>
                            <p class="card-text">
                            <p class="price">₫1.000.000</p></p>
                            <a href="Cart.jsp"><i class="fa fa-shopping-cart cart" aria-hidden="true" title ="Thêm vào giỏ hàng"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 mt-3">
                    <div class="card">
                        <a href="DetailProduct.jsp">
                            <img src="https://down-vn.img.susercontent.com/file/sg-11134201-22120-grkmwu1es6kv78" class="card-img-top img_p" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Ghế máy tính trang trí </h5>
                            <p class="card-text">
                            <p class="price">₫1.000.000</p></p>
                            <a href="Cart.jsp"><i class="fa fa-shopping-cart cart" aria-hidden="true" title ="Thêm vào giỏ hàng"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 mt-3">
                    <div class="card">
                        <a href="DetailProduct.jsp">
                            <img src="https://down-vn.img.susercontent.com/file/sg-11134201-22120-grkmwu1es6kv78" class="card-img-top img_p" alt="...">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">Ghế máy tính trang trí </h5>
                            <p class="card-text">
                            <p class="price">₫1.000.000</p></p>
                            <a href="Cart.jsp"><i class="fa fa-shopping-cart cart" aria-hidden="true" title ="Thêm vào giỏ hàng"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <button class="mt-3 bgcolor-orange border border-0 rounded-1 px-3 py-2">Tải thêm</button>
        </div>
    </div>
</div>

<!-- End Page content -->
<!--footer-->
<footer>
    <div class="container-fluid bgcolor-orange ">
        <div class="container mt-3 pb-3">
            <div class="row py-3 float-xs-center" >
                <div class="col-lg-3 col-md-6 col-sm-6 ">
                    <h5 class="">DANH MỤC SẢN PHẨM</h5>
                    <hr class ="w-50 ">
                    <ul class="navbar-nav ">
                        <a class="nav-link link" href=""><li>Ghế văn phòng</li></a>
                        <a class="nav-link link" href=""><li>Ghế thư giãn</li></a>
                        <a class="nav-link link" href=""><li>Ghế trang trí</li></a>
                        <a class="nav-link link" href=""><li>Ghế gaming</li></a>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 ">
                    <h5>VỀ CHÚNG TÔI</h5>
                    <hr class ="w-50 ">
                    <ul class="navbar-nav ">
                        <a class="nav-link link" href="IntroWebsite.jsp"><li>Giới thiệu</li></a>
                        <a class="nav-link link" href="IntroWebsite.jsp#policy"><li>Bảo hành</li></a>
                        <a class="nav-link link" href="IntroWebsite.jsp#policy"><li>Đổi trả</li></a>
                        <a class="nav-link link" href="IntroWebsite.jsp#contact"><li>Liên hệ</li></a>

                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <h5 class ="">THEO DÕI CHÚNG TÔI</h5>
                    <hr class ="w-50">
                    <ul class="navbar-nav">
                        <li class="px-3"><a class="nav-link link" href="#"><i
                                class="fa fa-facebook-official" aria-hidden="true"></i> FaceBook</a></li>
                        <li class="px-3"><a class="nav-link link" href="#"><i
                                class="fa fa-instagram" aria-hidden="true"></i></i> Instagram</a></li>
                        <li class="px-3"><a class="nav-link link" href="#"><i
                                class="fa fa-twitter" aria-hidden="true"></i></i>Twitter</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <h5 class = "">THÔNG TIN LIÊN HỆ</h5>
                    <hr class ="w-50 ">
                    <ul class="navbar-nav ">
                        <li class="nav-link"><i class="fa fa-map-marker" aria-hidden="true"></i> 230A Tô Ngọc Vân, Phường Linh Xuân, Thành phố Thủ Đức</li>
                        <li class="nav-link" ><i class="fa fa-envelope" aria-hidden="true"></i> homedecorsqn@gmail.com</li>
                        <li class="nav-link" ><i class="fa fa-phone" aria-hidden="true"></i> 0812295775</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row bgcolor-gray">
            <div class="col text-center color-gray">
                Nhom 60 &copy;2023. All rights reserved.
            </div>
        </div>
    </div>
</footer>
<!--end footer-->
</body>
<script>
    $(document).ready(function () {
        // ẩn hiện thanh danh mục
        $('#cate').click(function () {
            var typeChair = $('#typeChair');
            if (typeChair.css("display") === "none") {
                typeChair.css("display", "block");
            } else {
                typeChair.css("display", "none");
            }
        })
        // chuyển hướng tới mục chính sách mua hàng trong trang giới thiệu
        if (window.location.hash === "#policy") {
            var targetElement = $('#policy');
            if (targetElement.length > 0) {
                $('html, body').animate({
                    scrollTop: targetElement.offset().top
                }, 1000); // 1000 milliseconds = 1 second (điều này tạo hiệu ứng trượt mượt)
            }
        }
        // chuyển hướng tới mục thông tin liên hệ
        if (window.location.hash === "#contact") {
            var targetElement = $('#contact');

            if (targetElement.length > 0) {
                $('html, body').animate({
                    scrollTop: targetElement.offset().top
                }, 1000); // 1000 milliseconds = 1 second (điều này tạo hiệu ứng trượt mượt)
            }
        }
    });
</script>
</html>

</body>
</html>