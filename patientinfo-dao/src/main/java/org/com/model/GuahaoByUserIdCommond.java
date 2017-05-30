package org.com.model;

/**
 * 挂号信息展示
 * 
 * @author wn
 *
 */
public class GuahaoByUserIdCommond {

	// 挂号信息的id
	private String guahao_id;

	// 挂号医生的名称
	private String doctorName;

	// 挂号信息的科室
	private String officeName;

	// 挂号信息的医院
	private String doctorhospital;

	// 挂号信息的消费
	private String guahaomoney;

	// 挂号信息的时间
	private String quren_guahaotime;

	public String getGuahao_id() {
		return guahao_id;
	}

	public void setGuahao_id(String guahao_id) {
		this.guahao_id = guahao_id;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
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

	public String getQuren_guahaotime() {
		return quren_guahaotime;
	}

	public void setQuren_guahaotime(String quren_guahaotime) {
		this.quren_guahaotime = quren_guahaotime;
	}

	@Override
	public String toString() {
		return "GuahaoByUserIdCommond [guahao_id=" + guahao_id + ", doctorName=" + doctorName + ", officeName="
				+ officeName + ", doctorhospital=" + doctorhospital + ", guahaomoney=" + guahaomoney
				+ ", quren_guahaotime=" + quren_guahaotime + "]";
	}

}
