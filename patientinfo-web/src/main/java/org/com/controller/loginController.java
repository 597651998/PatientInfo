package org.com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.zookeeper.server.Request;
import org.apache.zookeeper.server.SessionTracker.Session;
import org.com.constant.ChangePassConstant;
import org.com.dao.PatientInfoDao.PatientInfoDao;
import org.com.dao.UserDao.UserDao;
import org.com.dao.guahaoDao.GuaHaoDao;
import org.com.model.User;
import org.com.model.ChangePass;
import org.com.model.DoctorGuahao;
import org.com.model.DoctorinfoUserCommond;
import org.com.model.GuahaoByUserIdCommond;
import org.com.model.GuahaoUser;
import org.com.model.Message;
import org.com.model.PatientInfo;
import org.com.model.PatientInfoVo;
import org.com.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class loginController {

	@Autowired
	private UserDao userdao;

	@Autowired
	private PatientInfoDao patientdao;

	@Autowired
	private GuaHaoDao guahaodao;

	private static GuahaoUser guahaoUser1;

	/**
	 * 用户注册
	 * 
	 * @param guahaoUser
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/regist")
	public Object regist(GuahaoUser guahaoUser) throws Exception {
		// 生成序列号区分用户
		String code = StringUtil.getCode(10, 0);
		guahaoUser.setUser_id(code);
		guahaoUser.setIsManager("no");
		guahaodao.guahao_User_save(guahaoUser);
		return "success";
	}

	/**
	 * 校验密码
	 * 
	 * @param userName
	 * @param password
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login")
	public @ResponseBody Object login(GuahaoUser guahaoUser, Model model, HttpSession session) throws Exception {
		String str;
		GuahaoUser userinfo = userdao.QueryUserByName(guahaoUser.getGuahaousername());
		if (userinfo == null) {
			return "nousernmae";
		} else {
			if (userinfo.getGuahaopassword().equals(guahaoUser.getGuahaopassword())) {
				if (userinfo.getIsManager().equals("on")) {
					str = "managersuccess";
					return str;
				} else if (userinfo.getIsManager().equals("on") == false) {
					str = "nopower";
					session.setAttribute("userinfo", userinfo);
					return str;
				} else if (guahaoUser.getIsManager().equals("")) {
					str = "usersuccess";
					session.setAttribute("userinfo", userinfo);
					return str;
				} else {
					str = "can't find error";
					return str;
				}
			} else {
				str = "errorpass";
				return str;
			}
		}
	}

	@RequestMapping(value = "/show/login")
	public Object showpage() throws Exception {
		return "main";
	}

	/**
	 * 个人中心
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/myselfMessage")
	public Object showpagegeren(HttpSession session,Model model) throws Exception {
		// 创建一个展示个人挂号信息的集合
		List<GuahaoByUserIdCommond> listinfoUser = new ArrayList<>();
		GuahaoUser attribute = (GuahaoUser) session.getAttribute("userinfo");
		
		if(attribute==null){
			return"timeout";
		}
		String user_id = attribute.getUser_id();
		String d_id;
		List<DoctorinfoUserCommond> list = guahaodao.finguahaoinfonByUserId(user_id);
		for (DoctorinfoUserCommond doctorinfoUserCommond : list) {
			d_id = doctorinfoUserCommond.getDoctor_id();
			saveCommond(d_id, doctorinfoUserCommond, listinfoUser);
		}
		//绑定提交的意见
		List<Message> idearsinfo= guahaodao.finAllMessage(attribute.getUser_id());
		model.addAttribute("idearsinfo",idearsinfo);
		
		model.addAttribute("messasgeinfo", listinfoUser);
		return "showmyselfMessage";
	}
	/**
	 * 个人中心删除挂号信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/deletemyselfMessage")
	@ResponseBody
	public String deleteGuahaoInfo(String id) throws Exception {
		guahaodao.deleteguahaoinfonById(id);
		return "delesuccess";
	}
	
	
	/**
	 * 个人中心删除挂号信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/deletemyselfideaMessage")
	@ResponseBody
	public String deletemyselfideaMessage(String id) throws Exception {
		guahaodao.deletemessageinfonById(id);
		return "delesuccess";
	}
	
	/**
	 * 查看详情
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/findmessageByid")
	@ResponseBody
	public Message findmessageByid(String id) throws Exception {
		Message message=	guahaodao.findmessageByid(id);
		return message;
	}
	/**
	 * 个人中心修改挂号信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/show/updatemyselfMessage")
	@ResponseBody
	public String updatemyselfMessage(GuahaoUser guahaoUser,HttpSession session) throws Exception {
		guahaodao.updateguahaoinfonById(guahaoUser);
		GuahaoUser user = guahaodao.findguahaoinfonByUserId(guahaoUser.getUser_id());
		session.setAttribute("userinfo", user);
		return "updsuccess";
	}
	
	// 把数据保存成一个展示的对象
	private void saveCommond(String d_id, DoctorinfoUserCommond doctorinfoUserCommond,
			List<GuahaoByUserIdCommond> listinfoUser) {
		DoctorGuahao doctor = guahaodao.findDoctorinfonByd_Id(d_id);
		GuahaoByUserIdCommond guahaoByUserIdCommond = new GuahaoByUserIdCommond();
		guahaoByUserIdCommond.setDoctorhospital(doctor.getDoctorhospital());
		guahaoByUserIdCommond.setDoctorName(doctor.getDoctorName());
		guahaoByUserIdCommond.setGuahao_id(doctorinfoUserCommond.getGuahao_id());
		guahaoByUserIdCommond.setGuahaomoney(doctor.getGuahaomoney());
		guahaoByUserIdCommond.setOfficeName(doctor.getOfficeName());
		guahaoByUserIdCommond.setQuren_guahaotime(doctorinfoUserCommond.getQuren_guahaotime());
		listinfoUser.add(guahaoByUserIdCommond);
	}

	@RequestMapping(value = "/patient_username")
	public Object patient_username(String userName, String password) {
		return null;
	}

	// 所属用户列表
	@RequestMapping(value = "/patient_submitpatient")
	public @ResponseBody Object patient_submitpatient(String userName, String password) throws Exception {
		List<User> userList = userdao.userList();
		return userList;
	}

	// 所有患者id列表
	@RequestMapping(value = "/patient_idlist")
	public @ResponseBody Object patient_idlist() throws Exception {
		List<PatientInfo> patientList = patientdao.patient_idlist();
		return patientList;
	}

	/**
	 * 新增患者
	 * 
	 * @param patient
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/patientSave")
	public @ResponseBody Object patientSave(PatientInfo patient) throws Exception {
		patientdao.patientSave(patient);
		return null;
	}

	// 搜索所需要的数据
	@RequestMapping(value = "/patients_list")
	public @ResponseBody Object patients_list(PatientInfo patient) throws Exception {
		// 由于数据库设计错误，不得已在control处理数据
		List<User> user_list = patientdao.user_list();
		List<PatientInfoVo> patients_list = patientdao.patients_list();
		// 包装类，继承patientinfo父类的属性和方法，同时增加一个userName属性
		List<PatientInfoVo> patients_list_new = new ArrayList<>();
		// 拿到第一个类，得到id，去查对应的用户的id
		for (int i = 0; i < patients_list.size(); i++) {
			PatientInfoVo patientInfoVo = patients_list.get(i);
			String userId = patientInfoVo.getUserId();
			for (int j = 0; j < user_list.size(); j++) {
				// 如果相等，就把对应用户的名字设置给该类，放入新的list并跳出循环，否则继续执行第二个for
				User user = user_list.get(j);
				String userId2 = String.valueOf(user.getUserId());
				if (userId.equals(userId2)) {
					patientInfoVo.setUserName(user.getUserName());
					patients_list_new.add(patientInfoVo);
					break;
				}
			}
		}
		return patients_list_new;
	}

	/**
	 * 删除选中的病人
	 * 
	 * @param patient
	 * @return
	 * @throws Exception
	 */
	// 删除可以改为逻辑删除，给数据设置一个属性，当改属性为1时前端展示，2时不展示，此时删除直接修改12即可
	@RequestMapping(value = "/patient_del")
	public @ResponseBody Object patient_del(String id) throws Exception {
		patientdao.patientDel(id);
		return null;
	}

	/**
	 * 修改选中的病人
	 * 
	 * @param patient
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updatePatient")
	public @ResponseBody Object updatePatient(PatientInfoVo patientinfovo) throws Exception {
		patientdao.updatePatient(patientinfovo);
		return null;
	}
	
	/**
	 * 意见与反馈
	 */
	@RequestMapping(value = "/saveMessage")
	public  Object saveMessage(Message message,HttpSession session) throws Exception {
		GuahaoUser userinfo=(GuahaoUser) session.getAttribute("userinfo");
		message.setUser_id(userinfo.getUser_id());
		message.setMessage_flag("1");
		patientdao.saveMessage(message);
		return "successmessage";
	}
	
	/**
	 * 修改密码
	 */
	@RequestMapping(value = "/show/cheganemyselfpass")
	@ResponseBody
	public  Object cheganemyselfpass(Message message,HttpSession session,ChangePass changepass) throws Exception {
		GuahaoUser userinfo=(GuahaoUser) session.getAttribute("userinfo");
		if(userinfo.getUser_id()==null){
			return ChangePassConstant.LOGIN_TIME_OUT;
		}else{
			changepass.setUser_id(userinfo.getUser_id());
		}
		if(changepass.getOld_pass().equals(userinfo.getGuahaopassword())){
			patientdao.updateUserPass(changepass);
			return ChangePassConstant.CHANGE_PASS_SUCCESS;
		}else{
			return ChangePassConstant.OLD_PASS_ERROR;
		}
	}
}