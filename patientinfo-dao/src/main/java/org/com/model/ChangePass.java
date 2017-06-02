package org.com.model;

public class ChangePass {
	/** 修改的用戶id */
	private String user_id;
	
	/** 修改的用戶原密碼 */
	private String old_pass;
	
	/** 修改的用戶新密码 */
	private String new_pass;
	
	/** 修改的用戶确认密码 */
	private String confirm_pass;
	

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getOld_pass() {
		return old_pass;
	}

	public void setOld_pass(String old_pass) {
		this.old_pass = old_pass;
	}

	public String getNew_pass() {
		return new_pass;
	}

	public void setNew_pass(String new_pass) {
		this.new_pass = new_pass;
	}

	public String getConfirm_pass() {
		return confirm_pass;
	}

	public void setConfirm_pass(String confirm_pass) {
		this.confirm_pass = confirm_pass;
	}

	@Override
	public String toString() {
		return "ChangePass [user_id=" + user_id + ", old_pass=" + old_pass + ", new_pass=" + new_pass
				+ ", confirm_pass=" + confirm_pass + "]";
	}
	
	
}
