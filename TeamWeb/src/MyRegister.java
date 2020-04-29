import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/doRegister")
public class MyRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/mtml;charset=utf-8");
		PrintWriter out = response.getWriter();
		//inputLnam			姓名
		//account			帳號
		//input_email		Email
		//inputPassword1	密碼
		//inputPassword2	確認密碼
		String name = request.getParameter("name");
		String account = request.getParameter("account");
		String email = request.getParameter("email");
		String passwd = request.getParameter("pw");
//		out.print(name + account + email + passwd);
		String sql = "";
//		sql+="CREATE DATABASE IF NOT EXISTS teamweb2020 CHARACTER SET UTF8 COLLATE UTF8_BIN;";
//		sql+="CREATE TABLE IF NOT EXISTS teamweb2020.ACCOUNT(NAME VARCHAR(14) NOT NULL, ACCOUNT CHAR(10) NOT NULL, EMAIL VARCHAR(14) NOT NULL UNIQUE KEY, PASSWD CHAR(10) NOT NULL, PRIMARY KEY (ACCOUNT) );";
		sql += String.format("INSERT INTO teamweb2020.account(name,account,email,passwd) VALUE('%s','%s','%s','%s');",
				name, account, email, passwd);
		out.print(sql);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			out.print("找不到驅動");
		}
		try {
			String url = "jdbc:mysql://localhost:8888/teamweb2020?serverTimezone=CST&useSSL=false";
			String user = "root";
			String password = "1234";
			Connection cnct = null;
			Statement stmt = null;
			try {
				cnct = DriverManager.getConnection(url, user, password);
			} catch (Exception e) {
				out.print("Connection問題");
			}

			try {
				stmt = cnct.createStatement();
			} catch (Exception e) {
				out.print("Statment問題");
			}

			try {
				stmt.executeUpdate(sql);
				out.print("加入完成");
			} catch (Exception e) {
				out.print("ResultSet問題");
			}
		} catch (Exception e) {
			out.print("整體問題");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}