package com.ats.msadmin.model.master;



public class GetRoute {


	private int routeId;

	private int routeSeqNo;
	private int hubId;
	private String routeEngName;
	private String routeMarName;

	private int isUsed;

	private String hubEngName;
	private String hubMarName;

	private String hubEngAdd;
	private String hubMarAdd;

	public int getRouteId() {
		return routeId;
	}

	public void setRouteId(int routeId) {
		this.routeId = routeId;
	}

	public int getRouteSeqNo() {
		return routeSeqNo;
	}

	public void setRouteSeqNo(int routeSeqNo) {
		this.routeSeqNo = routeSeqNo;
	}

	public int getHubId() {
		return hubId;
	}

	public void setHubId(int hubId) {
		this.hubId = hubId;
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

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
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

	public String getHubEngAdd() {
		return hubEngAdd;
	}

	public void setHubEngAdd(String hubEngAdd) {
		this.hubEngAdd = hubEngAdd;
	}

	public String getHubMarAdd() {
		return hubMarAdd;
	}

	public void setHubMarAdd(String hubMarAdd) {
		this.hubMarAdd = hubMarAdd;
	}

	@Override
	public String toString() {
		return "GetRoute [routeId=" + routeId + ", routeSeqNo=" + routeSeqNo + ", hubId=" + hubId + ", routeEngName="
				+ routeEngName + ", routeMarName=" + routeMarName + ", isUsed=" + isUsed + ", hubEngName=" + hubEngName
				+ ", hubMarName=" + hubMarName + ", hubEngAdd=" + hubEngAdd + ", hubMarAdd=" + hubMarAdd + "]";
	}

}
