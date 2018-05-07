 
package com.jk.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.LoginDao;
import com.jk.model.UserLogin;
import com.jk.service.LoginService;


@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDao userDao;

	/* (non-Javadoc)    
	 * @see com.ljl.service.UserService#login(com.ljl.model.User, javax.servlet.http.HttpSession)    
	 */
	//@Override
	public Integer login(UserLogin user,HttpSession session) {
		//先判断是否为空
		if(user != null){
			//获取前台传过来的用户名
			//0:用户名错误  1：密码错误 2：登录成功 3:用户名不能为空
			if(user.getUsername() !=null && !"".equals(user.getUsername())){
				//通过用户名去后台查询
				String name=user.getUsername();
				UserLogin username=userDao.queryuserByname(name);
				if(username !=null){
					String pwd=user.getUserpwd();
					if(username.getUserpwd().equals(pwd)){
						//登录成功
						//如果是登录成功
//						从map中get出来用户对象 存到session中
						session.setAttribute("userID", username.getUserid());
						session.setAttribute("loginName", username.getUsername());
						session.setAttribute("loginN", username.getLoginname());
						
						return  2;
					}
					//密码错误
					return 1;
				}
			}
			//用户名不存在
			return 0;
		}
		//用户名不能为空
		return 3;
	}

	
	
	//@Override
	public List queryUserLoginByName(UserLogin user) {
		return userDao.queryUserLoginByName(user);
	}

	//@Override
	public void saveUserLogin(UserLogin user) {
		userDao.saveUserLogin(user);
	}

	
}
