package shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

@WebServlet("/doCheckOut")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//=======
		String shop_name=request.getParameter("shop_name");
		String shop_mbphone=request.getParameter("shop_mbphone");
		String shop_address=request.getParameter("shop_address");
		String shop_email=request.getParameter("shop_email");
		HttpSession session=request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		Collection<CartItem> cartItems =cart.getItems();
		//=======
		boolean size_stock_enough = true;
		String sql;
		ProductDb productDb = new ProductDb();
		Iterator<CartItem> iter = cartItems.iterator();
		while (iter.hasNext()) {
			Product tmpProd = iter.next().getProduct();
			int tmp_prod_id = tmpProd.getProd_id();
			int tmp_prod_quantity = tmpProd.getProd_size_stock();
			try {
				if (!productDb.isAmountEnough(tmp_prod_id, tmp_prod_quantity)) {// 該商品庫存不夠
					size_stock_enough = false;
					int prod_size_stock=cart.renewSizeStock(tmp_prod_id);
					cart.setItemNum(tmp_prod_id, prod_size_stock);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (size_stock_enough) {//庫存足
			try {
				productDb.buyProducts(cart);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else {//庫存不足
			session.setAttribute("cart", cart);
			response.sendRedirect("product_summary.jsp?msg=1");
		}
			

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
