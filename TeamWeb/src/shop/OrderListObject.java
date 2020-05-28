package shop;

import java.io.Serializable;

public class OrderListObject implements Serializable{
//Field
private int orderList_id;
private int mem_id;
private String orderList_date;
private String orderList_mphone;
private String orderList_address;

//set===
public void setOrderList_id(int orderList_id) {this.orderList_id=orderList_id;}
public void setMem_id(int mem_id) {this.mem_id=mem_id;}
public void setOrderList_date(String orderList_date) {this.orderList_date=orderList_date;}
public void setOderList_mphone(String orderList_mphone) {this.orderList_mphone=orderList_mphone;}
public void setOrderList_address(String orderList_address) {this.orderList_address=orderList_address;}

//get===
public int getOrderList_id() {return this.orderList_id;}
public int getMem_id() {return this.mem_id;}
public String getOrderList_date() {return this.orderList_date;}
public String getOrderList_mphone() {return this.orderList_mphone;}
public String getOrderList_address() {return this.orderList_address;}
	
}
