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

import conn.ConnUpdate;


@WebServlet("/doRegister")
public class MyRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//vvv基本設定
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/mtml;charset=utf-8");
		PrintWriter out = response.getWriter();
		//^^^基本設定
		
		//vvv Field
		String name = request.getParameter("inputLnam");
//		String account = request.getParameter("account");
		String email = request.getParameter("input_email");
		String passwd = request.getParameter("inputPassword1");
		//^^^ Field
		
		String sql = String.format("INSERT INTO teamweb2020.member(mem_name,mem_email,mem_pwd) VALUE('%s','%s','%s);",name, email, passwd);
		
//		out.print(name + account + email + passwd);//測試用
//		out.print(sql);//測試用
		
		ConnUpdate connUp =new ConnUpdate();
		connUp.setSql(sql);
		connUp.excute();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}