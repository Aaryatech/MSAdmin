package com.ats.msadmin.model.dashreport;

import java.util.List;

import com.ats.msadmin.model.master.Category;


public class CatwiseTrend {
	

	private List<Category> catList ;
	private List<DatewithOrderQty>orderList;
	public List<Category> getCatList() {
		return catList;
	} 
	public void setCatList(List<Category> catList) {
		this.catList = catList; 
	}
	public List<DatewithOrderQty> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<DatewithOrderQty> orderList) {
		this.orderList = orderList;
	}
	
	@Override
	public String toString() {
		return "CatwiseTrend [catList=" + catList + ", orderList=" + orderList + "]";
	}
	
	
	
}
