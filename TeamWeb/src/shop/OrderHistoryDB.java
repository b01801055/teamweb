package shop;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import conn.ConnQuery;

public class OrderHistoryDB {
	
	private ArrayList<OrderListObject> arrMain = new ArrayList<OrderListObject>();
	private ArrayList<ArrayList<OrderListDetailObject>> arrArrDetail = new ArrayList<ArrayList<OrderListDetailObject>>();
	
	public ArrayList<OrderListObject> getArrMain(){return this.arrMain;}
	public ArrayList<ArrayList<OrderListDetailObject>> getArrArrDetail(){return this.arrArrDetail;}
	
	public void searchOrderHistoryById(int mem_id) {
		ConnQuery connQry=new ConnQuery();
		String sql;
		
		//先查訂單主單號
		sql="SELECT * FROM orderList WHERE mem_id="+mem_id+" ORDER BY orderList_id DESC";
		connQry.setSql(sql);
		ResultSet rs1 = connQry.getRs();
		ArrayList<OrderListDetailObject> arrDetail = null;
		try {
			while(rs1.next()) {
				
				int orderList_id = rs1.getInt(1);
				int orderList_mem_id = rs1.getInt(2);
				String orderList_date = rs1.getString(3);
				String orderList_mphone = rs1.getString(4);
				String orderList_address = rs1.getString(5);
				
				OrderListObject  orderListObject =new OrderListObject();
				orderListObject.setOrderList_id(orderList_id);
				orderListObject.setMem_id(orderList_mem_id);
				orderListObject.setOrderList_date(orderList_date);
				orderListObject.setOderList_mphone(orderList_mphone);
				orderListObject.setOrderList_address(orderList_address);
				
				arrMain.add(orderListObject);
				
				//再逐筆查詢明細
				sql="SELECT orderlistdetail.prod_id,quantity,prod_name,prod_price,prod_introduction FROM orderlistdetail INNER JOIN product ON orderlistdetail.prod_id = product.prod_id WHERE orderList_id="+rs1.getInt(1);
				connQry.setSql(sql);
				ResultSet rs2=connQry.getRs();
				
				arrDetail=new ArrayList<OrderListDetailObject>();
				while(rs2.next()) {
					int prod_id = rs2.getInt(1);
					int quantity = rs2.getInt(2);
					String prod_name = rs2.getString(3); 
					int prod_price = rs2.getInt(4);
					String prod_introduction = rs2.getString(5);
				
					OrderListDetailObject orderListDetailObject =new OrderListDetailObject();
					orderListDetailObject.setProd_id(prod_id);
					orderListDetailObject.setQuantity(quantity);
					orderListDetailObject.setProd_name(prod_name);
					orderListDetailObject.setProd_price(prod_price);
					orderListDetailObject.setProd_introduction(prod_introduction);
				
					arrDetail.add(orderListDetailObject);
				}
				arrArrDetail.add(arrDetail);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
