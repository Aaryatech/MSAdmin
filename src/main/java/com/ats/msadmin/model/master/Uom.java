package com.ats.msadmin.model.master;



public class Uom {


	private int uomId;

	private String uomName;

	private int isUsed;

	public int getUomId() {
		return uomId;
	}

	public void setUomId(int uomId) {
		this.uomId = uomId;
	}

	public String getUomName() {
		return uomName;
	}

	public void setUomName(String uomName) {
		this.uomName = uomName;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "Uom [uomId=" + uomId + ", uomName=" + uomName + ", isUsed=" + isUsed + "]";
	}

}
