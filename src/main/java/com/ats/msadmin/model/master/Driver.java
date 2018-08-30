package com.ats.msadmin.model.master;


public class Driver {

	private int driverId;

	private String driverEngName;
	private String driverMarName;
	private String driverContactNo;
	private int isUsed;

	public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}

	public String getDriverEngName() {
		return driverEngName;
	}

	public void setDriverEngName(String driverEngName) {
		this.driverEngName = driverEngName;
	}

	public String getDriverMarName() {
		return driverMarName;
	}

	public void setDriverMarName(String driverMarName) {
		this.driverMarName = driverMarName;
	}

	public String getDriverContactNo() {
		return driverContactNo;
	}

	public void setDriverContactNo(String driverContactNo) {
		this.driverContactNo = driverContactNo;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "Driver [driverId=" + driverId + ", driverEngName=" + driverEngName + ", driverMarName=" + driverMarName
				+ ", driverContactNo=" + driverContactNo + ", isUsed=" + isUsed + "]";
	}

}
