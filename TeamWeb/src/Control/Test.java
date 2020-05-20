package Control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String mypath;
	
	@Override
//	public void init(ServletConfig config) throws ServletException {
//		   super.init(config);
//		   mypath=getServletContext().getRealPath("/");
//	}
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
//		out.print(this.getClass().getClassLoader().getResource("/").getPath());
		String mypath=request.getServletContext().getRealPath("/Control");
//		String mypath=request.getServletContext().getContextPath();
		out.print(mypath);
		
		
//		File currentDirFile = new File(".");
//		String helper = currentDirFile.getAbsolutePath();
//		String currentDir = helper.substring(0, helper.length() - currentDirFile.getCanonicalPath().length());
//		System.out.println(helper);
		
//		String mypath1=getServletContext().getInitParameter("myProjectLocation");
//		out.print(mypath1);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
