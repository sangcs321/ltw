<%@ page import="model.InforWebsite" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                    <a class="nav-link link" href="introWebsite"><li>Giới thiệu</li></a>
                    <a class="nav-link link" href="introWebsite"><li>Bảo hành</li></a>
                    <a class="nav-link link" href="introWebsite"><li>Đổi trả</li></a>
                    <a class="nav-link link" href="introWebsite"><li>Liên hệ</li></a>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <h5 class ="">THEO DÕI CHÚNG TÔI</h5>
                <hr class ="w-50">
                <ul class="navbar-nav">
                    <li class="px-3"><a class="nav-link link" href="#"><i class="fa fa-facebook-official" aria-hidden="true"></i> FaceBook</a></li>
                    <li class="px-3"><a class="nav-link link" href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Instagram</a></li>
                    <li class="px-3"><a class="nav-link link" href="#"><i class="fa fa-twitter" aria-hidden="true"></i>Twitter</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <h5 class = "">THÔNG TIN LIÊN HỆ</h5>
                <hr class ="w-50 ">
                <ul class="navbar-nav ">
                    <div id = "contain-contact">
                        <li class="nav-link"><i class="fa fa-map-marker" aria-hidden="true"></i></li>
                        <li class="nav-link" ><i class="fa fa-envelope" aria-hidden="true"></i></li>
                        <li class="nav-link" ><i class="fa fa-phone" aria-hidden="true"></i></li>
                    </div>
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
<script>
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "loadFooter",
            success: function (data) {
                var i = data.inforWebSite;
                var row = document.getElementById("contain-contact");
               row.innerHTML = " <li class=\"nav-link\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i> "+ i.address+"</li>\n" +
                   "                        <li class=\"nav-link\" ><i class=\"fa fa-envelope\" aria-hidden=\"true\"></i> "+ i.email+"</li>\n" +
                   "                        <li class=\"nav-link\" ><i class=\"fa fa-phone\" aria-hidden=\"true\"></i> "+ i.phoneNumber+"</li>"
            },
            error: function(error) {
                console.error("Xảy ra lỗi:", error);
            }
        });
    })
</script>
</html>