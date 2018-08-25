package com.ats.msadmin.model.user;

public class LoginResponseMU {

	private boolean error;
	private String msg;
	private MahasanghUser mahasnaghUser;

	public boolean isError() {
		return error;
	}

	public void setError(boolean error) {
		this.error = error;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public MahasanghUser getMahasnaghUser() {
		return mahasnaghUser;
	}

	public void setMahasnaghUser(MahasanghUser mahasnaghUser) {
		this.mahasnaghUser = mahasnaghUser;
	}

	@Override
	public String toString() {
		return "LoginResponseMU [error=" + error + ", msg=" + msg + ", mahasnaghUser=" + mahasnaghUser + "]";
	}

}
