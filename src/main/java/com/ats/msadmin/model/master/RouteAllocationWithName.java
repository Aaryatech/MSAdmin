package com.ats.msadmin.model.master;





public class RouteAllocationWithName {

	
	private int trId;

	private String fromDate;
	private String toDate;
	private int routeId;
	private int vehicleId;
	private int supervisorId;
	private int driverId;

	private String vehicleNo;

	private String routeEngName;
	private String routeMarName;

	private String supEngName;
	private String supMarName;
	private String supContactNo;

	private String driverEngName;
	private String driverMarName;
	private String driverContactNo;

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

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public String getRouteEngName() {
		return routeEngName;
	}

	public void setRouteEngName(String routeEngName) {
		this.routeEngName = routeEngName;
	}

	public String getRouteMarName() {
		return routeMarName;
	}

	public void setRouteMarName(String routeMarName) {
		this.routeMarName = routeMarName;
	}

	public String getSupEngName() {
		return supEngName;
	}

	public void setSupEngName(String supEngName) {
		this.supEngName = supEngName;
	}

	public String getSupMarName() {
		return supMarName;
	}

	public void setSupMarName(String supMarName) {
		this.supMarName = supMarName;
	}

	public String getSupContactNo() {
		return supContactNo;
	}

	public void setSupContactNo(String supContactNo) {
		this.supContactNo = supContactNo;
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

	@Override
	public String toString() {
		return "RouteAllocationWithName [trId=" + trId + ", fromDate=" + fromDate + ", toDate=" + toDate + ", routeId="
				+ routeId + ", vehicleId=" + vehicleId + ", supervisorId=" + supervisorId + ", driverId=" + driverId
				+ ", vehicleNo=" + vehicleNo + ", routeEngName=" + routeEngName + ", routeMarName=" + routeMarName
				+ ", supEngName=" + supEngName + ", supMarName=" + supMarName + ", supContactNo=" + supContactNo
				+ ", driverEngName=" + driverEngName + ", driverMarName=" + driverMarName + ", driverContactNo="
				+ driverContactNo + "]";
	}

}
