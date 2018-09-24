package com.ats.msadmin.model.report;

public class CategoryDistReport {
	private int catId;

	private String catEngName;
	private String catMarName;

	private float orderQty;

	private float itemTotal;

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getCatEngName() {
		return catEngName;
	}

	public void setCatEngName(String catEngName) {
		this.catEngName = catEngName;
	}

	public String getCatMarName() {
		return catMarName;
	}

	public void setCatMarName(String catMarName) {
		this.catMarName = catMarName;
	}

	public float getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(float orderQty) {
		this.orderQty = orderQty;
	}

	public float getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(float itemTotal) {
		this.itemTotal = itemTotal;
	}

	@Override
	public String toString() {
		return "CategoryDistReport [catId=" + catId + ", catEngName=" + catEngName + ", catMarName=" + catMarName
				+ ", orderQty=" + orderQty + ", itemTotal=" + itemTotal + "]";
	}

}
