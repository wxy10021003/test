package com.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.DeptCongDao;
import com.jk.model.DeptCong;
import com.jk.model.Role;
import com.jk.service.IDeptCongService;

@Service
public class DeptCongServiceImpl implements IDeptCongService {
	 @Autowired
	 private DeptCongDao deptCongDao;

	public JSONObject queryDeptCount(int page, int rows,DeptCong deptcong) {
		// TODO Auto-generated method stub
	      //分页查询
			//查询总条数
			long total = deptCongDao.selectCount(deptcong);
			//计算开始位置和结束位置
			int start = (page-1)*rows;
			List<Role> list=deptCongDao.queryDeptCountList(start,rows,deptcong);
			JSONObject json =new JSONObject();
			json.put("total", total);
			json.put("rows", list);
			
			return json;
	}

}
