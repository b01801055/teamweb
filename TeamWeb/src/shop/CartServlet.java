package shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;






@WebServlet("/doCartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("apllication/json;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		//=========
		int prod_id =Integer.parseInt(request.getParameter("prod_id"));
		String prod_name =request.getParameter("prod_name");
		int prod_price =Integer.parseInt(request.getParameter("prod_price"));
		String prod_introduction =request.getParameter("prod_introduction");
		int prod_size_stock =Integer.parseInt(request.getParameter("prod_size_stock"));
		HttpSession session=request.getSession();
		Product product = new Product(prod_id, prod_name, prod_price, prod_introduction, prod_size_stock);
		Cart cart;
		if(session.getAttribute("cart")==null) {
			cart=new Cart();
			session.setAttribute("cart", cart);
		}else {
			cart=(Cart) session.getAttribute("cart");
		}
		cart.addItem(prod_id, product);
		//====
//		response.sendRedirect("product_summary.jsp");
		JSONObject json = new JSONObject();
		json.put("prod_id",prod_id);
		json.put("numOfItems", cart.getNumOfItems());
		json.put("totalPrice", cart.getTotalPrice());
		out.print(json);
		
	}

}
