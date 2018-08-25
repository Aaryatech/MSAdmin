package com.ats.msadmin.model.master;

public class Item {
	private int itemId;

	private int itemHsnId;
	private int catId;
	private String itemPic;
	private String itemEngName;
	private String itemMarName;
	private String itemEngDesc;
	private String itemMarDesc;
	private String itemUom;

	private float itemRate;

	private float itemMrp;

	private int isUsed;

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getItemHsnId() {
		return itemHsnId;
	}

	public void setItemHsnId(int itemHsnId) {
		this.itemHsnId = itemHsnId;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getItemPic() {
		return itemPic;
	}

	public void setItemPic(String itemPic) {
		this.itemPic = itemPic;
	}

	public String getItemEngName() {
		return itemEngName;
	}

	public void setItemEngName(String itemEngName) {
		this.itemEngName = itemEngName;
	}

	public String getItemMarName() {
		return itemMarName;
	}

	public void setItemMarName(String itemMarName) {
		this.itemMarName = itemMarName;
	}

	public String getItemEngDesc() {
		return itemEngDesc;
	}

	public void setItemEngDesc(String itemEngDesc) {
		this.itemEngDesc = itemEngDesc;
	}

	public String getItemMarDesc() {
		return itemMarDesc;
	}

	public void setItemMarDesc(String itemMarDesc) {
		this.itemMarDesc = itemMarDesc;
	}

	public String getItemUom() {
		return itemUom;
	}

	public void setItemUom(String itemUom) {
		this.itemUom = itemUom;
	}

	public float getItemRate() {
		return itemRate;
	}

	public void setItemRate(float itemRate) {
		this.itemRate = itemRate;
	}

	public float getItemMrp() {
		return itemMrp;
	}

	public void setItemMrp(float itemMrp) {
		this.itemMrp = itemMrp;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", itemHsnId=" + itemHsnId + ", catId=" + catId + ", itemPic=" + itemPic
				+ ", itemEngName=" + itemEngName + ", itemMarName=" + itemMarName + ", itemEngDesc=" + itemEngDesc
				+ ", itemMarDesc=" + itemMarDesc + ", itemUom=" + itemUom + ", itemRate=" + itemRate + ", itemMrp="
				+ itemMrp + ", isUsed=" + isUsed + "]";
	}

}
