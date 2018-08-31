package com.ats.msadmin.model.master;

import java.util.List;

import com.ats.msadmin.controller.RouteSup;

public class RouteAlloCommonBean {
	
	List<GetRoute> routeList;
	List<Driver> driverList;
	List<Vehicle> vehicleList;
	List<RouteSup> routeSupList;
	
	
	public List<GetRoute> getRouteList() {
		return routeList;
	}
	public void setRouteList(List<GetRoute> routeList) {
		this.routeList = routeList;
	}
	public List<Driver> getDriverList() {
		return driverList;
	}
	public void setDriverList(List<Driver> driverList) {
		this.driverList = driverList;
	}
	public List<RouteSup> getRouteSupList() {
		return routeSupList;
	}
	public void setRouteSupList(List<RouteSup> routeSupList) {
		this.routeSupList = routeSupList;
	}
	public List<Vehicle> getVehicleList() {
		return vehicleList;
	}
	public void setVehicleList(List<Vehicle> vehicleList) {
		this.vehicleList = vehicleList;
	}
	@Override
	public String toString() {
		return "RouteAlloCommonBean [routeList=" + routeList + ", driverList=" + driverList + ", vehicleList="
				+ vehicleList + ", routeSupList=" + routeSupList + "]";
	}

}
