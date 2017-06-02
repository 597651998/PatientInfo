package org.com.dao.guahaoDao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.com.model.DoctorGuahao;
import org.com.model.DoctorinfoUserCommond;
import org.com.model.GuaHao;
import org.com.model.GuahaoUser;
import org.com.model.HospitalInfo;
import org.com.model.Message;
import org.com.model.PatientInfo;

public interface GuaHaoDao {
	// 新增挂号信息
	public void guahaoAdd(GuaHao guahao) throws Exception;

	// 查询所有信息
	public List<GuaHao> guahao_list() throws Exception;

	// 批量删除
	public void guahaoDel(List list) throws Exception;

	// 批量删除
	public void DoctorDel(List list) throws Exception;

	// 修改
	public void guahao_upd(GuaHao guahao) throws Exception;

	// 新增用户信息
	public void guahao_User_save(GuahaoUser guahao) throws Exception;

	// 根据医院查询挂号信息
	public List<DoctorGuahao> DoctorGuahao_list(DoctorGuahao doctorhospital) throws Exception;

	// 查询已有的医院
	public List<HospitalInfo> findhostpital_list() throws Exception;

	// 添加一个挂号单
	public void guahaoinfo_save(DoctorinfoUserCommond infoUserCommond) throws Exception;

	/**
	 * 根据用户id查询挂号的订单
	 */
	@Select("select * from t_guahaoinfo	where guahao_flag = '1' and user_id=#{value}")
	public List<DoctorinfoUserCommond> finguahaoinfonByUserId(String user_id);

	/**
	 * 根据用户id查询挂号的医生
	 */
	@Select("select * from t_guahao_doctor	where  doctor_id=#{value}")
	public DoctorGuahao findDoctorinfonByd_Id(String d_id);

	/**
	 * 根据用户id查询挂号的医生
	 */
	@Update("UPDATE t_guahaoinfo SET guahao_flag = '2' WHERE guahao_id = #{value} ")
	public void deleteguahaoinfonById(String id);

	/**
	 * 根据用户id查询挂号的医生
	 */
	@Update("UPDATE t_message SET message_flag = '2' WHERE message_id = #{value} ")
	public void deletemessageinfonById(String id);

	/**
	 * 根据用户id修改挂号的医生
	 */
	public void updateguahaoinfonById(GuahaoUser guahaoUser);

	/**
	 * 根据用户id修改挂号的医生
	 */
	@Select("select * from t_guahao_user	where  user_id=#{value}")
	public GuahaoUser findguahaoinfonByUserId(String id);

	/**
	 * 根据用户id修改挂号的医生
	 */
	@Select("select * from t_guahao_doctor where doctor_flag = '1'")
	public List<DoctorGuahao> findAlldoctor();

	@Insert("insert into t_guahao_doctor "
			+ "(doctorName, officeName, timeDesc, doctorhospital, guahaomoney, doctor_flag) "
			+ "values (#{doctorName}, #{officeName}, #{timeDesc}, #{doctorhospital}, #{guahaomoney}, #{doctor_flag})")
	public void doctorSave(DoctorGuahao doctorguahao);

	/**
	 * 查询所有信息
	 * 
	 * @param id
	 */
	@Select("select * from t_message where message_flag = '1' and user_id =#{value} ")
	public List<Message> finAllMessage(String id);

	/**
	 * 查询投诉信息
	 * 
	 * @param id
	 */
	@Select("select * from t_message where message_flag = '1' and message_id =#{value} ")
	public Message findmessageByid(String id);

}
