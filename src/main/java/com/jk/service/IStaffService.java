package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Staff;

import java.util.List;

public interface IStaffService {

	//huangfuqiang    �Ƹ�ǿ     2018/03/16
	JSONObject queryStaffPage(String staffname, int page, int rows);

	void addStaff(Staff staff);

	Object delStaffs(String ids);

	void delStaf(Integer staffid);

	List queryStaff(Staff staff);

	void delSta(Integer staffid);

	List querySta(Staff staff);

	List deptName();


}
