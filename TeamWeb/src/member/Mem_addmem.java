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
		String email = request.getParameter("email");
		String passwd = request.getParameter("pw");
		
		String mem_chkcode="";//驗證信箱的驗證碼
		int mem_chkcode_len=6;//驗證碼長度
		String stuff="0123456789";//宇集合
		int stuff_len = stuff.length();//宇集長度 10
		for(int i=0;i<mem_chkcode_len;i++) {//跑5次randon
			int location=(int)(Math.random()*stuff_len);//產生隨機位置
			mem_chkcode+=stuff.substring(location, location+1);//取宇集中該位置
		}
		String sql = String.format("INSERT INTO teamweb2020.member(mem_name,mem_mail,mem_pwd,mem_chkcode) "
				+ "VALUE('%s','%s','%s','%s');",name, email, passwd,mem_chkcode);
		
		ConnUpdate connUp =new ConnUpdate();
		connUp.setSql(sql);
		int n=connUp.getN();
		if (n>=1) {
			SendMail sMail = new SendMail();
			sMail.setTo(email);
			sMail.setSubject("hi");
			sMail.setContent(name+"您好，感謝申請會員<br>"+"會員功能啟用通知<br>"+
			"請點選<a href='TeamWeb/'");
			sMail.execute();
			
		}
		
	}

}