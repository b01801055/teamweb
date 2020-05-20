package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.ConnQuery;
import conn.ConnUpdate;


@WebServlet("/doForgetPasswordRenewPwd")
public class Mem_forget_password_renew_pwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		//====
		String email=request.getParameter("email");
		String sql="SELECT * FROM TEAMWEB2020.MEMBER WHERE mem_mail='"+email+"';";
		ConnQuery connQry=new ConnQuery();
		connQry.setSql(sql);
		//====
		try {
			if (connQry.getQuery_count() > 0) {
				ResultSet rs = connQry.getRs();
				rs.first();
				//===
				String id = String.valueOf(rs.getInt(1));
				int encDB = Integer.parseInt((rs.getString(6)));
				int encPara = Integer.parseInt(request.getParameter("enc"));
				if (encPara==encDB) {
					String pwd = request.getParameter("inputpwd");
					sql = String.format("UPDATE TEAMWEB2020.MEMBER SET mem_pwd = '%s' WHERE mem_id = %s;",pwd,id);
					ConnUpdate connUp = new ConnUpdate();
					connUp.setSql(sql);
					if (connUp.getN() > 0) {
						response.sendRedirect("login.jsp?msg=5");
					} else {
						out.print("出問題啦1");
					}
				}else {out.print("出問題啦2");}
			} else {
				out.print("出問題啦3");
			}
		} catch (SQLException e) {
			System.out.print(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
