package Control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.ConnUpdate;


@WebServlet("/doUpdateImages")
public class UpdateImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// ===
		String doWhat = request.getParameter("updateBtn");
		if (doWhat.equals("刪除")) {
			int imgId = Integer.parseInt(request.getParameter("imgId"));
			String sql = String.format("UPDATE teamweb2020.product SET prod_view=0 WHERE prod_id = %d;", imgId);
			ConnUpdate connUp = new ConnUpdate();
			connUp.setSql(sql);
			response.sendRedirect("temp/admin_images.jsp");
		}else if(doWhat.equals("修改")) {
			int imgId = Integer.parseInt(request.getParameter("imgId"));
			String prodName = request.getParameter("prodName");
			String prodIntro = request.getParameter("prodIntro");
			String prodPrice = request.getParameter("prodPrice");
			String prodLeftNum = request.getParameter("prodLeftNum");
			String sql = String.format("UPDATE teamweb2020.product SET prod_name='%s',prod_introduction='%s',prod_price=%s,prod_size_stock=%s WHERE prod_id = %d;", prodName,prodIntro,prodPrice,prodLeftNum,imgId);
			ConnUpdate connUp = new ConnUpdate();
			connUp.setSql(sql);
			response.sendRedirect("temp/admin_images.jsp");
		}else {
			response.sendRedirect("temp/admin_images.jsp");
			}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
