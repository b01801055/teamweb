package shop;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

import conn.ConnQuery;

public class ProductDB implements Serializable{
	private String sql;
	private ConnQuery conn= new ConnQuery();
	private ResultSet rs=null;
	private int query_count=0;
	
	public Collection<Product> getProducts() throws SQLException{
		sql=
	}
}
