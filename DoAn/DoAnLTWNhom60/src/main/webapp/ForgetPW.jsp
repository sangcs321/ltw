<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
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
    String done = (String)request.getAttribute("done");
    if(done!=null){
%>
<div class="container p-0 mgt text-center fw-bold">Mật khẩu mới của bạn đã được gửi về Mail!<a href = <%=url%>/SignIn.jsp>Đăng nhập</a></div>

<%
}else{
%>
<section class="signup mt-5">
    <!-- <img src="images/signup-bg.jpg" alt=""> -->
    <div class="contain">
        <div class="signup-content">
            <form  id="signup-form" class="signup-form" method="post" action="forgetPassword">
                <%
                    String username = (String)request.getAttribute("user_name");
                    username =(username == null)?"":username;
                    String email = (String)request.getAttribute("email");
                    email =(email == null)?"":email;
                    String errUserName = (String)request.getAttribute("errUserName");
                    errUserName =(errUserName == null)?"":errUserName;
                    String errEmail = (String)request.getAttribute("errEmail");
                    errEmail =(errEmail == null)?"":errEmail;
                %>
                <h5>QUÊN MẬT KHẨU</h5>
                <div class="form-SignUp">
                    <div class="form-group">
                        <label>Tên đăng nhập<span class="text-danger">*</span></label><span class="text-danger" id="errUser"><%=errUserName%></span>
                        <input type="text" class="form-input" placeholder="Nhập tên đăng nhập" name="user_name"
                               id="user_name" value="<%=username%>"/>
                    </div>
                    <div class="form-group">
                        <label>Email<span class="text-danger">*</span></label><span class="text-danger" id="errEmail"><%=errEmail%></span>
                        <input type="text" class="form-input" placeholder="Nhập Email" name="email" id="email" value="<%=email%>"/>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit">
                        XÁC NHẬN
                    </button>
                </div>
            </form>
        </div>
    </div>
</section>
<%
    }
%>
<script src="js/ForgetPW.js"></script>
</body>
</html>