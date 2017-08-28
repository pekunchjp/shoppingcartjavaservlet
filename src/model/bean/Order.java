package model.bean;

public class Order {
	private int orderID;
	private int customerID;
	private float totalAmount;
	private int orderStatusID;

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float d) {
		this.totalAmount = d;
	}

	public int getOrderStatusID() {
		return orderStatusID;
	}

	public void setOrderStatusID(int orderStatusID) {
		this.orderStatusID = orderStatusID;
	}

}
