<%@page contentType="text/html; charset=utf-8"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.ArrayList,shop.Product" %>
<%
	//Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", -1);

	//Forces caches to obtain a new copy of the page from the origin server
	//response.setHeader("Cache-Control", "max-age=0");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate,max-age=0");

	//Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache");

	response.setHeader("Clear-Site-Data", "storage,cache,cookies");
	
	if(session.getAttribute("mem_level") != null){
		int mem_level = Integer.parseInt(session.getAttribute("mem_level").toString());
		if (mem_level != 9) {
			request.setAttribute("msg", "3");
			String url = "/login";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
	}else{
		request.setAttribute("msg", "2");
		String url = "/login";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
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
        .fileItem { width: 20%; /*height: 220px;*/ float: left; margin: 14px; padding: 5px; overflow:hidden;
          background-color: #F5F5F5; text-align: left; border: 1px dotted #BDBDBD; }
        .fileItem h3 { color: #FFF; background-color: #838383; font-size: 14px; text-align: left;
          margin: 0; padding: 3px; 
          white-space: nowrap; overflow: hidden; text-overflow: ellipsis;	-o-text-overflow: ellipsis; }
        .fileItem img {	display: block;	width: 100%; height: auto; margin: 0px auto; }
        .delImgBtn{ margin:5px 0; width:20%;	text-align:center; }
      	</style>

</head>
<body>
    <h1>商品上傳</h1>
<form method="post" action="admin_index.jsp"">
	<input type="submit" id="btnQuit" value="離開" style="float:right;font-family:DFKai-sb;width:5%;font-size:large;">
</form>
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


	<div class="imgContainer">
	</div>
	<!-- QueryProduct -->
	<jsp:useBean id="myBean" scope="page" class="shop.ProductDb"></jsp:useBean>
	<%ArrayList<Product> arrP = (ArrayList)myBean.getProducts();%>
	<%
		//vvv呈現圖片
		for(int i=myBean.getQuery_count()-1;i>=0;i--){//要改用Array[Qurery數量]
	%>
		<form name="updateForm<%=arrP.get(i).getProd_id()%>" method="get" action="/TeamWeb/doUpdateImages">
			<div class="fileItem" style="float:left;">
     	 		
       			<img src="uploadedIMG/<%=arrP.get(i).getProd_id()%>.jpg?sa=<%=(int)(Math.random()*10000)%>" width=200%;><br>
        		商品名稱:&nbsp;<input type="text" name="prodName" value=<%=arrP.get(i).getProd_name()%>><br>
        		商品介紹:&nbsp;<textarea name="prodIntro" style="height:100px;"><%=arrP.get(i).getProd_introduction()%></textarea><br>
        		商品價格:&nbsp;<input type="text" name="prodPrice" value=<%=arrP.get(i).getProd_price()%>><br>
        		庫存數量:&nbsp;<input type="text" name="prodLeftNum" value=<%=arrP.get(i).getProd_size_stock()%>><br>
        		<input type="hidden" name="imgId" value="<%=arrP.get(i).getProd_id()%>">
        		<input type="hidden" name=doWhat id="doWhat_<%=arrP.get(i).getProd_id()%>" value="<%=arrP.get(i).getProd_id()%>">
        		<input type="submit" name="updateBtn" value="修改"  style="width:70%">
        		<input type="submit" name="updateBtn" value="刪除"  class="delImgBtn">
      		</div>
      	</form>
      	
      	
	<%
		//^^^呈現圖片
		}
	%>
	    
    
</body>
</html>