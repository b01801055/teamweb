package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mem_login
 */
@WebServlet("/login")
public class Mem_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mem_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String msg=(String)request.getAttribute("msg");
		String url="login.jsp";
		PrintWriter out= response.getWriter();
		
		if (msg.equals("1")) {
			out.println("<h1>==== 輸入的帳號或密碼有誤，請重新登入！ ====</h1>");
			response.sendRedirect(url);
		}
		if (msg.equals("2")) {
			out.println("<h1>==== 請先登入會員再進入！ ====</h1>");
			response.sendRedirect(url);
		}
		if (msg.equals("3")) {
			out.println("<h1>==== 非管理者不能進入管理介面！ ====</h1>");
			response.sendRedirect(url);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
