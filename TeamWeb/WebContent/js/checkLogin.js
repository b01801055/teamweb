var email;
var password;
function check_data(){
    email = document.loginFrm.login_email.value;
    password = document.loginFrm.login_password.value;
//    var re_email=/\w+@\w+\.\w+(\.\w+)*/;
//	var re_pw=/(^.*[a-z].*[A-Z].*$)|(^.*[A-Z].*[a-z].*$)/;
//	if(!re_email.test(email))
//		alert("email無效");
//	else if(!re_pw.test(password))
//        alert("密碼不正確");
//    else{
//        document.loginFrm.submit();
//    }
    document.loginFrm.submit();
}

