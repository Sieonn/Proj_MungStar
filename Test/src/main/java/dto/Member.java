package dto;

import java.sql.Date;

public class Member {
	private String membId;
	private String memNick;
	private String memPw;
	private String memPhone;
	private String memAddress1;
	private String memAddress2;
	private String memEmail;
	private String memType;
	private Date date;
	
	
	public Member() {
		super();
	}
	
	public Member(String membId, String memNick, String memPw, String memPhone, String memAddress1, String memAddress2,
			String memEmail, String memType, Date date) {
		super();
		this.membId = membId;
		this.memNick = memNick;
		this.memPw = memPw;
		this.memPhone = memPhone;
		this.memAddress1 = memAddress1;
		this.memAddress2 = memAddress2;
		this.memEmail = memEmail;
		this.memType = memType;
		this.date = date;
	}

	public String getMembId() {
		return membId;
	}
	public void setMembId(String membId) {
		this.membId = membId;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemAddress1() {
		return memAddress1;
	}
	public void setMemAddress1(String memAddress1) {
		this.memAddress1 = memAddress1;
	}
	public String getMemAddress2() {
		return memAddress2;
	}
	public void setMemAddress2(String memAddress2) {
		this.memAddress2 = memAddress2;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
