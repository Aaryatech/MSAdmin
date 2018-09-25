package com.ats.msadmin.model.dashreport;


public class NoOrderHub {
	

	private int hubId;
	
	private String hubEngName;
	private String hubMarName;
	

	private String hubContactNo;


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


	@Override
	public String toString() {
		return "NoOrderHub [hubId=" + hubId + ", hubEngName=" + hubEngName + ", hubMarName=" + hubMarName
				+ ", hubContactNo=" + hubContactNo + "]";
	}
	
	
}
