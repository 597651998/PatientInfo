package org.com.dao.PatientInfoDao;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.com.model.ChangePass;
import org.com.model.GuaHao;
import org.com.model.Message;
import org.com.model.PatientInfo;
import org.com.model.PatientInfoVo;
import org.com.model.User;



public interface PatientInfoDao {
	//添加所属患者信息
	public void patientSave(PatientInfo patientInfo) throws Exception;
	
	public List<User> user_list() throws Exception;
	
	public List<PatientInfoVo> patients_list() throws Exception;
	
	public void patientDel(String id) throws Exception;
	
	public void updatePatient(PatientInfoVo patientinfovo)throws Exception;
	
	public List<PatientInfo> patient_idlist()throws Exception;

	public PatientInfo selectByPatientName(String id);

	@Insert("insert into t_message "
			+ "(user_id,doctorhospital, doctorName, user_messageDesc, guahaousername, message_flag) "
			+ "values (#{user_id},#{doctorhospital}, #{doctorName}, #{user_messageDesc}, #{guahaousername}, #{message_flag})")
	public void saveMessage(Message message);

	@Update("UPDATE t_guahao_user SET guahaopassword =#{new_pass} where user_id=#{user_id}")
	public void updateUserPass(ChangePass chapass);
}
