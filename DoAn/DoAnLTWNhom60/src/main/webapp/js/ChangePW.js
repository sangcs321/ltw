
$(document).ready(function (){
    $('#signup-form').submit(function (event){
        var password =$('#password').val();
        var newpassword =$('#new_password').val();
        var repassword =$('#re_password').val();
        var passwordRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&*()-+])(?=.*[0-9]).{8,}$/;
        var condition=true;
        if(password ===""){
            $("#errPW").text('Vui lòng nhập mật khẩu hiện tại');
            $('#errPW').attr('style','color:red');
            condition=false;
        }else{
            $("#errPW").text('');

        }
        if(newpassword===""){
            $("#errNPW").text('Vui lòng nhập mật khẩu mới');
            $('#errNPW').attr('style','color:red');
            condition=false;
        }else if(!newpassword.match(passwordRegex)){
            $("#errNPW").text('Mật khẩu có ít nhất 1 chữ hoa, 1 ký tự đặc biệt và 1 số!');
            $('#errNPW').attr('style', 'color:red');
            condition = false;
        }
        else if(newpassword===password){
            $("#errNPW").text('Mật khẩu mới trùng với mật khẩu hiện tại');
            $('#errNPW').attr('style','color:red');
            condition=false;
        } else{
            $("#errPW").text('');

        }
        if(repassword===""){
            $("#errReNPW").text('Vui lòng nhập lại mật khẩu mới');
            $('#errReNPW').attr('style','color:red');
            condition=false;
        } else if(repassword!==newpassword){
            $("#errReNPW").text('Mật khẩu mới không chính xác');
            $('#errReNPW').attr('style','color:red');
            condition=false;
        }
        else{
            $("#errReNPW").text('');

        }
        if(condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
})
