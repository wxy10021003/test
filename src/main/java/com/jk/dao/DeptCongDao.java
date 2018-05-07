package com.jk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jk.model.DeptCong;
import com.jk.model.Role;

public interface DeptCongDao {

	long selectCount(DeptCong deptcong);

	List<Role> queryDeptCountList(@Param("start") int start, @Param("rows") int rows, DeptCong deptcong);

}
