<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" scope="session" class=shop.Cart />

<% 
	String strProd_id = request.getParameter("prod_id");
	if(strProd_id == null || strProd_id.equals("")){
		response.sendRedirect("index.jsp");
		return;
	}else{
		cart.deleteItem(Integer.valueOf(strProd_id));
		response.sendRedirect("showcart.jsp");
	}
%>