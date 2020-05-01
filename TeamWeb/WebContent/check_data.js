var name;
var account;
var email;
var pw1;
var pw2;
function check_Data()
  {
	name = document.getElementById("inputLnam").value;
	account = document.getElementById("account").value;
	email = document.getElementById("input_email").value;
	pw1 = document.getElementById("inputPassword1").value;
	pw2 = document.getElementById("inputPassword2").value;
	var re_name=/..+/;
	var re_account=/\w{5,}/;
	var re_email=/\w+@\w+\.\w+(\.\w+)*/;
	var re_pw=/(^.*[a-z].*[A-Z].*$)|(^.*[A-Z].*[a-z].*$)/;
	if(!re_name.test(name))
		alert("姓名需填寫");
	else if(!re_account.test(account))
		alert("帳號需填寫，5字以上");
	else if(!re_email.test(email))
		alert("email無效");
	else if(!(re_pw.test(pw1)&(re_pw.test(pw2)&pw1==pw2)))
		alert("密碼不正確");
	else
		//document.registForm.submit();
		queryEmail();
}

function queryEmail(){
	var xmlhttp;//創立一個空物件 等著被用來製作成XMLHttpRequest的實體物件 (這物件之後會把Request包起來 傳出去 到時候收到的回應也會被包進物件裡面)
	if(window.ActiveXObject)//判斷瀏覽器如果是用這種類別傳送 那就建立這種類別的物件 這邊是IE6版以前用的類別
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	else if(window.XMLHttpRequest)//其他基本上都是這個類別
		xmlhttp = new XMLHttpRequest();
	try{
		xmlhttp.open("POST","http://localhost:8080/TeamWeb/doQueryEmail",true);//指定傳送時的參數　方式、指定Sevlet的url、是否允許請求非同步(沒特別需求都是開true)
		xmlhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');//設定Request的Header
		xmlhttp.onreadystatechange=function readyGo(){//收到東西就執行以下函式內容
		  if(xmlhttp.readyState==4 && xmlhttp.status==200){//確定都收到才執行以下貼上動作 先判斷網路連線狀態是否連線已經都已經完成 4是Complete代表已收到全部資料 200就是平常網頁打不開時顯示404、500的那個數字 正常會是200
			var n = parseInt(xmlhttp.responseText);//收到的資料會存在xmlhttp物件裡面 .response可以得出來 確定是文字的話可用.responseText
			if(n>0)
				alert("email已被註冊");
			else if(n==0)
				document.registForm.submit();
		}
	}
		xmlhttp.send("email="+email);//上面都是設定 這行才真正執行 如果是用GET 參數應該是加在網址後面，但因為我是用POST 參數要放在這裡面
	}catch(e){alert("與伺服器連線出了問題");}
	
}