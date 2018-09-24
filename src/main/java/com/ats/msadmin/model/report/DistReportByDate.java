package com.ats.msadmin.model.report;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DistReportByDate {
	
	private int orderHeaderId;

	private float orderTotal;

	private int prevPendingCrateBal;

	private int cratesReceived;

	private int cratesIssued;

	private float prevPendingAmt;

	private float amtReceived;

	private float balAmount;

	private String distEngName;
	private String distMarName;

	private String distContactNo;

	private Date orderDate;

	public int getOrderHeaderId() {
		return orderHeaderId;
	}

	public void setOrderHeaderId(int orderHeaderId) {
		this.orderHeaderId = orderHeaderId;
	}

	public float getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(float orderTotal) {
		this.orderTotal = orderTotal;
	}

	public int getPrevPendingCrateBal() {
		return prevPendingCrateBal;
	}

	public void setPrevPendingCrateBal(int prevPendingCrateBal) {
		this.prevPendingCrateBal = prevPendingCrateBal;
	}

	public int getCratesReceived() {
		return cratesReceived;
	}

	public void setCratesReceived(int cratesReceived) {
		this.cratesReceived = cratesReceived;
	}

	public int getCratesIssued() {
		return cratesIssued;
	}

	public void setCratesIssued(int cratesIssued) {
		this.cratesIssued = cratesIssued;
	}

	public float getPrevPendingAmt() {
		return prevPendingAmt;
	}

	public void setPrevPendingAmt(float prevPendingAmt) {
		this.prevPendingAmt = prevPendingAmt;
	}

	public float getAmtReceived() {
		return amtReceived;
	}

	public void setAmtReceived(float amtReceived) {
		this.amtReceived = amtReceived;
	}

	public float getBalAmount() {
		return balAmount;
	}

	public void setBalAmount(float balAmount) {
		this.balAmount = balAmount;
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

	@JsonFormat(locale = "hi", timezone = "Asia/Kolkata", pattern = "dd-MM-yyyy")

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "DistReportByDate [orderHeaderId=" + orderHeaderId + ", orderTotal=" + orderTotal
				+ ", prevPendingCrateBal=" + prevPendingCrateBal + ", cratesReceived=" + cratesReceived
				+ ", cratesIssued=" + cratesIssued + ", prevPendingAmt=" + prevPendingAmt + ", amtReceived="
				+ amtReceived + ", balAmount=" + balAmount + ", distEngName=" + distEngName + ", distMarName="
				+ distMarName + ", distContactNo=" + distContactNo + ", orderDate=" + orderDate + "]";
	}


}
