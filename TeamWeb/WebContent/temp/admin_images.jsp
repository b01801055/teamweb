<%@page contentType="text/html; charset=utf-8"%>
<%@page pageEncoding="utf-8"%>
<%@page import="conn.ConnQuery,java.sql.ResultSet" %>
<%
	//Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", -1);

	//Forces caches to obtain a new copy of the page from the origin server
	//response.setHeader("Cache-Control", "max-age=0");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate,max-age=0");

	//Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache");

	response.setHeader("Clear-Site-Data", "storage,cache,cookies");
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<!--
  	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
  	-->
<title>Document</title>
    <style type="text/css">
        #imgUpload { background-color: #DDD; padding: 5px 15px; font-size: 15px; }
        #imgFile { color: #FFF; background-color: #FFF; padding: 3px;
          border: 1px solid #BBB; border-radius:5px;}
        #imgUpload input { vertical-align: middle; }
      
        .imgContainer { display: flex; flex-wrap: wrap; justify-content: center; }
        .fileItem { width: 150px; /*height: 220px;*/ float: left; margin: 14px; padding: 5px; overflow:hidden;
          background-color: #F5F5F5; text-align: center; border: 1px dotted #BDBDBD; }
        .fileItem h3 { color: #FFF; background-color: #838383; font-size: 14px; text-align: left;
          margin: 0; padding: 3px; 
          white-space: nowrap; overflow: hidden; text-overflow: ellipsis;	-o-text-overflow: ellipsis; }
        .fileItem img {	display: block;	width: 140px; height: auto; margin: 0px auto; }
        .delImgBtn{ margin:5px 0; width:100%;	text-align:center; }
      	</style>

</head>
<body>
    <h1>商品上傳</h1>

<form name="imgUpload" id="imgUpload" enctype="multipart/form-data" method="post" action="/TeamWeb/doUploadProducts">
商品名稱<input type="text" name="productName"  style="width:100px; color:#000;" required><br>
庫存數量<input type="num" name="productLeftNum" style="width:100px; color:#000;" required><br>
商品價格<input type="text" name="productPrice" style="width:100px; color:#000;" required><br>
商品簡介<input type="text" name="productIntro" style="width:100px; color:#000;" required><br>
   選擇要上傳的影像：
  <input type="file" name="imgFile" id="imgFile" style="width:400px; color:#000;" required>
  <input type="submit" id="btnSubmit" value="確定上傳">
  <span style="color:red; font-size:12px;"> (上傳的檔案名稱請符合英數字及減號或底線....) </span>
</form>

<form method="post" action=""></form>
	<div class="imgContainer">
	<%
		//vvv DB
		String sql="SELECT * FROM TEAMWEB2020.PRODUCT WHERE prod_view=1;";
		ConnQuery connQry=new ConnQuery();
		connQry.setSql(sql);
		int queryCount=connQry.getQuery_count();
		ResultSet rs=connQry.getRs();
		int[][] intArr=new int[queryCount][3];
		String[][] strArr=new String[queryCount][2];
		for(int i=0;i<queryCount;i++){
			intArr[i][0]=rs.getInt(1);//id
			intArr[i][1]=rs.getInt(3);//price
			intArr[i][2]=rs.getInt(5);//leftNum
			strArr[i][0]=rs.getString(2);//name
			strArr[i][1]=rs.getString(4);//intro
			rs.next();
		}
		rs.first();
		//^^^
	%>	
	<%
		//vvv呈現圖片
		int imgHowMany=queryCount;//Query數量
		for(int i=imgHowMany-1;i>=0;i--){//要改用Array[Qurery數量]
	%>
		<form method="post" action="/TeamWeb/doDelImages">
			<div class="fileItem<%=i%>">
     	 		<h3><?php echo $fileName; ?></h3>
     			<h3>${name}</h3>
       			<img src="../uploadedIMG/<%=intArr[i][0]%>.jpg?sa=<%=(int)(Math.random()*10000)%>" width=350;><br>
        		<input type="hidden" name="imgId" value="<%=intArr[i][0]%>">
        		商品名稱:&nbsp;<%=strArr[i][0]%><br>
        		商品介紹:&nbsp;<%=strArr[i][1]%><br>
        		商品價格:&nbsp;<%=intArr[i][1]%><br>
        		庫存數量:&nbsp;<%=intArr[i][2]%><br>
        		<input type="submit" class="delImgBtn<%=i%>" value="刪除影像" style="width:350px">
      		</div>
      	</form>
      	
      	
	<%
		//^^^呈現圖片
		}
	%>
	    
    </div>
</body>
</html>