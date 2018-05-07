package com.jk.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk.dao.IRoleDaohfq;
import com.jk.model.Role;
import com.jk.service.RoleServicehfq;

@Service
public class RoleServiceImplhfq implements RoleServicehfq {
	@Autowired
	private IRoleDaohfq roleDao;

	public List<Role> roles() {
		// TODO Auto-generated method stub
		return roleDao.roles();
	}

	
	public void addRoleUserRelation(String roleId, String userId) {
		roleDao.deleteUserRoleReation(userId);
		String[] ids =roleId.split(",");
		
		List<Map<String,Object>> map =new ArrayList<Map<String, Object>>();
		
		for (int i = 0; i < ids.length; i++) {
			Map<String,Object> maps=new HashMap<String, Object>();
			maps.put("userId", userId);
			maps.put("roleId", ids[i].trim());
			map.add(maps);
		}
		roleDao.addRoleUserRelation(map);
	}

}
