package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.ConnUpdate;


@WebServlet("/doForgetPasswordRenewPwd")
public class Mem_forget_password_renew_pwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		//====
		String id=request.getParameter("enc");
		if(id!=null) {
			String pwd=request.getParameter("inputpwd");
			String sql="UPDATE TEAMWEB2020.MEMBER SET MEM_PWD ='"+pwd+"';";
			ConnUpdate connUp=new ConnUpdate();
			connUp.setSql(sql);
			if(connUp.getN()>0) {
				response.sendRedirect("login.jsp?msg=5");
			}else {
				out.print("出問題啦");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
