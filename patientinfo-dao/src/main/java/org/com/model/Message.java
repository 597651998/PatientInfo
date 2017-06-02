package org.com.model;

public class Message {
	// 意见人id
	private String user_id;
	// 意见信息独立id
	private String message_id;
	// 意见人姓名
	private String guahaousername;
	// 医生姓名
	private String doctorName;
	//意见
	private String user_messageDesc;
	// 医院名称
	private String doctorhospital;
	// 信息逻辑删除
	private String message_flag;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMessage_id() {
		return message_id;
	}
	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}
	public String getGuahaousername() {
		return guahaousername;
	}
	public void setGuahaousername(String guahaousername) {
		this.guahaousername = guahaousername;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getDoctorhospital() {
		return doctorhospital;
	}
	public void setDoctorhospital(String doctorhospital) {
		this.doctorhospital = doctorhospital;
	}
	public String getMessage_flag() {
		return message_flag;
	}
	public void setMessage_flag(String message_flag) {
		this.message_flag = message_flag;
	}
	
	public String getUser_messageDesc() {
		return user_messageDesc;
	}
	public void setUser_messageDesc(String user_messageDesc) {
		this.user_messageDesc = user_messageDesc;
	}
	@Override
	public String toString() {
		return "Message [user_id=" + user_id + ", message_id=" + message_id + ", guahaousername=" + guahaousername
				+ ", doctorName=" + doctorName + ", doctorhospital=" + doctorhospital + ", message_flag=" + message_flag
				+ "]";
	}
	
	
}
