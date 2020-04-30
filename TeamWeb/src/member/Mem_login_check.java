package member;

import java.io.IOException;
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
/**
 * Servlet implementation class mem_login_check
 */
@WebServlet("/logincheck")
public class Mem_login_check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mem_login_check() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String sql = "SELECT * FROM teamweb2020.member WHERE mem_mail='login_email' AND mem_pwd='login_password' AND mem_level>1";
		String login_email = request.getParameter("inputEmail1");
		String login_password = request.getParameter("inputPassword1");
		String url="";
		
		ConnQuery cn=new ConnQuery();
		cn.setSql(sql);
		int num = cn.getQuery_count();
		ResultSet rs = cn.getRs();
		if(num>=1) {
			HttpSession session = request.getSession();
			try {
				session.setAttribute("mem_id", rs.getInt(1));
				session.setAttribute("mem_name", rs.getString(2));
				session.setAttribute("mem_level", rs.getInt(5));
				url = "../index.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//session失敗
				e.printStackTrace();
			}
		}else {
			request.setAttribute("msg", "1");
			url = "/login";
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("/login");
		dispatcher.forward(request, response);
	}

}
