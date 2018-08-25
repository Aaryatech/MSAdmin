package com.ats.msadmin.model.master;

import java.util.List;

public class CatItemList {

	
	private int catId;

	private String catEngName;
	private String catMarName;
	private String catPic;
	private int isUsed;

	
	List<Item> itemList;

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getCatEngName() {
		return catEngName;
	}

	public void setCatEngName(String catEngName) {
		this.catEngName = catEngName;
	}

	public String getCatMarName() {
		return catMarName;
	}

	public void setCatMarName(String catMarName) {
		this.catMarName = catMarName;
	}

	public String getCatPic() {
		return catPic;
	}

	public void setCatPic(String catPic) {
		this.catPic = catPic;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public List<Item> getItemList() {
		return itemList;
	}

	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}

	@Override
	public String toString() {
		return "CatItemList [catId=" + catId + ", catEngName=" + catEngName + ", catMarName=" + catMarName + ", catPic="
				+ catPic + ", isUsed=" + isUsed + ", itemList=" + itemList + "]";
	}

}
