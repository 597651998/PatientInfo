package org.com.dao.UserDao;

import java.util.List;

import org.com.model.GuahaoUser;
import org.com.model.User;



public interface UserDao {

	//获取所有的用户
	public List<User> userList() throws Exception;
	
	//查询单个用户的名字
	public User selectByuserId(String userId)throws Exception;
	
	//校验密码
	public GuahaoUser QueryUserByName(String userName)throws Exception;
}
