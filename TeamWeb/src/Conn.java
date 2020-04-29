import com.mysql.cj.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Conn
 */
@WebServlet("/Conn")
public class Conn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Conn() {
		super();
		// TODO Auto-generated constructor stub	
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
//		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		
		Connection dbCon = null;
		Statement stmt = null;
		String sDriver = "com.mysql.cj.jdbc.Driver";
		String user = "root";
		String password = "123456789";
		String url = "jdbc:mysql://localhost:8888/teamweb2020?serverTimezone=CST";
		//String url = "jdbc:mysql://localhost:8888/teamweb2020";
		// 驅動程式參數
		
		try // 載入JDBC driver
		{
			Class.forName(sDriver);
		} catch (Exception e) {
			out.println("無法載入驅動程式");
			return;
		}

		try // 建立資料連結和Statement物件
		{
			dbCon = DriverManager.getConnection(url, user, password);
			if (dbCon != null)
				out.println("mysql建立資料來源連結成功!");

			stmt = dbCon.createStatement();
			
			// stmt = (Statement)dbCon.createStatement();
			if (stmt != null)
				out.println("mysql建立Statement物件成功!");
		} catch (SQLException e) {
			out.println("與資料來源連結錯誤: ");
			out.println(e.getMessage());
			if (dbCon != null) {
				try {
					dbCon.close();
				} catch (SQLException e2) {
				}
			}
			return;
		} finally {
			try {
				stmt.close();
				dbCon.close();
			} catch (SQLException e) {
			}

		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
