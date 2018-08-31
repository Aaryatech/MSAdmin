package com.ats.msadmin.model.master;

import java.util.List;

public class DatewiseRoute {

	private String currDate;

	
	List<RouteAllocationWithName> routeAllocationList;

	public String getCurrDate() {
		return currDate;
	}

	public void setCurrDate(String currDate) {
		this.currDate = currDate;
	}

	public List<RouteAllocationWithName> getRouteAllocationList() {
		return routeAllocationList;
	}

	public void setRouteAllocationList(List<RouteAllocationWithName> routeAllocationList) {
		this.routeAllocationList = routeAllocationList;
	}

	@Override
	public String toString() {
		return "DatewiseRoute [currDate=" + currDate + ", routeAllocationList=" + routeAllocationList + "]";
	}

}
