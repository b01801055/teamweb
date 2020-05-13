package shop;

import java.io.Serializable;

public class CartItem implements Serializable{
	private Product product=null;
	private int quanity=0;
	
	public CartItem()
	{}
	
	public CartItem(Product product) {
		this.product=product;
		this.quanity=1;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuanity() {
		return quanity;
	}

	public void setQuanity(int quanity) {
		this.quanity = quanity;
	}
	public int getItemPrice() {
		int price = product.getProd_price()*quanity;
		return price;
	}
}
