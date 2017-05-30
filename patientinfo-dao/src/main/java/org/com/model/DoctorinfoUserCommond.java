package org.com.model;

/**
 * 用来描述挂号信息
 * 
 * @author wang
 *
 */
public class DoctorinfoUserCommond {

	// 挂号单id
	private String guahao_id;

	// user用户的id
	private String user_id;

	// doctor用户的id
	private String doctor_id;

	// 获取时间
	private String quren_guahaotime;

	// guahao_flag逻辑删除挂号单
	private String guahao_flag;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getDoctor_id() {
		return doctor_id;
	}

	public void setDoctor_id(String doctor_id) {
		this.doctor_id = doctor_id;
	}

	public String getQuren_guahaotime() {
		return quren_guahaotime;
	}

	public void setQuren_guahaotime(String quren_guahaotime) {
		this.quren_guahaotime = quren_guahaotime;
	}

	public String getGuahao_id() {
		return guahao_id;
	}

	public void setGuahao_id(String guahao_id) {
		this.guahao_id = guahao_id;
	}

	public String getGuahao_flag() {
		return guahao_flag;
	}

	public void setGuahao_flag(String guahao_flag) {
		this.guahao_flag = guahao_flag;
	}

	@Override
	public String toString() {
		return "DoctorinfoUserCommond [guahao_id=" + guahao_id + ", user_id=" + user_id + ", doctor_id=" + doctor_id
				+ ", quren_guahaotime=" + quren_guahaotime + ", guahao_flag=" + guahao_flag + "]";
	}

}
