package com.jk.dao;

import com.jk.model.Staff;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IStaffDao {

	//huangfuqiang    �Ƹ�ǿ     2018/03/16
	long queryStaffTotal(@Param("staff") String staffname);

	List<Staff> queryStaffPage(@Param("staff") String staffname, @Param("s") int start, @Param("rows") int rows);

	void addStaff(Staff staff);

	Object delStaffs(@Param("ids") String ids);

	void delStaf(Integer staffid);

	List queryStaff(String string);

	List queryStaff(Staff staff);

	void delSta(Integer staffid);

	List querySta(Staff staff);

	List deptName();

}
