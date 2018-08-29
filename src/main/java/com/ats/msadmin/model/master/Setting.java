package com.ats.msadmin.model.master;


public class Setting {


	private int settingId;

	private int configId;
	private int hubId;
	private int isUsed;

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

	@Override
	public String toString() {
		return "Setting [settingId=" + settingId + ", configId=" + configId + ", hubId=" + hubId + ", isUsed=" + isUsed
				+ "]";
	}

}
