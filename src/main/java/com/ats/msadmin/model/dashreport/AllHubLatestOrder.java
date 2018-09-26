package com.ats.msadmin.model.dashreport;

public class AllHubLatestOrder {

	
	private int hubId;

	private String hubEngName;
	private String hubMarName;
	
	private String hubContactNo;
	
	
	private float order1;
	private float order2;
	private float order3;
	
	
	public int getHubId() {
		return hubId;
	}
	public void setHubId(int hubId) {
		this.hubId = hubId;
	}
	public String getHubEngName() {
		return hubEngName;
	}
	public void setHubEngName(String hubEngName) {
		this.hubEngName = hubEngName;
	}
	public String getHubMarName() {
		return hubMarName;
	}
	public void setHubMarName(String hubMarName) {
		this.hubMarName = hubMarName;
	}
	public String getHubContactNo() {
		return hubContactNo;
	}
	public void setHubContactNo(String hubContactNo) {
		this.hubContactNo = hubContactNo;
	}
	public float getOrder1() {
		return order1;
	}
	public void setOrder1(float order1) {
		this.order1 = order1;
	}
	public float getOrder2() {
		return order2;
	}
	public void setOrder2(float order2) {
		this.order2 = order2;
	}
	public float getOrder3() {
		return order3;
	}
	public void setOrder3(float order3) {
		this.order3 = order3;
	}
	
	@Override
	public String toString() {
		return "AllHubLatestOrder [hubId=" + hubId + ", hubEngName=" + hubEngName + ", hubMarName=" + hubMarName
				+ ", hubContactNo=" + hubContactNo + ", order1=" + order1 + ", order2=" + order2 + ", order3=" + order3
				+ "]";
	}
	
	
}
