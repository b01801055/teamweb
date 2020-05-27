package shop;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class Cart implements Serializable{

	private HashMap<Integer, CartItem> items = null;
	private int numOfItems=0;
	
	public Cart() {
		items = new HashMap<Integer, CartItem>();
	}
	
	public synchronized void addItem(Integer prod_id,Product product) {
		if (!items.containsKey(prod_id)) {
			CartItem item = new CartItem(product);
			items.put(prod_id, item);
			numOfItems++;
		}
	}
	
	public synchronized void deleteItem(Integer prod_id) {
		if (items.containsKey(prod_id)) {
			items.remove(prod_id);
			numOfItems--;
		}
	}
	
	public synchronized void clear() {
		items.clear();
		numOfItems=0;
	}
	
	public synchronized int getNumOfItems() {
		return numOfItems;
	}
	
	public synchronized void setItemNum(Integer prod_id, int quantity) {
		CartItem item = (CartItem)items.get(prod_id);
		if (quantity<=0) {
			items.remove(prod_id);
		}else {
			item.setQuantity(quantity);
		}
	}
	public synchronized int getItemQuantity(Integer prod_id) {
		CartItem item = (CartItem)items.get(prod_id);
		return item.getQuantity();
	}
	
	public synchronized int getTotalPrice() {
		int amount=0;
		Iterator<CartItem> it = items.values().iterator();
		while (it.hasNext()) {
			CartItem item = (CartItem)it.next();
			amount+=item.getItemPrice();
		}
		return amount;
	}
	public synchronized int getTotalQuantity() {
		int amount=0;
		Iterator<CartItem> it = items.values().iterator();
		while (it.hasNext()) {
			CartItem item = (CartItem)it.next();
			amount+=item.getQuantity();
		}
		return amount;
	}
	
	public synchronized Collection<CartItem> getItems(){
		return items.values();
	}
	
	public synchronized boolean isExist(Integer prod_id) {
		if (items.containsKey(prod_id)) {
			return true;
		}else {
			return false;
		}
	}
	
	public synchronized int renewSizeStock(Integer prod_id) {
		int prod_size_stock=-1;
		if (items.containsKey(prod_id)) {
			CartItem item = (CartItem) items.get(prod_id);
			Product product = item.getProduct();
			try {
				ProductDb productDb = new ProductDb();
				prod_size_stock = productDb.getProduct(prod_id).getProd_size_stock();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			product.setProd_size_stock(prod_size_stock);
			item.setProduct(product);
			items.put(prod_id, item);
		}
		return prod_size_stock;	
		
	}
}
