package prod;

import java.awt.List;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.util.*;

/**
 * Servlet implementation class UploadImages
 */
@WebServlet("/upimg")
public class UploadImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImages() {
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
		response.setCharacterEncoding("text/html;charset=utf-8");
		
		DiskFileItemFactory itemFactory = new DiskFileItemFactory();
		itemFactory.setSizeThreshold(0xA00000);
		
		File tempDir = new File("D:\\uploaded");
		
		if (!tempDir.exists()) {
			tempDir.mkdir();
		}
		itemFactory.setRepository(tempDir);
		
		ServletFileUpload sfu = new ServletFileUpload(itemFactory);
		sfu.setSizeMax(0xA00000);
		try {
			java.util.List<FileItem> fileItems =  sfu.parseRequest(request);
			Iterator it = fileItems.iterator();
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
