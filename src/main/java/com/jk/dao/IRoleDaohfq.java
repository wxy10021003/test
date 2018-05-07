package com.jk.dao;

import java.util.List;
import java.util.Map;

import com.jk.model.Role;

public interface IRoleDaohfq {
    int deleteByPrimaryKey(String id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	List<Role> roles();

	void deleteUserRoleReation(String userId);

	void addRoleUserRelation(List<Map<String, Object>> map);
	
	
}