package shop;

import java.io.Serializable;

public class CartItem implements Serializable{
	private Product product=null;
	private int quantity=0;
	
	public CartItem()
	{}
	
	public CartItem(Product product) {
		this.product=product;
		this.quantity=1;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getItemPrice() {
		int price = product.getProd_price()*quantity;
		return price;
	}
}
