$(document).ready(function () {
    $('#signup-form').submit(function (event) {
        var user = $('#userName').val();
        var password = $('#password').val();
        var rePW = $('#rePassword').val();
        var name = $('#name').val();
        var tell = $('#phoneNumber').val();
        var email = $('#email').val();
        var date = $('#birthDay').val();
        var address = $('#address').val();
        var addressReceive = $('#addressRecei').val();
        var condition = true;
        var passwordRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&*()-+])(?=.*[0-9]).{8,}$/;
        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var tellReg = /^\d{10}$/;
        var specialCharacters = /[!@#$%^&*(),.?":{}|<>' -]/;
        if (user === "") {
            $("#errUser").text('Vui lòng nhập tên đăng nhập!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        } else if (user.match(specialCharacters)) {
            $("#errUser").text('Tên đăng nhập không được chứa kí tự đặc biệt!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errUser").text('');
        }
        if(password===""){
            $("#errPW").text('Vui lòng nhập mật khẩu!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        }else if(password.length < 6 || password.length > 50){
            $("#errPW").text('Mật khẩu dài từ 6 đến 50 ký tự!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        }else if(!password.match(passwordRegex)){
            $("#errPW").text('Mật khẩu có ít nhất 1 chữ hoa, 1 ký tự đặc biệt và 1 số!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        }else {
            $("#errPW").text('');
        }
        if(rePW === ""){
            $("#errRePW").text('Vui lòng nhập lại mật khẩu!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        }else if(rePW !==password){
            $("#errRePW").text('Mật khẩu nhập lại không đúng!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errRePW").text('');
        }
        if(name==="") {
            $("#errName").text('Vui lòng nhập tên!');
            $('#errName').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errName").text('');
        }
        if(tell===""){
            $("#errTell").text('Vui lòng nhập số điện thoại!');
            $('#errTell').attr('style', 'color:red');
            condition = false;
        }else if(!tell.match(tellReg)){
            $("#errTell").text('Số điện thoại không hợp lệ!');
            $('#errTell').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errTell").text('');
        }
        if(email===""){
            $("#errEmail").text('Vui lòng nhập Email!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        }else if(!email.match(emailReg)){
            $("#errEmail").text('Email không hợp lệ!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errEmail").text('');
        }
        if(date===""){
            $("#errDate").text('Vui lòng nhập ngày sinh!');
            $('#errDate').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errDate").text('');
        }
        if(address===""){
            $("#errAd").text('Vui lòng nhập địa chỉ!');
            $('#errAd').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errAd").text('');
        }
        if(addressReceive===""){
            $("#errAdRecei").text('Vui lòng nhập địa chỉ nhận hàng!');
            $('#errAdRecei').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errAdRecei").text('');
        }
        var acp = $("#acp");
        if (!acp.is(":checked")) {
            condition = false;
        }else{
            $("#errAcp").text('');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();
    })
});

function showBtnResgis() {
    var acp = document.getElementById("acp");
    var cf = document.getElementById("confirm");
    if(acp.checked) {
        cf.style.display = 'block';
    }else {
        cf.style.display = 'none';
    }
}