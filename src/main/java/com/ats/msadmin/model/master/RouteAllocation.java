package com.ats.msadmin.model.master;


public class RouteAllocation {

	
	private int trId;

	private String fromDate;
	private String toDate;
	private int routeId;
	private int vehicleId;
	private int supervisorId;
	
	private int driverId;

	public int getTrId() {
		return trId;
	}

	public void setTrId(int trId) {
		this.trId = trId;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public int getRouteId() {
		return routeId;
	}

	public void setRouteId(int routeId) {
		this.routeId = routeId;
	}

	public int getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}

	public int getSupervisorId() {
		return supervisorId;
	}

	public void setSupervisorId(int supervisorId) {
		this.supervisorId = supervisorId;
	}

	
	
	public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}

	@Override
	public String toString() {
		return "RouteAllocation [trId=" + trId + ", fromDate=" + fromDate + ", toDate=" + toDate + ", routeId="
				+ routeId + ", vehicleId=" + vehicleId + ", supervisorId=" + supervisorId + ", driverId=" + driverId
				+ "]";
	}

}
