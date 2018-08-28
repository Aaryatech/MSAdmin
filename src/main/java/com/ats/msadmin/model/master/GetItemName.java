package com.ats.msadmin.model.master;


public class GetItemName {

	
	private int itemId;

	private int itemHsnId;
	private int catId;
	private String itemPic;
	private String itemEngName;
	private String itemMarName;
	private String itemEngDesc;
	private String itemMarDesc;
	private int itemUomId;
	private int itemWt;

	private float itemRate;

	private float itemMrp;

	private int isUsed;

	private String catEngName;
	private String catMarName;
	private String itemHsnCode;
	private String uomName;

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

	public int getItemUomId() {
		return itemUomId;
	}

	public void setItemUomId(int itemUomId) {
		this.itemUomId = itemUomId;
	}

	public int getItemWt() {
		return itemWt;
	}

	public void setItemWt(int itemWt) {
		this.itemWt = itemWt;
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

	public String getItemHsnCode() {
		return itemHsnCode;
	}

	public void setItemHsnCode(String itemHsnCode) {
		this.itemHsnCode = itemHsnCode;
	}

	public String getUomName() {
		return uomName;
	}

	public void setUomName(String uomName) {
		this.uomName = uomName;
	}

	@Override
	public String toString() {
		return "GetItemName [itemId=" + itemId + ", itemHsnId=" + itemHsnId + ", catId=" + catId + ", itemPic="
				+ itemPic + ", itemEngName=" + itemEngName + ", itemMarName=" + itemMarName + ", itemEngDesc="
				+ itemEngDesc + ", itemMarDesc=" + itemMarDesc + ", itemUomId=" + itemUomId + ", itemWt=" + itemWt
				+ ", itemRate=" + itemRate + ", itemMrp=" + itemMrp + ", isUsed=" + isUsed + ", catEngName="
				+ catEngName + ", catMarName=" + catMarName + ", itemHsnCode=" + itemHsnCode + ", uomName=" + uomName
				+ "]";
	}

}
