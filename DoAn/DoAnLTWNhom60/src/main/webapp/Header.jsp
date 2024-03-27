<%@ page import="model.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Account" %>
<%@ page import="model.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    Cart cart = (Cart) session.getAttribute("Cart");
    int qtt = (cart != null) ? cart.list().size() : 0;
    String quantityItem = qtt + "";
    if (qtt > 99) quantityItem = "99+";
%>
<% Object obj = session.getAttribute("account");
    Account account = null;%>
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
                            <div class="col-md-12 col-lg-3 col-sm-12">
                                <ul class="navbar-nav w-100  mb-2 mb-lg-0">
                                    <li class="nav-item hv "><a class="nav-link ps-0 " aria-current="page" href=<%=url%>/homePage>Trang chủ</a></li>
                                    <li class="nav-item hv"><a class="nav-link" href="<%=url%>/introWebsite">Giới thiệu</a></li>
                                    <li class="nav-item hv"><a class="nav-link" href="<%=url%>/product">Sản phẩm</a></li>
                                    <li class="nav-item hv d-lg-none ">
                                        <ul class="navbar-nav justify-content-end ">
                                            <%
                                                if (obj == null) {
                                            %>
                                            <li class="nav-item dropdown hv d-flex justify-content-center align-items-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tài khoản </a>
                                                <ul class="dropdown-menu" aria-labelledby="">
                                                    <li><a class="dropdown-item" href="<%=url%>/SignIn.jsp">Đăng nhập</a></li>
                                                    <li><hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item" href="<%=url%>/SignUp.jsp">Đăng kí</a></li>
                                                </ul>
                                            </li>

                                            <%
                                            }else {
                                                account = (Account) obj;
                                                if ((account != null) &&(account.getRole() == 0 || account.getRole() ==1)) {
                                            %>
                                            <li class="nav-item dropdown hv d-flex justify-content-center align-items-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tài khoản </a>
                                                <ul class="dropdown-menu" aria-labelledby="">
                                                    <li class ="dropdown-item"> Xin chào: <span class = "fw-bold " class = "name"><%=account.getName()%></span></li>
                                                    <li><hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item" href="<%=url%>/manage">Quản lý</a></li>
                                                    <li><hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item" href="<%=url%>/ChangeInfor.jsp">Thay đổi thông tin</a></li><li>
                                                    <hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item" href="<%=url%>/ChangePW.jsp">Đổi mật khẩu</a></li>
                                                    <li><hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item" href="<%=url%>/signOut">Đăng xuất</a></li>
                                                </ul>
                                            </li>
                                            <%}else {%>
                                            <li class="nav-item dropdown hv"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tài khoản </a>
                                                <ul class="dropdown-menu" aria-labelledby="">
                                                    <li class ="dropdown-item"> Xin chào: <span class = "fw-bold " class = "name"><%= account.getName()%></span></li>
                                                    <li><hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item" href="<%=url%>/history">Lịch sử mua hàng</a></li>
                                                    <li><hr class="dropdown-divider"> </li>
                                                    <li><a class="dropdown-item" href="<%=url%>/ChangeInfor.jsp">Thay đổi thông tin</a></li><li>
                                                    <hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item" href="<%=url%>/ChangePW.jsp">Đổi mật khẩu</a></li>
                                                    <li><hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item" href="<%=url%>/signOut">Đăng xuất</a></li>
                                                </ul>
                                            </li>
                                            <%}
                                            }%>

                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-7 col-sm-8 col-8 bd-full  rounded-2 d-md-none d-sm-none d-none d-lg-block">
                                <form action="<%=url%>/loadProductByName" method="get">
                                    <div class="form-search">
                                        <input class="form-control border-0 search" type="text" value="" aria-label="Search" name ="search">
                                        <button class="btn border-0" type="submit">
                                            <i class="fa fa-search" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-2  d-lg-block d-md-none d-none ">
                                <ul class="navbar-nav justify-content-end">
                                    <li class="nav-item hv pe-2"><a class="nav-link" href="<%=url%>/Cart.jsp"><button class = "position-relative border-0 bg-light "><i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 25px"></i><span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"><%=quantityItem%><span class="visually-hidden">unread messages</span></span>
                                    </button> </a> </li>
                                    <%
                                        if (obj == null) {
                                    %>
                                    <li class="nav-item dropdown hv d-flex justify-content-center align-items-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tài khoản </a>
                                        <ul class="dropdown-menu" aria-labelledby="">
                                            <li><a class="dropdown-item" href="<%=url%>/SignIn.jsp">Đăng nhập</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/SignUp.jsp">Đăng kí</a></li>
                                        </ul>
                                    </li>

                                    <%
                                    }else {
                                        account = (Account) obj;
                                        if ((account != null) &&(account.getRole() == 0 || account.getRole() ==1)) {
                                    %>
                                    <li class="nav-item dropdown hv d-flex justify-content-center align-items-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tài khoản </a>
                                        <ul class="dropdown-menu" aria-labelledby="">
                                            <li class ="dropdown-item"> Xin chào: <span class = "fw-bold " class = "name"><%=account.getName()%></span></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/manage">Quản lý</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/ChangeInfor.jsp">Thay đổi thông tin</a></li><li>
                                            <hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/ChangePW.jsp">Đổi mật khẩu</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/signOut">Đăng xuất</a></li>
                                        </ul>
                                    </li>
                                    <%}else {%>
                                    <li class="nav-item dropdown hv d-flex justify-content-center align-items-center"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tài khoản </a>
                                        <ul class="dropdown-menu" aria-labelledby="">
                                            <li class ="dropdown-item"> Xin chào: <span class = "fw-bold " class = "name"><%= account.getName()%></span></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/history">Lịch sử mua hàng</a></li>
                                            <li><hr class="dropdown-divider"> </li>
                                            <li><a class="dropdown-item" href="<%=url%>/ChangeInfor.jsp">Thay đổi thông tin</a></li><li>
                                            <hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/ChangePW.jsp">Đổi mật khẩu</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="<%=url%>/signOut">Đăng xuất</a></li>
                                        </ul>
                                    </li>
                                    <%}
                                    }%>

                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="col-md-10 col-sm-10 col-10 d-lg-none " style="padding: 11px 0" >
                <div class="row">
                    <div class="col-md-10 col-sm-10 col-10 bd-full rounded-2   ">
                        <form action="<%=url%>/loadProductByName" method="get">
                            <div class="form-search">
                                <input class="form-control border-0 search" type="text " aria-label="Search" value="" name ="search">
                                <button class="btn border-0" type="submit">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-2 col-sm-2 col-2 ps-2 d-flex align-items-center">
                        <a class="nav-link" href="#">
                            <button class = "position-relative border-0 bg-light "><i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 25px"></i><span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"><%=quantityItem%><span class="visually-hidden">unread messages</span></span></button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        var placeholderText = "Tìm kiếm sản phẩm theo tên";
        var inputElement = $(".search");
        var currentIndex = 0;

        function updatePlaceholder() {
            var currentText = placeholderText.substring(0, currentIndex);
            inputElement.attr("placeholder", currentText);
            currentIndex = (currentIndex + 1) % (placeholderText.length + 1);
        }

        // set interval để lặp lại sau mỗi 100ms
        var intervalId = setInterval(updatePlaceholder, 100);

        // stop hành động lặp khi ấn vào
        inputElement.focus(function(){
            clearInterval(intervalId);
            inputElement.attr("placeholder", placeholderText);
        });

        // restart lại hành động lặp khi không ấn vào nữa
        inputElement.blur(function(){
            currentIndex = 0;
            intervalId = setInterval(updatePlaceholder, 100);
        });
    });
</script>
</html>