package shop;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

import conn.ConnQuery;

public class OrderHistoryDB {
	
	public ArrayList<ResultSet> searchOrderHistoryById(int mem_id) {
		ConnQuery connQry=new ConnQuery();
		String sql;
		ArrayList<ResultSet> myArrL= new ArrayList<ResultSet>();//回傳這個 第一個是主檔 後面是明細
		//先查訂單主單號
		sql="SELECT * FROM orderList WHERE mem_id="+mem_id;
		connQry.setSql(sql);
		ResultSet rs1 = connQry.getRs();
		
		//再逐筆查詢明細
		try {
			while(rs1.next()) {
				sql="SELECT orderlistdetail.prod_id,quantity,prod_name,prod_price,prod_introduction,prod_size_stock "
						+"FROM orderlistdetail "
						+ "INNER JOIN product ON orderlistdetail.prod_id = product.prod_id "
						+ "WHERE orderList_id="+rs1.getInt(1);
				System.out.println(rs1.getInt(1));
				connQry.setSql(sql);
				ResultSet rs2=connQry.getRs();
				myArrL.add(rs2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(myArrL.size());
		return myArrL;
	}

}
