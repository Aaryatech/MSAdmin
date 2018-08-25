package com.ats.msadmin.controller;

//"m_route_supervisor")
public class RouteSup {

	
	private int supId;

	private String supEngName;
	private String supMarName;
	private String supContactNo;
	private String supPwd;
	private String token;

	private int isBlock;
	private int isUsed;

	public int getSupId() {
		return supId;
	}

	public void setSupId(int supId) {
		this.supId = supId;
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

	public String getSupPwd() {
		return supPwd;
	}

	public void setSupPwd(String supPwd) {
		this.supPwd = supPwd;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getIsBlock() {
		return isBlock;
	}

	public void setIsBlock(int isBlock) {
		this.isBlock = isBlock;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "RouteSup [supId=" + supId + ", supEngName=" + supEngName + ", supMarName=" + supMarName
				+ ", supContactNo=" + supContactNo + ", supPwd=" + supPwd + ", token=" + token + ", isBlock=" + isBlock
				+ ", isUsed=" + isUsed + "]";
	}

}
