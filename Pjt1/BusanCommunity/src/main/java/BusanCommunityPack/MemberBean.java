package BusanCommunityPack;

public class MemberBean {
	
	private String id;
	private String pw;
	private String mobile;
	private String regDate;
	private String pwResetDate;
	private String profileImage;

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getPwResetDate() {
		return pwResetDate;
	}
	
	public void setPwResetDate(String pwResetDate) {
		this.pwResetDate = pwResetDate;
	}
	
	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	
}