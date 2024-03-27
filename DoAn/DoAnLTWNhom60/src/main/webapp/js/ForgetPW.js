$(document).ready(function () {
    $('#signup-form').submit(function (event) {
        var user = $('#user_name').val();
        var email = $('#email').val();
        var condition = true;
        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (user === "") {
            $("#errUser").text('Vui lòng nhập tên đăng nhập!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        } else {
            $("#errUser").text('');

        }
        if (email === "") {
            $("#errEmail").text('Vui lòng nhập Email!');
            $('#errEmail')
            condition = false;
        } else if (!email.match(emailReg)) {
            $('#errEmail').text('Email không hợp lệ!');
            condition = false;
        }
        else{
            $("#errUser").text('');

        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
})