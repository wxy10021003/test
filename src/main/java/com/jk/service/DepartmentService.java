package com.jk.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Department;

public interface DepartmentService {

	JSONObject selectDeptList(Department dept, int page, int rows, String deptnam)throws Exception;

	List getDeptName();

	void deleteDept(Integer deptid)throws Exception;

	void updateDept(Department dept)throws Exception;

	void addDept(Department dept)throws Exception;

	Department queryDeptName(Integer deptid)throws Exception;

	Department queryDeptById(Integer deptid)throws Exception;
	
}
