package com.ats.msadmin.model.dist;


public class DailyDistHeader {


	private int headerId;

	private int routeId;
	private String date;

	public int getHeaderId() {
		return headerId;
	}

	public void setHeaderId(int headerId) {
		this.headerId = headerId;
	}

	public int getRouteId() {
		return routeId;
	}

	public void setRouteId(int routeId) {
		this.routeId = routeId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "DailyDistHeader [headerId=" + headerId + ", routeId=" + routeId + ", date=" + date + "]";
	}

}
