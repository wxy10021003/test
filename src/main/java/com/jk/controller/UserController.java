package com.jk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.User;
import com.jk.service.IUserService;

@Controller
@RequestMapping("userController")
public class UserController {

	@RequestMapping(value="/toAdd")
	public String toAdd(){
		return "addlist";
	}

	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("queryUserPage")
	@ResponseBody
	public Object queryUserPage(String username,int page,int rows){
		JSONObject json = userService.queryUserPage(username,page,rows);
		return json;
	}
	
	//ɾ��
		@RequestMapping(value="/delUser")
		@ResponseBody
		public String delUser(Integer userid){
			userService.delUser(userid);
			return "delSuccess";	
		}	
		//����ɾ��
		@RequestMapping(value="/delUsers")
		@ResponseBody
		public Object delUsers(String ids){
			
			return userService.delUsers(ids);
		}
		
		//����----------------------------------------------------------------------
			@RequestMapping(value="/addUser")
			@ResponseBody
			public String addUser(User user){
				userService.addUser(user);
				return "addSuccess";
			}
}
