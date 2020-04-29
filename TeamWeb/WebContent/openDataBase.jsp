<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
		//驅動程式參數

		Connection dbCon = null;
		Statement stmt = null;
		String sDriver = "com.mysql.cj.jdbc.Driver";
		String user = "root";
		String password = "123456789";
		String url = "jdbc:mysql://localhost:8888/teamweb2020?serverTimezone=CST";
		// 驅動程式參數
		out.println("<html><head><title>Conn</title></head>");
		out.println("<body>");
		try // 載入JDBC driver
		{
			Class.forName(sDriver);
		} catch (Exception e) {
			out.println("無法載入驅動程式");
			return;
		}

		try // 建立資料連結和Statement物件
		{
			dbCon = DriverManager.getConnection(url, user, password);
			if (dbCon != null)
				out.println("mysql建立資料來源連結成功!");

			stmt = dbCon.createStatement();
			// stmt = (Statement)dbCon.createStatement();
			if (stmt != null)
				out.println("mysql建立Statement物件成功!");
		} catch (SQLException e) {
			out.println("與資料來源連結錯誤: ");
			out.println(e.getMessage());
			if (dbCon != null) {
				try {
					dbCon.close();
				} catch (SQLException e2) {
				}
			}
			return;
		} finally {
			 try {
				stmt.close();
				dbCon.close();
			} catch (SQLException e) {
			} 

		}
	%>
</body>
</html>