package member;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.ConnQuery;
import shop.*;

@WebServlet("/logincheck")
public class Mem_login_check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String login_email = request.getParameter("login_email");
		String login_password = request.getParameter("login_password");
		String sql = String.format("SELECT * FROM teamweb2020.member WHERE mem_mail='%s' AND mem_pwd='%s' AND mem_level>0;", login_email,login_password);
		String url="";
		ConnQuery cn=new ConnQuery();
		cn.setSql(sql);
		int num = cn.getQuery_count();
		ResultSet rs = cn.getRs();
		try {
			rs.first();
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		if(num>=1) {
			int level=0;
			try {
				level=rs.getInt(5);
			} catch (SQLException e1) {
				System.out.println("rs問題");
			}
			if (level >= 2) {//註冊且驗證
				HttpSession session = request.getSession();
				Cart cart = new Cart();
				try {
					session.setAttribute("mem_id", rs.getInt(1));
					session.setAttribute("mem_name", rs.getString(2));
					session.setAttribute("mem_level", rs.getInt(5));
					session.setAttribute("cart", cart);
					url = "index.jsp";
					response.sendRedirect(url);
				} catch (SQLException e) {
					// session失敗
					out.print("Session設參數失敗");
					out.println(e.getMessage());
				}
			}else if(level==1){//有註冊但未驗證
				request.setAttribute("msg", "4");
				url = "/login";
				RequestDispatcher dispatcher=request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			}
		}else {//沒有找到的話
			request.setAttribute("msg", "1");
			url = "/login";
			RequestDispatcher dispatcher=request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
	}

}
