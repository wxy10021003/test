  
package com.jk.service;


import java.util.List;

import javax.servlet.http.HttpSession;


import com.jk.model.UserLogin;



public interface LoginService {


	Integer login(UserLogin user, HttpSession session);

	List queryUserLoginByName(UserLogin user);

	void saveUserLogin(UserLogin user);




}
