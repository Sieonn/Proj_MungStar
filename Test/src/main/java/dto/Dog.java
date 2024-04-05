package dto;

public class Dog {
	private String dogName;
	private int dogNum;
	private String memId;
	private int dogAge;
	private String dogGender;
	private String dogProfile;

	public Dog() {}
	public Dog(String dogName, String memId, int dogAge, String dogGender, String dogProfile) {
		super();
		this.memId = memId;
		this.dogName = dogName;
		this.dogAge = dogAge;
		this.dogGender = dogGender;
		this.dogProfile = dogProfile;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public int getDogNum() {
		return dogNum;
	}

	public void setDogNum(int dogNum) {
		this.dogNum = dogNum;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getDogAge() {
		return dogAge;
	}

	public void setDogAge(int dogAge) {
		this.dogAge = dogAge;
	}

	public String getDogGender() {
		return dogGender;
	}

	public void setDogGender(String dogGender) {
		this.dogGender = dogGender;
	}

	public String getDogProfile() {
		return dogProfile;
	}

	public void setDogProfile(String dogProfile) {
		this.dogProfile = dogProfile;
	}

	@Override
	public String toString() {
		return "Dog [dogName=" + dogName + ", dogNum=" + dogNum + ", memId=" + memId + ", dogAge=" + dogAge
				+ ", dogGender=" + dogGender + ", dogProfile=" + dogProfile + "]";
	}

}
