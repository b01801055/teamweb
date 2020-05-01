package conn;

import java.io.Serializable;
import java.sql.*;

public class ConnUpdate implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sql;
	private String sDriver = "com.mysql.cj.jdbc.Driver";
	private String user = "root";
	private String password = "1234";
	private String url = "jdbc:mysql://localhost:8888/teamweb2020?serverTimezone=CST";
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private int n;
	
	
	//vvv設定Bean的set get
	//Driver
	public void setsDriver(String sDriver) {this.sDriver = sDriver;}
	public String getsDriver() {return sDriver;}
	//User
	public void setUser(String user) {this.user = user;}
	public String getUser() {return user;}
	//password
	public void setPassword(String password) {this.password = password;}
	//URL
	public void setUrl(String url) {this.url = url;}
	public String getUrl() {return url;}
	//n
	public int getN() {return n;}
	//sql
		public String getSql() {return sql;}
		public void setSql(String sql) {
			this.sql = sql;
			try {
				Class.forName(sDriver);
			} catch (Exception e) {
				System.out.println("找不到Driver");
				System.out.println(e.getMessage());
			}

			try {
				conn = DriverManager.getConnection(url, user, password);
			} catch (SQLException e) {
				System.out.println("Connection物件建立失敗!");
				System.out.println(e.getMessage());
			}

			try {
				stmt = conn.prepareStatement(sql);
			} catch (SQLException e) {
				System.out.println("Statement物件建立失敗!");
				System.out.println(e.getMessage());
			}

			try {
				n = stmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("sql語法執行失敗");
				System.out.println(e.getMessage());
			}			
		}	
}
