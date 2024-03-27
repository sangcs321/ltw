<%@ page import="model.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đổi mật khẩu</title>
    <script src = "https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
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
    <link rel="stylesheet" href="css/SignUp.css">
    <link rel="stylesheet" href="css/Style.css">
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<header>
    <div class="container-fluid bgcolor-orange" >
        <div class="container ">
            <div class="row ">
                <div class="col-md-9 col-sm-9 col-8 col-4 d-flex align-items-center  ">
                    <a class ="nav-link" href="<%=url%>/homePage"> <img style="width: 150px" src="image/logoWeb.png">
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
</header>
<%
    Object obj = session.getAttribute("account");
    Object flag = request.getAttribute("flag");
    Account account = (Account) obj;
    if (account != null && flag==null) {
%>
<section class="signup mt-5">
    <!-- <img src="images/signup-bg.jpg" alt=""> -->
    <div class="contain">
        <div class="signup-content">
            <form id="signup-form" class="signup-form" action="changePassword" method="post" >
                <h5>ĐỔI MẬT KHẨU</h5>
                <%String success  = (String)request.getAttribute("success");
                    success =(success == null)?"":success;
                %>
                <div class="text-success text-center mt-3" id ="res"><%=success%></div>
                <div class="form-SignUp">
                    <%
                        String errPassword = (String)request.getAttribute("errPass");
                        errPassword =(errPassword == null)?"":errPassword;
                        String errNewPassword = (String)request.getAttribute("errNewPass");
                        errNewPassword =(errNewPassword == null)?"":errNewPassword;
                        String errReNewPassword = (String)request.getAttribute("errReNewPass");
                        errReNewPassword =(errReNewPassword == null)?"":errReNewPassword;
                    %>
                    <div class="form-group">
                        <label>Mật khẩu hiện tại<span class="text-danger">*</span></label><span class="text-danger" id="errPW"><%=errPassword%></span>
                        <input type="password" class="form-input" placeholder="Nhập mật khẩu hiện tại" name="password"
                               id="password"/>
                    </div>
                    <div class="form-group">
                        <label for="re_password">Mật khẩu mới<span class="text-danger">*</span></label><span class="text-danger" id="errNPW"><%=errNewPassword%></span>
                        <input type="password" class="form-input" placeholder="Nhập mật khẩu mới" name="new_password"
                               id="new_password"/>
                    </div>
                    <div class="form-group">
                        <label for="re_password">Xác nhận mật khẩu<span class="text-danger">*</span></label><span class="text-danger" id="errReNPW"><%=errReNewPassword%></span>
                        <input type="password" class="form-input" placeholder="Nhập lại mật khẩu mới" name="re_password"
                               id="re_password"/>
                    </div>

                </div>
                <div class="form-group">
                    <button type="submit">XÁC NHẬN</button>
                </div>
            </form>
        </div>
    </div>
    <%
    } else {
        if (account == null) {
    %>
    <div class="container p-0 mgt text-center fw-bold">Bạn chưa đăng nhập! <a href = <%=url%>/SignIn.jsp>Đăng nhập</a></div>
    <%
            }
        }
    %>
</section>
<script src="js/ChangePW.js"></script>
<script>
    if($('#res').text() === "Đổi mật khẩu thành công!") {
        setTimeout(function () {
            window.location.href = 'homePage';
        }, 2000);
    }
</script>
</body>
</html>