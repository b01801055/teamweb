package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.ProductBean;
import shop.Product;
import shop.ProductDb;


@WebServlet("/productSrch")
public class productSrch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;utf-8");
//		response.setContentType("application/json");
		PrintWriter out=response.getWriter();
		//===========
		String keyWord = request.getParameter("keyWord");
		System.out.println("keyWord: "+keyWord);//測試用
		ProductDb prodDB=new ProductDb();
//		ProductBean prodBn=new ProductBean();
//		prodBn.serchProducts(keyWord);
//		System.out.println(prodBn.getNameList().get(0));//測試用
		ArrayList<Product> SrchedProdList = null;
		try {
			SrchedProdList = (ArrayList<Product>) prodDB.searchProd(keyWord);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//HashMap<String, ArrayList<?>> myMap=new HashMap<String, ArrayList<?>>();
		JSONObject myJson=new JSONObject();
		
		for(int i=0;i<SrchedProdList.size();i++) {
			JSONObject myJsonInner=new JSONObject();
			
			myJsonInner.put("prod_id", SrchedProdList.get(i).getProd_id());
			myJsonInner.put("prod_name", SrchedProdList.get(i).getProd_name());
			myJsonInner.put("prod_prod_introduction", SrchedProdList.get(i).getProd_introduction());
			myJsonInner.put("prod_price", SrchedProdList.get(i).getProd_price());
			myJsonInner.put("prod_size_stock", SrchedProdList.get(i).getProd_size_stock());
			
			myJson.put(String.valueOf(i),myJsonInner);
		}
		out.print(myJson);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
