package shop;

import java.sql.ResultSet;
import java.util.HashSet;

public class Test {

	public static void main(String[] args) {
		int mem_id=20;
	  	OrderHistoryDB orderHistoryDB=new OrderHistoryDB();
	  	HashSet<ResultSet> mySet=orderHistoryDB.searchOrderHistoryById(mem_id);
	  	rs_orderList=mySet.;

	}

}
