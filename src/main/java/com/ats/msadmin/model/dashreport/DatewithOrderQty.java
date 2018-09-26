package com.ats.msadmin.model.dashreport;

import java.util.List;

public class DatewithOrderQty {
	
	private String date;
	private List<Integer>orderQty;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<Integer> getOrderQty() {
		return orderQty;
	}
	public void setOrderQty(List<Integer> orderQty) {
		this.orderQty = orderQty;
	}
	 
	@Override
	public String toString() {
		return "DatewithOrderQty [date=" + date + ", orderQty=" + orderQty + "]";
	}
	
	

}
