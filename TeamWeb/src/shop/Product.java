package shop;

import java.io.Serializable;

public class Product implements Serializable{

	private int prod_id;
	private String prod_name;
	private int prod_price;
	private String prod_introduction;
	private int prod_size_stock;
	private String prod_img;
	public Product(int prod_id,String prod_name,int prod_price,String prod_introduction,int prod_size_stock,String prod_img) {
		this.prod_id=prod_id;
		this.prod_name=prod_name;
		this.prod_price=prod_price;
		this.prod_introduction=prod_introduction;
		this.prod_size_stock=prod_size_stock;
		this.prod_img=prod_img;
	}
	
	public int getProd_id() {
		return prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_introduction() {
		return prod_introduction;
	}
	public void setProd_introduction(String prod_introduction) {
		this.prod_introduction = prod_introduction;
	}
	public int getProd_size_stock() {
		return prod_size_stock;
	}
	public void setProd_size_stock(int prod_size_stock) {
		this.prod_size_stock = prod_size_stock;
	}
	public String getProd_img() {
		return prod_img;
	}
	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}
}
