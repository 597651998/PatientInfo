package org.com.model;

import java.util.Date;

public class PatientInfo {
private String id;
//患者pojo
private String patientName;
//身份证号
private String idNumber;
private String sex;
private String birthday;
//所属角色
private String userId;
//电话
private String tel;
//家庭住址
private String patientDesc;

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPatientName() {
	return patientName;
}
public void setPatientName(String patientName) {
	this.patientName = patientName;
}
public String getIdNumber() {
	return idNumber;
}
public void setIdNumber(String idNumber) {
	this.idNumber = idNumber;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getBirthday() {
	return birthday;
}
public void setBirthday(String birthday) {
	this.birthday = birthday;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getPatientDesc() {
	return patientDesc;
}
public void setPatientDesc(String patientDesc) {
	this.patientDesc = patientDesc;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}


}
