package com.ats.msadmin.model.report;

public class ItemwiseDistReport {
	private int orderDetailId;

	private String itemEngName;
	private String itemMarName;
	private int itemWt;
	private String uomName;

	private String distEngName;
	private String distMarName;

	private String distContactNo;

	private float orderQty;

	private float deliverQty;

	private float itemTotal;

	public int getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public String getItemEngName() {
		return itemEngName;
	}

	public void setItemEngName(String itemEngName) {
		this.itemEngName = itemEngName;
	}

	public String getItemMarName() {
		return itemMarName;
	}

	public void setItemMarName(String itemMarName) {
		this.itemMarName = itemMarName;
	}

	public int getItemWt() {
		return itemWt;
	}

	public void setItemWt(int itemWt) {
		this.itemWt = itemWt;
	}

	public String getUomName() {
		return uomName;
	}

	public void setUomName(String uomName) {
		this.uomName = uomName;
	}

	public String getDistEngName() {
		return distEngName;
	}

	public void setDistEngName(String distEngName) {
		this.distEngName = distEngName;
	}

	public String getDistMarName() {
		return distMarName;
	}

	public void setDistMarName(String distMarName) {
		this.distMarName = distMarName;
	}

	public String getDistContactNo() {
		return distContactNo;
	}

	public void setDistContactNo(String distContactNo) {
		this.distContactNo = distContactNo;
	}

	public float getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(float orderQty) {
		this.orderQty = orderQty;
	}

	public float getDeliverQty() {
		return deliverQty;
	}

	public void setDeliverQty(float deliverQty) {
		this.deliverQty = deliverQty;
	}

	public float getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(float itemTotal) {
		this.itemTotal = itemTotal;
	}

	@Override
	public String toString() {
		return "ItemwiseDistReport [orderDetailId=" + orderDetailId + ", itemEngName=" + itemEngName + ", itemMarName="
				+ itemMarName + ", itemWt=" + itemWt + ", uomName=" + uomName + ", distEngName=" + distEngName
				+ ", distMarName=" + distMarName + ", distContactNo=" + distContactNo + ", orderQty=" + orderQty
				+ ", deliverQty=" + deliverQty + ", itemTotal=" + itemTotal + "]";
	}

}
