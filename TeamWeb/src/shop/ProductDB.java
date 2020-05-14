package shop;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import conn.ConnQuery;

public class ProductDb implements Serializable{
	private String sql;
	private ConnQuery conn= new ConnQuery();
	private ResultSet rs;
	private int query_count=0;
	
	public Collection<Product> getProducts() throws SQLException{
		rs=null;
		sql="SELECT * FROM teamweb2020.product";
		ArrayList<Product> prodList = new ArrayList<Product>();
		
		conn.setSql(sql);
		rs=conn.getRs();
		while(rs.next()) {
			Product product = new Product(rs.getInt(1), rs.getString(2),
					rs.getInt(3), rs.getString(4),
					rs.getInt(5), rs.getString(6));
			prodList.add(product);
		}
		return prodList;
	}
	public Product getProduct(int prod_id) throws SQLException{
		rs=null;
		sql="SELECT * FROM teamweb2020.product WHERE prod_id="+prod_id;
		conn.setSql(sql);
		rs=conn.getRs();
		Product product=null;
		if (rs.next()) {
			product = new Product(rs.getInt(1), rs.getString(2),
					rs.getInt(3), rs.getString(4),
					rs.getInt(5), rs.getString(6));
		}
		return product;
	}
	
	public Collection<Product> searchProd(String keyboard) throws SQLException{
		rs=null;
		ArrayList<Product> prodList = new ArrayList<Product>();
		sql="SELECT * FROM teamweb2020.product WHERE prod_name LIKE '%"+keyboard
				+"%'";
		conn.setSql(sql);
		rs=conn.getRs();
		while (rs.next()) {
			Product product = new Product(rs.getInt(1), rs.getString(2),
					rs.getInt(3), rs.getString(4),
					rs.getInt(5), rs.getString(6));
			prodList.add(product);
		}
		return prodList;
	}
	
	public boolean isAmountEnough(int prod_id,int quantity) throws SQLException{
		rs=null;
		boolean bEnough = false;
		sql="SELECT prod_size_stock FROM teamweb2020.product WHERE prod_id="+prod_id;
		conn.setSql(sql);
		rs=conn.getRs();
		
		while (rs.next()) {
			int amount = rs.getInt(1);
			if (amount >= quantity) {
				bEnough = true;
			}
		}
		return bEnough;
	}
	
	public synchronized void buyProducts(Cart cart) throws SQLException{
		Connection conn=null;
		PreparedStatement stmt=null;
		Iterator<CartItem> it = cart.getItems().iterator();
		sql="UPDATE product set prod_size_stock= prod_size_stock-"
				+q
		
		while (it.hasNext()) {
			CartItem item = (CartItem) it.next();
			Product product = item.getProduct();
			int prod_id = product.getProd_id();
			int quantity = item.getQuanity();
		}
	}
}
