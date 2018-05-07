package com.jk.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.RoleDao;
import com.jk.model.Role;
import com.jk.model.Tree;
import com.jk.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	
	@Autowired
	private RoleDao roleDao;

	public JSONObject roleList(int page, int rows, Role role) {
		// TODO Auto-generated method stub
		      //分页查询
				//查询总条数
				long total = roleDao.selectCount(role);
				//计算开始位置和结束位置
				int start = (page-1)*rows;
				List<Role> list=roleDao.roleList(start,rows,role);
				
				JSONObject json =new JSONObject();
				json.put("total", total);
				json.put("rows", list);
				
				return json;
	}

	public List<Tree> addcharolemenulist(Integer roid) {
		// TODO Auto-generated method stub
		return roleDao.addcharolemenulist(roid);	}

	public List addchamenulist() {
		// TODO Auto-generated method stub
		return roleDao.addchamenulist();
	}

	public void roleService(Integer roid) {
		// TODO Auto-generated method stub
		roleDao.roleService(roid);
	}

	public void saverolemenulist(int parseInt, Integer roid) {
		// TODO Auto-generated method stub
		roleDao.saverolemenulist(parseInt,  roid);
	}

}
