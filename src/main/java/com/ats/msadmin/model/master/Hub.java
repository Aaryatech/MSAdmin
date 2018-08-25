package com.ats.msadmin.model.master;


//= "m_hub")
public class Hub {

	
	private int hubId;

	private String hubEngName;
	private String hubMarName;
	private String hubEngAdd;
	private String hubMarAdd;

	private String hubContactNo;
	private int isUsed;

	public int getHubId() {
		return hubId;
	}

	public void setHubId(int hubId) {
		this.hubId = hubId;
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

	public String getHubContactNo() {
		return hubContactNo;
	}

	public void setHubContactNo(String hubContactNo) {
		this.hubContactNo = hubContactNo;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "Hub [hubId=" + hubId + ", hubEngName=" + hubEngName + ", hubMarName=" + hubMarName + ", hubEngAdd="
				+ hubEngAdd + ", hubMarAdd=" + hubMarAdd + ", hubContactNo=" + hubContactNo + ", isUsed=" + isUsed
				+ "]";
	}

}
