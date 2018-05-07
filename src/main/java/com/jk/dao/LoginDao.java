  package com.jk.dao;

import java.util.List;

import com.jk.model.UserLogin;


public interface LoginDao {

	//登录
	UserLogin queryuserByname(String name);
	//注册
	List queryUserLoginByName(UserLogin user);

	void saveUserLogin(UserLogin user);

}
