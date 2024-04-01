package dto;

import java.sql.Date;

public class Temp {
	private Integer tempNum;
	private String tempName;
	private String tempAddress;
	private Date tempWriteDate;
	private Date protectDate;
	private String tempChar;
	private String tempEtc;
	private String tempPhoto;
	private String tempCgory;
	private String memId;
	
	public Temp() {
		super();
	}
	
	public Temp(Integer tempNum, String tempName, String tempAddress, Date tempWriteDate, Date protectDate,
			String tempChar, String tempEtc, String tempPhoto, String tempCgory, String memId) {
		super();
		this.tempNum = tempNum;
		this.tempName = tempName;
		this.tempAddress = tempAddress;
		this.tempWriteDate = tempWriteDate;
		this.protectDate = protectDate;
		this.tempChar = tempChar;
		this.tempEtc = tempEtc;
		this.tempPhoto = tempPhoto;
		this.tempCgory = tempCgory;
		this.memId = memId;
	}

	public Integer getTempNum() {
		return tempNum;
	}
	public void setTempNum(Integer tempNum) {
		this.tempNum = tempNum;
	}
	public String getTempName() {
		return tempName;
	}
	public void setTempName(String tempName) {
		this.tempName = tempName;
	}
	public String getTempAddress() {
		return tempAddress;
	}
	public void setTempAddress(String tempAddress) {
		this.tempAddress = tempAddress;
	}
	public Date getTempWriteDate() {
		return tempWriteDate;
	}
	public void setTempWriteDate(Date tempWriteDate) {
		this.tempWriteDate = tempWriteDate;
	}
	public Date getProtectDate() {
		return protectDate;
	}
	public void setProtectDate(Date protectDate) {
		this.protectDate = protectDate;
	}
	public String getTempChar() {
		return tempChar;
	}
	public void setTempChar(String tempChar) {
		this.tempChar = tempChar;
	}
	public String getTempEtc() {
		return tempEtc;
	}
	public void setTempEtc(String tempEtc) {
		this.tempEtc = tempEtc;
	}
	public String getTempPhoto() {
		return tempPhoto;
	}
	public void setTempPhoto(String tempPhoto) {
		this.tempPhoto = tempPhoto;
	}
	public String getTempCgory() {
		return tempCgory;
	}
	public void setTempCgory(String tempCgory) {
		this.tempCgory = tempCgory;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	
}
