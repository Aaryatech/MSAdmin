package com.ats.msadmin.model.order;

public class EditOrderDataBean {
	
	private int orderDetailId;
	
	private int msQty;
	
	private float itemTotal;

	private int orderHeaderId;

	public int getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public int getMsQty() {
		return msQty;
	}

	public void setMsQty(int msQty) {
		this.msQty = msQty;
	}

	public float getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(float itemTotal) {
		this.itemTotal = itemTotal;
	}
	
	
	public int getOrderHeaderId() {
		return orderHeaderId;
	}

	public void setOrderHeaderId(int orderHeaderId) {
		this.orderHeaderId = orderHeaderId;
	}

	@Override
	public String toString() {
		return "EditOrderDataBean [orderDetailId=" + orderDetailId + ", msQty=" + msQty + ", itemTotal=" + itemTotal
				+ ", orderHeaderId=" + orderHeaderId + "]";
	}
	
}
