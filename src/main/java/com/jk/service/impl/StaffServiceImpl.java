package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.IStaffDao;
import com.jk.model.Staff;
import com.jk.service.IStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class StaffServiceImpl implements IStaffService {

	
	//huangfuqiang    �Ƹ�ǿ     2018/03/16
	@Resource
	private IStaffDao staffDao;

	public JSONObject queryStaffPage(String staffname, int page, int rows) {
		
		int start =(page-1)*rows;
		long counts = staffDao.queryStaffTotal(staffname);
		List<Staff> sta = staffDao.queryStaffPage(staffname,start,rows);
		JSONObject json = new JSONObject();
		json.put("total", counts);
		json.put("rows", sta);
		return json;
	}

	public void addStaff(Staff staff) {
		staffDao.addStaff(staff);
	}

	public Object delStaffs(String ids) {
		
		return staffDao.delStaffs(ids);
	}

	public void delStaf(Integer staffid) {
		
		staffDao.delStaf(staffid);
	}

	public List queryStaff(Staff staff) {
		
		return staffDao.queryStaff(staff);
	}

	public void delSta(Integer staffid) {
		staffDao.delSta(staffid);
	}

	public List querySta(Staff staff) {
		return staffDao.querySta(staff);
	}

	public List deptName() {
		
		return staffDao.deptName();
	}



}
