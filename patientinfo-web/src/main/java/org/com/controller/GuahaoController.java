package org.com.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.com.dao.PatientInfoDao.PatientInfoDao;
import org.com.dao.UserDao.UserDao;
import org.com.dao.guahaoDao.GuaHaoDao;
import org.com.model.User;
import org.com.model.DoctorGuahao;
import org.com.model.DoctorinfoUserCommond;
import org.com.model.GuaHao;
import org.com.model.GuahaoUser;
import org.com.model.HospitalInfo;
import org.com.model.PatientInfo;
import org.com.model.PatientInfoVo;
import org.com.util.StringUtil;
import org.omg.PortableInterceptor.SUCCESSFUL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class GuahaoController {

	@Autowired
	private GuaHaoDao guahaodao;

	@Autowired
	private PatientInfoDao patientdao;

	@Autowired
	private UserDao userdao;

	private String findDoctorByid;
	/**
	 * 添加挂号的病人
	 * 
	 * @param patient
	 * @return
	 * @throws Exception
	 */
	// 删除可以改为逻辑删除，给数据设置一个属性，当改属性为1时前端展示，2时不展示，此时删除直接修改12即可
	@RequestMapping(value = "/gh_save")
	public @ResponseBody Object gh_save(GuaHao guahao) throws Exception {
		String code = StringUtil.getCode(10, 0);
		String id = guahao.getPatientName();
		PatientInfo GuaHaopatient = patientdao.selectByPatientName(id);
		User user = userdao.selectByuserId(GuaHaopatient.getUserId());
		guahao.setG_Id(code);
		guahao.setId(GuaHaopatient.getId());
		guahao.setIdNumber(GuaHaopatient.getIdNumber());
		guahao.setSex(GuaHaopatient.getSex());
		guahao.setPatientName(GuaHaopatient.getPatientName());
		guahao.setUserName(user.getUserName());
		guahaodao.guahaoAdd(guahao);
		return null;
	}

	// 所有患者id列表
	@RequestMapping(value = "/guahao_list")
	public @ResponseBody Object guahao_list() throws Exception {
		List<GuaHao> guahaoList = guahaodao.guahao_list();
		return guahaoList;
	}

	@RequestMapping(value = "/guahao_del")
	public @ResponseBody Object patient_del(String[] id) throws Exception {
		List list = Arrays.asList(id);
		guahaodao.guahaoDel(list);
		return null;
	}

	/**
	 * 修改选中的病人
	 * 
	 * @param patient
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/guahao_upd")
	public @ResponseBody Object guahao_upd(GuaHao guahao) throws Exception {
		guahaodao.guahao_upd(guahao);
		return null;
	}

	/**
	 * 用户输入挂号的信息并存入数据库
	 * 
	 * @param guahao
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/index_guahao")
	public  Object guahao_user(GuahaoUser guahao,Model model) throws Exception {
		// 生成序列号区分用户
		String code = StringUtil.getCode(10, 0);
		guahao.setUser_id(code);
		//guahaodao.guahao_User_save(guahao);
		findDoctorByid =code;
		//把即将要挂号的用户传递前端
		model.addAttribute("User", guahao);
		return "index_findyiyuan";
	}
	
	/**
	 * 展示所有医院
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/index_findAllhospital")
	public @ResponseBody Object findAllhospital() throws Exception {
		return guahaodao.findhostpital_list();
	}
	
	/**
	 * 选择医生并存入数据库
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/index_findByhospital")
	public @ResponseBody Object guahao_findDoctor(String hospitalName) throws Exception {
		DoctorGuahao dos = new DoctorGuahao();
		dos.setDoctorhospital(hospitalName);
		List<DoctorGuahao> lsi = guahaodao.DoctorGuahao_list(dos);
		return lsi;
				
	}
	
	/**
	 * 选择医生并存入数据库，添加一个挂号单
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/index_guahaosaveinfo")
	public @ResponseBody Object guahao_saveinfo(DoctorinfoUserCommond infoUserCommond,HttpSession session) throws Exception {
		// 生成序列号区分挂号单
		String code = StringUtil.getCode(10, 0);
		
		GuahaoUser attribute = (GuahaoUser) session.getAttribute("userinfo");
		infoUserCommond.setUser_id(attribute.getUser_id());
		infoUserCommond.setGuahao_id(code);
		infoUserCommond.setGuahao_flag("1");
		guahaodao.guahaoinfo_save(infoUserCommond);
		return "success";
				
	}
}