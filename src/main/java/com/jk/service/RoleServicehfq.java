package com.jk.service;

import java.util.List;

import com.jk.model.Role;


public interface RoleServicehfq {

	List<Role> roles();

	void addRoleUserRelation(String roleId, String userId);

}
