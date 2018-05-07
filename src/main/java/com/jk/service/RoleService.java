package com.jk.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Role;
import com.jk.model.Tree;



public interface RoleService {

	JSONObject roleList(int page, int rows, Role role);

	List<Tree> addcharolemenulist(Integer roid);

	List addchamenulist();

	void roleService(Integer roid);

	void saverolemenulist(int parseInt, Integer roid);

	

}
