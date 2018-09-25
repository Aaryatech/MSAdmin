package com.ats.msadmin.model.dashreport;


public class OrderTotAndCount {
	
	
	private float orderCount;
	private float orderTotal;
	

	public float getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(float orderCount) {
		this.orderCount = orderCount;
	}
	public float getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(float orderTotal) {
		this.orderTotal = orderTotal;
	}
	@Override
	public String toString() {
		return "OrderTotAndCount [orderCount=" + orderCount + ", orderTotal="
				+ orderTotal + "]";
	}
	
	
	

}
