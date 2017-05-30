package org.com.model;

import java.util.Date;
public class GuaHao {
	//编号 
	private String	g_Id;
	//流水号 
	private String	g_No;
	//患者ID 
	private String	id;
	//所属用户 
	private String	userName;
	//性别 
	private String	sex;
	//身份证号 
	private String	idNumber;
	//患者姓名 
	private String	patientName;
	//选择日期 
	private String	g_tiem;
	//选择科室 
	private String	g_officeName;
	//患者备注 
	private String	g_Desc;
	
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getG_tiem() {
		return g_tiem;
	}
	public void setG_tiem(String g_tiem) {
		this.g_tiem = g_tiem;
	}
	public String getG_officeName() {
		return g_officeName;
	}
	public void setG_officeName(String g_officeName) {
		this.g_officeName = g_officeName;
	}
	public String getG_Desc() {
		return g_Desc;
	}
	public void setG_Desc(String g_Desc) {
		this.g_Desc = g_Desc;
	}
	public String getG_Id() {
		return g_Id;
	}
	public void setG_Id(String g_Id) {
		this.g_Id = g_Id;
	}
	public String getG_No() {
		return g_No;
	}
	public void setG_No(String g_No) {
		this.g_No = g_No;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	

}
