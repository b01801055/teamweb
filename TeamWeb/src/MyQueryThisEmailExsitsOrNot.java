import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.ConnQuery;


@WebServlet("/doQueryEmail")
public class MyQueryThisEmailExsitsOrNot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//vvv基本設定
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/mtml;charset=utf-8");
		PrintWriter out = response.getWriter();
		//^^^基本設定
		
		//vvv Field
		String email = request.getParameter("email");
		//^^^ Field
		
		//vvv sql
		String sql = String.format("SELECT * FROM teamweb2020.member WHERE mem_mail = '%s'",email);
//		out.print(name + account + email + passwd);//測試用
//		out.print(sql);//測試用
		//^^^ sql
		
		/// vvv Driver Connect Statement excuteQuery() 
		ConnQuery connQry =new ConnQuery();
		connQry.setSql(sql);
		int n=connQry.getQuery_count();
		out.print(n);//傳回有查到幾條一樣的email  不是0 就是1 或者可能null(發生Exception的話)
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}