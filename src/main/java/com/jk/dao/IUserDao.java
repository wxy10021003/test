package com.jk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jk.model.User;

public interface IUserDao {

	long queryUserTotal(@Param("user") String username);

	List<User> queryUserPage(@Param("user") String username, @Param("s") int start, @Param("rows") int rows);

	void delUser(Integer userid);

	Object delUsers(@Param("ids") String ids);

	void addUser(User user);

	List<Map<String, Object>> getResourcesReList(User user);

}
