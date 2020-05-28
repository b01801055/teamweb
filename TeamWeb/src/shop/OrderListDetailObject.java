package shop;

import java.io.Serializable;

public class OrderListDetailObject implements Serializable{
	//Field
	private int prod_id;
	private int quantity;
	private String prod_name;
	private int prod_price;
	private String prod_introduction;
	
	//set
	public void setProd_id(int prod_id) {this.prod_id=prod_id;}
	public void setQuantity(int quantity) {this.quantity=quantity;}
	public void setProd_name(String prod_name) {this.prod_name=prod_name;}
	public void setProd_price(int prod_price) {this.prod_price=prod_price;}
	public void setProd_introduction(String prod_introduction) {this.prod_introduction=prod_introduction;}
	
	//get
	public int getProd_id() {return this.prod_id;}
	public int getQuantity() {return this.quantity;}
	public String getProd_name() {return this.prod_name;}
	public int getProd_price() {return this.prod_price;}
	public String getProd_introduction() {return this.prod_introduction;}
}
