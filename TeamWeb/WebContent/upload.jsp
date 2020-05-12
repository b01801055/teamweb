<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name=FormUp method="post" action="/TeamWeb/doUploadGoods" enctype='multipart/form-data'><br>
    商品名稱<input type="text" name="goodName"><br>
    庫存數量<input type="text" name="goodLeftNum"><br>
    選取圖片<input type="file" name="imgFile">
    <input type="submit">
</form>
</body>
</html>