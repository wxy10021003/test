
package com.jk.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk.model.UserLogin;
import com.jk.service.LoginService;

@Controller
@RequestMapping("UserController")
public class LoginController {
	
	@Autowired
	private LoginService userService;   
	
	
	//登录
	@RequestMapping("login")
	@ResponseBody
	public Integer login(UserLogin user,HttpSession session){
		Integer i=userService.login(user,session);
		return i;
	}
	
	//注册
	@RequestMapping("queryUserLoginByName")
	@ResponseBody
	public int queryUserLoginByName(UserLogin user){
		List list=userService.queryUserLoginByName(user);
		if(list.size()>0){
			return 1;				
		}else{
			userService.saveUserLogin(user);
			return 2;				
		}
	}



}
