package Control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import conn.ConnQuery;
import conn.ConnUpdate;

@MultipartConfig
@WebServlet("/doUploadProducts")
public class UploadProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		request.setCharacterEncoding("utf-8");
    		response.setContentType("text/html;charset=utf-8");
    		PrintWriter out = response.getWriter();
    		//===
    		response.setHeader("Pragma", "no-cache");
    		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    		response.setDateHeader("Expires", -1);
    		//====
    		String name=request.getParameter("productName");
    		int leftNum=Integer.parseInt(request.getParameter("productLeftNum"));
    		int price=Integer.parseInt(request.getParameter("productPrice"));
    		String intro=request.getParameter("productIntro");
    		Part img=request.getPart("imgFile");
    		String imgOldName=img.getSubmittedFileName();
    		String mypath=getServletContext().getInitParameter("myProjectLocation");
    		String tmppath=request.getServletContext().getRealPath("/");
    		//===
    		int imgId=1;
    		//===
    		String imgNewName;
    		//===DB Update
    			String sql=String.format("INSERT INTO teamweb2020.product(prod_name,prod_price,prod_introduction,prod_size_stock,prod_img,prod_view) VALUE('%s',%d,'%s',%d,'%s',1)",name,price,intro,leftNum,mypath);
    			ConnUpdate connUp= new ConnUpdate();
    			connUp.setSql(sql);
    		//===DB_Query
        		ConnQuery connQry=new ConnQuery();
        		connQry.setSql("Select * from teamweb2020.product;");
        		ResultSet rs = connQry.getRs();
        		try {
					rs.last();
					imgId=rs.getInt(1);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
        		imgNewName=String.valueOf(imgId);
    		//===
    		out.print("商品名稱: "+name+"<br>");
    		out.print("庫存數量: "+leftNum+"<br>");
    		out.print("商品價格: "+price+"<br>");
    		out.print("商品簡介: "+intro+"<br>");
    		out.print("圖片檔名: "+imgOldName+"<br>");
    		//===
    		try {
    			InputStream is=img.getInputStream();
    			//OutputStream os=new FileOutputStream(mypath+"\\WebContent\\uploadedIMG\\"+imgNewName+".jpg");
    			OutputStream os=new FileOutputStream(mypath+"\\uploadedIMG\\"+imgNewName+".jpg");
    			OutputStream ostmp=new FileOutputStream(tmppath+"\\uploadedIMG\\"+imgNewName+".jpg");
    			byte [] byteArr=new byte[(int) img.getSize()];
    			is.read(byteArr);
    			os.write(byteArr);
    			is.close();
    			os.close();
    			//===
    			ostmp.write(byteArr);
    			ostmp.close();
    		}catch(Exception e) {out.print(e);}
    		response.sendRedirect("admin_images.jsp");
    	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
