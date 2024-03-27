<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Xác thực tài khoản</title>
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
<header class = "hd">
    <div class="container-fluid bgcolor-orange">
        <div class="container ">
            <div class="row ">
                <div class="col-md-9 col-sm-9 col-8 col-4 d-flex align-items-center  ">
                    <a class="nav-link" href="#"> <img style="width: 150px" src="image/logoWeb.png">
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-4 py-3 px-0 d-flex align-items-center justify-content-end">
                    <ul class="d-flex m-0 list-unstyled justify-content-end">
                        <li class="px-3 pt-1"><a class="nav-link active" aria-current="page" href="#"><i
                                class="fa fa-phone" aria-hidden="true"></i></a></li>
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
    <%String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
      String email =(String)request.getAttribute("email");
      String err =(String)request.getAttribute("errCode");
      email = (email == null)?" ": email;
      err = (err == null)?" ": err;%>
    <div class="contain">
        <div class="signup-content">
            <form id="verify-form" class="signup-form" action="<%=url%>/verifyAccount" method ="post" onsubmit="return verifyAccount()">
                <div class="text-end pe-4">
                    <%Object obj = session.getAttribute("account");%>
                    <a class="text-decoration-none" href="<%=url%>/<%=(obj==null)?"SignIn.jsp":"homePage"%>">Bỏ qua</a>
                </div>
                <img src="images/verify.jpg" alt="" width="400px">
                <h5>Xác thực tài khoản của bạn</h5>
                <div class="verify">
                    <p class="text-group" style="margin-bottom: 0">Chúng tôi đã gửi mã xác thực đến <span class="text-primary" id="email"><%=email%></span></p>
                    <input type="text" name="email" value ="<%=email%>"class="d-none">
                    <p class="">Vui lòng nhập mã để xác thực tài khoản của bạn</p>
                    <p class="mb-0">Mã xác thực chỉ có hiệu lực trong vòng 10 phút</p>
                    <div class="form-group text-center">
                        <span class="text-danger" id="errVerify"><%=err%></span>
                        <input type="text" class="form-input" placeholder="Nhập mã xác thực ở đây" name="verify" id="verify"/>
                    </div>
                    <p class="text-group"><a href="<%=url%>/reVerifyCode?email=<%=email%>">Nhấn vào đây</a> để nhận lại mã xác thực</p>
                </div>
                <div class="form-group">
                    <button type="submit" id="confirm" >XÁC NHẬN</button>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    function verifyAccount() {
        var verifyVal = document.getElementById("verify");
        var error = document.getElementById("errVerify");
        var flag = true;
        if(verifyVal.value == "") {
            flag = false;
            error.innerHTML = '(*)Vui lòng nhập mã xác thực!';
        }
        return flag;
    }
</script>
</body>
</html>