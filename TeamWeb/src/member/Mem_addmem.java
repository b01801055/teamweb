package member;
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
public class Mem_addmem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/mtml;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String account = request.getParameter("account");
		String email = request.getParameter("email");
		String passwd = request.getParameter("pw");
		
		String sql = String.format("INSERT INTO teamweb2020.member(mem_name,mem_mail,mem_pwd) VALUE('%s','%s','%s');",name, email, passwd);
		
		String mem_chkcode="";
		int mem_chkcode_len=6;
		String stuff="0123456789";
		int stuff_len = stuff.length()-1;
		for(int i=0;i<mem_chkcode_len;i++) {
//			mem_chkcode+=stuff.substring(Math.random(), 1);
		}
		
		ConnUpdate connUp =new ConnUpdate();
		connUp.setSql(sql);
		int n=connUp.getN();
		if (n>=1) {
			SendMail sMail = new SendMail();
			
		}
		
	}

}