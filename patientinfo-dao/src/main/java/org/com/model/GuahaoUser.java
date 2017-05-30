package org.com.model;

public class GuahaoUser {

	private String user_id; // 序列号区分用户

	private String guahaousername;// 挂号人姓名

	private String guahaopassword;// 注册密码

	private String idCard;// 挂号人身份证号

	private String phoneNumber;// 挂号人手机号

	private String isReally;// 是否同意条约

	private String guahao_Desc;// 挂号的信息

	private String guahaoemail;// 邮箱

	private String isManager; // 是否是管理员

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGuahaousername() {
		return guahaousername;
	}

	public void setGuahaousername(String guahaousername) {
		this.guahaousername = guahaousername;
	}

	public String getGuahaopassword() {
		return guahaopassword;
	}

	public void setGuahaopassword(String guahaopassword) {
		this.guahaopassword = guahaopassword;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getIsReally() {
		return isReally;
	}

	public void setIsReally(String isReally) {
		this.isReally = isReally;
	}

	public String getGuahao_Desc() {
		return guahao_Desc;
	}

	public void setGuahao_Desc(String guahao_Desc) {
		this.guahao_Desc = guahao_Desc;
	}

	public String getGuahaoemail() {
		return guahaoemail;
	}

	public void setGuahaoemail(String guahaoemail) {
		this.guahaoemail = guahaoemail;
	}

	public String getIsManager() {
		return isManager;
	}

	public void setIsManager(String isManager) {
		this.isManager = isManager;
	}

}
