package com.ats.msadmin.model.dist;

public class DailyDistDetail {


	private int detailId;

	private int headerId;
	private int supervisorId;
	private String dayStartTime;
	private String dayEndTime;

	public int getDetailId() {
		return detailId;
	}

	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}

	public int getHeaderId() {
		return headerId;
	}

	public void setHeaderId(int headerId) {
		this.headerId = headerId;
	}

	public int getSupervisorId() {
		return supervisorId;
	}

	public void setSupervisorId(int supervisorId) {
		this.supervisorId = supervisorId;
	}

	public String getDayStartTime() {
		return dayStartTime;
	}

	public void setDayStartTime(String dayStartTime) {
		this.dayStartTime = dayStartTime;
	}

	public String getDayEndTime() {
		return dayEndTime;
	}

	public void setDayEndTime(String dayEndTime) {
		this.dayEndTime = dayEndTime;
	}

	@Override
	public String toString() {
		return "DailyDistDetail [detailId=" + detailId + ", headerId=" + headerId + ", supervisorId=" + supervisorId
				+ ", dayStartTime=" + dayStartTime + ", dayEndTime=" + dayEndTime + "]";
	}

}
