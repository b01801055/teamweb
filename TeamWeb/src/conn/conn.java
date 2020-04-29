package conn;

import java.io.Serializable;
import java.sql.*;

public class conn implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sql;
	private String sDriver;
	private String user;
	private String password;
	private String url;
	private Connection conn=null;
	private PreparedStatement stmt=null;
	private ResultSet rs = null;
	private int query_count;
	
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getsDriver() {
		return sDriver;
	}
	public void setsDriver(String sDriver) {
		sDriver = "com.mysql.cj.jdbc.Driver";
		this.sDriver = sDriver;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		user = "root";
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		password = "123456789";
		this.password = password;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		url = "jdbc:mysql://localhost:8888/teamweb2020?serverTimezone=CST";
		this.url = url;
	}
	
	public Connection getConnect() {
		
		try 
		{
			Class.forName(sDriver);
		} catch (Exception e) {
			System.out.println("無法載入驅動程式");
		}
		
		try 
		{
			conn = DriverManager.getConnection(url, user, password);
			if (conn != null)
				System.out.println("mysql建立資料來源連結成功!");
		} catch (SQLException e) {
			System.out.println("與資料來源連結錯誤: ");
			System.out.println(e.getMessage());		
		}
		return conn;
	}
	
	public PreparedStatement getStmt() {		
		return stmt;
	}
	public void setStmt(String sql,Connection conn, PreparedStatement stmt) {
		try {
			stmt=conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("mysql建立Statement物件失敗!");
			e.printStackTrace();
		}
		
		this.stmt = stmt;
	}
	
	
	public ResultSet getRs() {
		return rs;
	}
	public void setRs(PreparedStatement stmt,ResultSet rs) {
		
			try {
				rs=stmt.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("mysql執行失敗");
				e.printStackTrace();
			}
		
		this.rs = rs;
	}
	
	public int getQuery_count() {
		return query_count;
	}
	public void setQuery_count(ResultSet rs,int query_count) {
		try {
			while (rs.next()) {
				++query_count;	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.query_count = query_count;
	}
	
	
}
