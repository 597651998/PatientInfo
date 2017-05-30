package org.com.model;

public class DoctorGuahao {

	private String doctorName; // 医生名称

	private String doctor_id; // 医生id

	private String officeName; // 医生名称

	private String timeDesc; // 医生时间信息

	private String doctorhospital; // 医生归属医院
	
	private String guahaomoney;//费用

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getDoctor_id() {
		return doctor_id;
	}

	public void setDoctor_id(String doctor_id) {
		this.doctor_id = doctor_id;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	public String getTimeDesc() {
		return timeDesc;
	}

	public void setTimeDesc(String timeDesc) {
		this.timeDesc = timeDesc;
	}

	public String getDoctorhospital() {
		return doctorhospital;
	}

	public void setDoctorhospital(String doctorhospital) {
		this.doctorhospital = doctorhospital;
	}
	
	

	public String getGuahaomoney() {
		return guahaomoney;
	}

	public void setGuahaomoney(String guahaomoney) {
		this.guahaomoney = guahaomoney;
	}

	@Override
	public String toString() {
		return "DoctorGuahao [doctorName=" + doctorName + ", doctor_id=" + doctor_id + ", officeName=" + officeName
				+ ", timeDesc=" + timeDesc + ", doctorhospital=" + doctorhospital + "]";
	}

}
