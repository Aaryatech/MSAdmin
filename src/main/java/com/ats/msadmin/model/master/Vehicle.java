package com.ats.msadmin.model.master;


public class Vehicle {

	private int vehicleId;

	private String vehicleNo;
	private int vehicleOwnedBy;

	private String vehicleInServiceFrom;

	private int isUsed;

	public int getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public int getVehicleOwnedBy() {
		return vehicleOwnedBy;
	}

	public void setVehicleOwnedBy(int vehicleOwnedBy) {
		this.vehicleOwnedBy = vehicleOwnedBy;
	}

	public String getVehicleInServiceFrom() {
		return vehicleInServiceFrom;
	}

	public void setVehicleInServiceFrom(String vehicleInServiceFrom) {
		this.vehicleInServiceFrom = vehicleInServiceFrom;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "Vehicle [vehicleId=" + vehicleId + ", vehicleNo=" + vehicleNo + ", vehicleOwnedBy=" + vehicleOwnedBy
				+ ", vehicleInServiceFrom=" + vehicleInServiceFrom + ", isUsed=" + isUsed + "]";
	}

}
