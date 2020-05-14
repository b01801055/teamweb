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

<form name="imgUpload" id="imgUpload" enctype="multipart/form-data" method="post" action="/TeamWeb/doUploadGoods">
商品名稱<input type="text" name="goodName"  style="width:100px; color:#000;" required><br>
庫存數量<input type="num" name="goodLeftNum" style="width:100px; color:#000;" required><br>
商品價格<input type="text" name="goodPrice" style="width:100px; color:#000;" required><br>
商品簡介<input type="text" name="goodIntro" style="width:100px; color:#000;" required><br>
   選擇要上傳的影像：
  <input type="file" name="imgFile" id="imgFile" style="width:400px; color:#000;" required>
  <input type="submit" id="btnSubmit" value="確定上傳">
  <span style="color:red; font-size:12px;"> (上傳的檔案名稱請符合英數字及減號或底線....) </span>
</form>

	<div class="imgContainer">
	<%
		//vvv DB
		String sql="SELECT * FROM TEAMWEB2020.PRODUCT;";
		ConnQuery connQry=new ConnQuery();
		connQry.setSql(sql);
		int queryCount=connQry.getQuery_count();
		ResultSet rs=connQry.getRs();
		int[] arr=new int[queryCount];
		for(int i=0;i<queryCount;i++){
			arr[i]=rs.getInt(1);
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
		<div class="fileItem<%=i%>">
     	 	<h3><?php echo $fileName; ?></h3>
     		<h3>${name}</h3>
       		<img src="../uploadedIMG/<%=arr[i]%>.jpg?sa=<%=(int)(Math.random()*100)%>" width=250;>
        	<input type="button" class="delImgBtn" value="刪除影像" title="<?php echo $file; ?>">
      	</div>
	<%
		}
		//^^^呈現圖片
	%>
    	
      <?php
      ?>
    
    </div>
</body>
</html>

<script src="../js/jquery-1.8.3.min.js"></script>
<script>
  $('.delImgBtn').click(function(){
    var $file = $(this).attr('title');  console.log($file);

    if( confirm('確定刪除？') ){
      $.ajax({
        url:'admin_images_delete.php'
        ,type:'post'
        ,data:{ file: $file }
      }).done(function(msg){
        if(msg==1){ window.location.reload(); }
      });
    }
  });
</script>