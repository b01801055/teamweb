package Control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/doUploadGoods")
public class UploadGood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		request.setCharacterEncoding("utf-8");
    		response.setContentType("text/html;charset=utf-8");
    		PrintWriter out = response.getWriter();
    		//====
    		String name=request.getParameter("goodName");
    		int leftNum=Integer.parseInt(request.getParameter("goodLeftNum"));
    		String price=request.getParameter("goodPrice");
    		String intro=request.getParameter("goodIntro");
    		Part img=request.getPart("imgFile");
    		String imgName=img.getSubmittedFileName();
    		//===
    		out.print("商品名稱: "+name+"<br>");
    		out.print("庫存數量: "+leftNum+"<br>");
    		out.print("商品價格: "+price+"<br>");
    		out.print("商品簡介: "+intro+"<br>");
    		out.print("圖片檔名: "+imgName+"<br>");
    		//===
    		String mypath=request.getServletContext().getRealPath("/");
    		try {
    		InputStream is=img.getInputStream();
    		OutputStream os=new FileOutputStream(mypath+"\\uploaded\\"+img.getSubmittedFileName());
    		byte [] byteArr=new byte[(int) img.getSize()];
    		is.read(byteArr);
    		os.write(byteArr);
    		is.close();
    		os.close();
    		}catch(Exception e) {out.print(e);}
    	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
