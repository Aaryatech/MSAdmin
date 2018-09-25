package com.ats.msadmin.model.dashreport;



public class NoOrderDist {
	
	
	private int distId;

	private String distEngName;
	private String distMarName;

	private String distContactNo;

	public int getDistId() {
		return distId;
	}

	public void setDistId(int distId) {
		this.distId = distId;
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

	@Override
	public String toString() {
		return "NoOrderDist [distId=" + distId + ", distEngName=" + distEngName + ", distMarName=" + distMarName
				+ ", distContactNo=" + distContactNo + "]";
	}
	

}
