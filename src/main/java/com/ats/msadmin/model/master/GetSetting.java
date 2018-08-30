package com.ats.msadmin.model.master;


public class GetSetting {


	private int settingId;

	private int configId;
	private int hubId;
	private int isUsed;

	private String configEngName;
	private String configMarName;
	private String configTypeDetails;
	private String itemIds;
	private String distFromTime;
	private String distToTime;
	private String hubFromTime;
	private String hubToTime;

	private int configType;

	private String hubEngName;
	private String hubMarName;
	private String hubEngAdd;
	private String hubMarAdd;

	public int getSettingId() {
		return settingId;
	}

	public void setSettingId(int settingId) {
		this.settingId = settingId;
	}

	public int getConfigId() {
		return configId;
	}

	public void setConfigId(int configId) {
		this.configId = configId;
	}

	public int getHubId() {
		return hubId;
	}

	public void setHubId(int hubId) {
		this.hubId = hubId;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public String getConfigEngName() {
		return configEngName;
	}

	public void setConfigEngName(String configEngName) {
		this.configEngName = configEngName;
	}

	public String getConfigMarName() {
		return configMarName;
	}

	public void setConfigMarName(String configMarName) {
		this.configMarName = configMarName;
	}

	public String getConfigTypeDetails() {
		return configTypeDetails;
	}

	public void setConfigTypeDetails(String configTypeDetails) {
		this.configTypeDetails = configTypeDetails;
	}

	public String getItemIds() {
		return itemIds;
	}

	public void setItemIds(String itemIds) {
		this.itemIds = itemIds;
	}

	public String getDistFromTime() {
		return distFromTime;
	}

	public void setDistFromTime(String distFromTime) {
		this.distFromTime = distFromTime;
	}

	public String getDistToTime() {
		return distToTime;
	}

	public void setDistToTime(String distToTime) {
		this.distToTime = distToTime;
	}

	public String getHubFromTime() {
		return hubFromTime;
	}

	public void setHubFromTime(String hubFromTime) {
		this.hubFromTime = hubFromTime;
	}

	public String getHubToTime() {
		return hubToTime;
	}

	public void setHubToTime(String hubToTime) {
		this.hubToTime = hubToTime;
	}

	public int getConfigType() {
		return configType;
	}

	public void setConfigType(int configType) {
		this.configType = configType;
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
		return "GetSetting [settingId=" + settingId + ", configId=" + configId + ", hubId=" + hubId + ", isUsed="
				+ isUsed + ", configEngName=" + configEngName + ", configMarName=" + configMarName
				+ ", configTypeDetails=" + configTypeDetails + ", itemIds=" + itemIds + ", distFromTime=" + distFromTime
				+ ", distToTime=" + distToTime + ", hubFromTime=" + hubFromTime + ", hubToTime=" + hubToTime
				+ ", configType=" + configType + ", hubEngName=" + hubEngName + ", hubMarName=" + hubMarName
				+ ", hubEngAdd=" + hubEngAdd + ", hubMarAdd=" + hubMarAdd + "]";
	}

}
