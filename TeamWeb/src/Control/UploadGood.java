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
    		String imgOldName=img.getSubmittedFileName();
    		String mypath=getServletContext().getInitParameter("myProjectLocation");
    		String tmppath=request.getServletContext().getRealPath("/");
    		//===
    		int imgId=1;
    		int imgHowMany=10;
    		//===
    		String imgNewName=String.valueOf(imgId);
    		//===
    		out.print("商品名稱: "+name+"<br>");
    		out.print("庫存數量: "+leftNum+"<br>");
    		out.print("商品價格: "+price+"<br>");
    		out.print("商品簡介: "+intro+"<br>");
    		out.print("圖片檔名: "+imgOldName+"<br>");
    		//===
    		try {
    			InputStream is=img.getInputStream();
    			OutputStream os=new FileOutputStream(mypath+"\\WebContent\\uploadedIMG\\"+imgNewName+".jpg");
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
    		response.sendRedirect("temp/admin_images.jsp?imgHowMany="+imgHowMany);
    	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
