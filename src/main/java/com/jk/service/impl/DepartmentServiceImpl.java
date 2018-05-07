package com.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.DepartmentDao;
import com.jk.model.Department;
import com.jk.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentDao departmentDao;

	public JSONObject selectDeptList(Department dept, int page, int rows,String deptnam)
			throws Exception {
		if(deptnam!=null){
			deptnam="%"+deptnam+"%";
		}
		// TODO Auto-generated method stub
		//查询总记录数
		long total=departmentDao.queryDeptCount(dept,deptnam);
		//计算开始条数和结束条数
		int start=(page-1)*rows;
		List<Department> stulist=departmentDao.selectDeptList(dept,start,rows,deptnam);
		
		JSONObject json=new JSONObject();
		json.put("total", total);
		json.put("rows", stulist);
		
		return json;
	}

	public List getDeptName() {
		// TODO Auto-generated method stub
		return departmentDao.getDeptName();
	}

	public void deleteDept(Integer deptid) throws Exception {
		// TODO Auto-generated method stub
		departmentDao.deleteDept(deptid);
	}

	public void updateDept(Department dept) throws Exception {
		// TODO Auto-generated method stub
		departmentDao.updateDept(dept);
	}

	public void addDept(Department dept) throws Exception {
		// TODO Auto-generated method stub
		departmentDao.addDept(dept);
	}

	public Department queryDeptName(Integer deptid) throws Exception {
		// TODO Auto-generated method stub
		return departmentDao.queryDeptName(deptid);
	}

	public Department queryDeptById(Integer deptid) throws Exception {
		// TODO Auto-generated method stub
		return departmentDao.queryDeptById(deptid);
	}
	
	
}
