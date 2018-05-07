package com.jk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jk.model.Department;

public interface DepartmentDao {

	long queryDeptCount(@Param("dept") Department dept, @Param("deptnam") String deptnam)throws Exception;

	List<Department> selectDeptList(@Param("dept") Department dept, @Param("start") int start, @Param("rows") int rows, @Param("deptnam") String deptnam)throws Exception;

	List getDeptName();

	void deleteDept(@Param("deptid") Integer deptid)throws Exception;

	void updateDept(Department dept)throws Exception;

	void addDept(Department dept)throws Exception;

	Department queryDeptName(@Param("deptid") Integer deptid)throws Exception;

	Department queryDeptById(@Param("deptid") Integer deptid)throws Exception;
	
}
