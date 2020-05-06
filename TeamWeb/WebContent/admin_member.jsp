<%@page contentType="text/html; charset=utf-8"%>
<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="cn" scope="request" class="conn.ConnQuery"></jsp:useBean>
<jsp:setProperty property="sql" name="cn" value="SELECT * FROM teamweb2020.member ORDER BY mem_id ASC"/>
<jsp:useBean id="connUp" scope="request" class="conn.ConnUpdate"></jsp:useBean>
<jsp:setProperty property="sql" name="connUp" value="UPDATE teamweb2020.member SET mem_level=$mem_level WHERE mem_id = $mem_id"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootshop online Shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/layout.css">
</head>
<body>
	<h1>會員管理</h1>
<p class="w3-center">會員總人數：人</p>

<div class="w3-row w3-gray textCenter">
  <div class="w3-col m3">會員[id]名稱</div>
  <div class="w3-col m4">會員帳號</div>
  <div class="w3-col m4">會員權限等級</div>
  <div class="w3-col m1">刪除</div>
</div>

<%-- <?php
while( $row_RS_mem = mysqli_fetch_assoc($RS_mem) )
{
?> --%>

<div class="w3-row w3-border-bottom textCenter">
  <div class="w3-col m3 textLeft overflowH">
    <%-- [<?php echo $row_RS_mem['mem_id']; ?>] <?php echo $row_RS_mem['mem_name']; ?> --%>
	<%-- <jsp:getProperty property="query_count" name="cn"/> --%>
	<% out.print(query_count); %>
  </div>
  <div class="w3-col m4 textLeft overflowH">
    <%-- <?php echo $row_RS_mem['mem_mail']; ?> --%>
    <jsp:getProperty property="n" name="connUp"/>
  </div>
  <div class="w3-col m4">
   
    <form name="update_mem_level_form" method="post" action="">
      <%-- <?php echo $row_RS_mem['mem_level']; ?> --%>
      <select name="mem_level">
        <option value="1" >1: 申請未驗證</option>
        <option value="2" >2: 一般會員</option>
        <option value="9" >9: 系統管理者</option>
      </select>
      <input type="submit" value="確定更新">
      <input type="hidden" name="mem_id" value="<?php echo $row_RS_mem['mem_id']; ?>">
    </form>

  </div>
  <div class="w3-col m1 w3-center">
    <a class="deleData" href="#">刪除</a>
  </div>
</div>

<%-- <?php
}
?> --%>

</body>
</html>