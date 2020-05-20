package model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import conn.ConnQuery;

public class ProductBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int queryCount;
	private ArrayList<Integer> idList=new ArrayList<Integer>();
	private ArrayList<Integer> priceList=new ArrayList<Integer>();
	private ArrayList<Integer> leftNumList=new ArrayList<Integer>();
	private ArrayList<String> nameList=new ArrayList<String>();
	private ArrayList<String> introList=new ArrayList<String>();
	private int id;
	private int price;
	private int leftNum;
	private String name;
	private String intro;
	
	public ProductBean(){
		String sql = "SELECT * FROM TEAMWEB2020.PRODUCT WHERE prod_view=1;";
		ConnQuery connQry = new ConnQuery();
		connQry.setSql(sql);
		queryCount = connQry.getQuery_count();
		ResultSet rs = connQry.getRs();
		
		try {
			rs.first();
			for (int i = 0; i < queryCount; i++) {

				idList.add(i, rs.getInt(1));// id
				priceList.add(i, rs.getInt(3));// price
				leftNumList.add(i, rs.getInt(5));// leftNum
				nameList.add(i, rs.getString(2));// name
				introList.add(i, rs.getString(4));// intro

				rs.next();
			}
			rs.first();
		} catch (SQLException e) {
			System.out.print(e);
		}
	}
	public ProductBean(int id){
		String sql = "SELECT * FROM TEAMWEB2020.PRODUCT WHERE prod_id="+id+" AND prod_view=1;";
		ConnQuery connQry = new ConnQuery();
		connQry.setSql(sql);
		queryCount = connQry.getQuery_count();
		ResultSet rs = connQry.getRs();
		
		try {
				rs.first();
				id=rs.getInt(1);// id
				price=rs.getInt(3);// price
				leftNum=rs.getInt(5);// leftNum
				name=rs.getString(2);// name
				intro=rs.getString(4);// intro

		} catch (SQLException e) {
			System.out.print(e);
		}
	}
	
	//vvv set get
		public ArrayList<Integer> getIdList() {return this.idList;}
		public ArrayList<Integer> getPriceList() {return this.priceList;}
		public ArrayList<Integer> getLeftNumList() {return this.leftNumList;}
		public ArrayList<String> getNameList() {return this.nameList;}
		public ArrayList<String> getIntroList() {return this.introList;}
		public int getQueryCount() {return this.queryCount;}
		public int getId() {return this.id;}
		public int getPrice() {return this.price;}
		public int getLeftNum() {return this.leftNum;}
		public String getName() {return this.name;}
		public String getIntro() {return this.intro;}
			//^^^ set get
}
