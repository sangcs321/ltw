<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng kí</title>
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
    <link rel="stylesheet" href="css/SignUp.css">
</head>
<body>
<header class="hd">
    <div class="container-fluid bgcolor-orange" >
        <div class="container ">
            <div class="row ">
                <div class="col-md-9 col-sm-9 col-8 col-4 d-flex align-items-center  ">
                    <a class ="nav-link" href="homePage"> <img style="width: 150px" src="image/logoWeb.png">
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
<section class="signup mt-5">
    <div class="contain">
        <div class="signup-content">
            <%
                String userName = (String) request.getAttribute("userName");
                String password = (String) request.getAttribute("password");
                String name = (String) request.getAttribute("name");
                String phoneNumber = (String) request.getAttribute("phoneNumber");
                String email = (String) request.getAttribute("email");
                String gender = (String) request.getAttribute("gender");
                String birthDay = (String) request.getAttribute("birthDay");
                String address = (String) request.getAttribute("address");
                String addressReceive = (String) request.getAttribute("addressReceive");
                userName = (userName == null)? "": userName;
                password = (password == null)? "": password;
                name = (name == null)? "": name;
                phoneNumber = (phoneNumber == null)? "": phoneNumber;
                email = (email == null)? "": email;
                gender = (gender == null)? "": gender;
                birthDay = (birthDay == null)? "": birthDay;
                address = (address == null)? "": address;
                addressReceive = (addressReceive == null)? "": addressReceive;
                String errUserName = (String)request.getAttribute("errUserName");
                String errEmail = (String)request.getAttribute("errEmail");
                errUserName =(errUserName == null)?"":errUserName;
                errEmail =(errEmail == null)?"":errEmail;
            %>
            <form  id="signup-form" class="signup-form" action="registerAccount" method="POST">
                <h5>ĐĂNG KÍ</h5>
                <div class="form-SignUp">
                    <div class="title fw-bold">THÔNG TIN ĐĂNG NHẬP</div>
                    <div class="form-group">
                        <label>Tên đăng nhập<span class="text-danger">*</span></label><span class="text-danger" id="errUser"><%=errUserName%></span>
                        <input type="text" class="form-input" placeholder="Nhập tên đăng nhập" name="userName" id="userName" value ="<%=userName%>"/>
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu<span class="text-danger">*</span></label><span class="text-danger" id="errPW"></span>
                        <input type="password" class="form-input" placeholder="Nhập mật khẩu" name="password" id="password" value ="<%=password%>"/>
                    </div>
                    <div class="form-group">
                        <label for="rePassword">Nhập lại mật khẩu<span class="text-danger">*</span></label><span class="text-danger" id="errRePW"></span>
                        <input type="password" class="form-input" placeholder="Nhập lại mật khẩu" name="rePassword" id="rePassword" value ="<%=password%>"/>
                    </div>
                </div>
                <div class="form-info">
                    <div class="title fw-bold">THÔNG TIN KHÁCH HÀNG</div>
                    <div class="form-group">
                        <label>Họ Tên<span class="text-danger">*</span></label><span class="text-danger" id="errName"></span>
                        <input type="text" class="form-input" placeholder="Nhập họ và tên" name="name" id="name" value ="<%=name%>"/>
                    </div>

                    <div class="form-group">
                        <label for="phoneNumber">Số điện thoại<span class="text-danger">*</span></label><span class="text-danger" id="errTell"></span>
                        <input type="text" class="form-input" placeholder="Nhập số điện thoại" name="phoneNumber" id="phoneNumber" inputmode="numeric" value ="<%=phoneNumber%>"/>
                    </div>
                    <div class="form-group">
                        <label>Email<span class="text-danger">*</span></label><span class="text-danger" id="errEmail"><%=errEmail%></span>
                        <input type="text" class="form-input" placeholder="Nhập Email" name="email" id="email" value ="<%=email%>"/>
                    </div>
                    <div class="form-group">
                        <label>Giới tính<span class="text-danger">*</span></label>
                        <div id="gender">
                            <label for="male">Nam</label><input type="radio" id="male" name="gender" value="Nam" class="gender" checked >
                            <label for="female">Nữ</label> <input type="radio" id="female" name="gender" value="Nữ" class="gender" <%= (gender.equals("Nữ")) ? "checked" : "" %>>
                            <label for="other">Khác</label> <input type="radio" id="other" name="gender" value="Khác" class="gender" <%= (gender.equals("Khác")) ? "checked" : "" %>>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Ngày sinh<span class="text-danger">*</span></label><span class="text-danger" id="errDate"></span>
                        <input type="date" class="form-input" name="birthDay" id="birthDay" value ="<%=birthDay%>"/>
                    </div>
                    <div class="form-group">
                        <label for="address" >Địa chỉ<span class="text-danger">*</span></label><span class="text-danger" id="errAd"></span>
                        <input type="text" class="form-input" placeholder="Nhập địa chỉ của bạn" name="address" id="address" value ="<%=address%>"/>
                    </div>
                    <div class="form-group">
                        <label for="addressRecei" >Địa chỉ nhận hàng<span class="text-danger">*</span></label><span class="text-danger" id="errAdRecei"></span>
                        <input type="text" class="form-input" placeholder="Nhập địa chỉ của bạn" name="addressRecei" id="addressRecei" value ="<%=addressReceive%>"/>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" name="acp" id="acp" onclick="showBtnResgis()"><label for="acp" class="ps-2 text-color">Bạn đồng ý với các điều khoản của HomeDecor<span class="text-danger">*</span></label>
                    </div>
                </div>
                <div class="form-group" >
                    <button type="submit" id="confirm" style="display: none">XÁC NHẬN</button>
                </div>
            </form>
        </div>
    </div>
</section>
<script src="js/SignUp.js"></script>
</body>
</html>