package com.ats.msadmin.model.user;



//m_mah_user
public class MahasanghUser {

	
	private int msId;

	private String hubIds;
	private String msEngName;
	private String msMarName;
	private String msContactNo;
	private String msPwd;
	private int isBlock;
	private int isAdmin;
	private int isUsed;

	public int getMsId() {
		return msId;
	}

	public void setMsId(int msId) {
		this.msId = msId;
	}

	public String getHubIds() {
		return hubIds;
	}

	public void setHubIds(String hubIds) {
		this.hubIds = hubIds;
	}

	public String getMsEngName() {
		return msEngName;
	}

	public void setMsEngName(String msEngName) {
		this.msEngName = msEngName;
	}

	public String getMsMarName() {
		return msMarName;
	}

	public void setMsMarName(String msMarName) {
		this.msMarName = msMarName;
	}

	public String getMsContactNo() {
		return msContactNo;
	}

	public void setMsContactNo(String msContactNo) {
		this.msContactNo = msContactNo;
	}

	public String getMsPwd() {
		return msPwd;
	}

	public void setMsPwd(String msPwd) {
		this.msPwd = msPwd;
	}

	public int getIsBlock() {
		return isBlock;
	}

	public void setIsBlock(int isBlock) {
		this.isBlock = isBlock;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "MahasnaghUser [msId=" + msId + ", hubIds=" + hubIds + ", msEngName=" + msEngName + ", msMarName="
				+ msMarName + ", msContactNo=" + msContactNo + ", msPwd=" + msPwd + ", isBlock=" + isBlock
				+ ", isAdmin=" + isAdmin + ", isUsed=" + isUsed + "]";
	}

}
