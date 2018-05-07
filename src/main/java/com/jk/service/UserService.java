  
package com.jk.service;


import javax.servlet.http.HttpSession;


import com.jk.model.User;



public interface UserService {


	Integer login(User user, HttpSession session);

	


}
