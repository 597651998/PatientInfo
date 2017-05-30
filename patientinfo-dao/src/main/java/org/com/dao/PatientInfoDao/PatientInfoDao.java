package org.com.dao.PatientInfoDao;


import java.util.List;

import org.com.model.GuaHao;
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
}
