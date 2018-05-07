package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jk.model.Staff;
import com.jk.service.IStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;



//huangfuqiang    �Ƹ�ǿ     2018/03/16



@Controller
@RequestMapping("staffController")
public class StaffController {

	@Autowired
	private IStaffService staffService;
	
	@RequestMapping("queryStaffPage")
	@ResponseBody
	public Object queryStaffPage(String staffname,int page,int rows){
		JSONObject json = staffService.queryStaffPage(staffname,page,rows);
		return json;
	}

	@RequestMapping(value="/delStaf")
	@ResponseBody
	public String delStaf(Integer staffid){
		staffService.delStaf(staffid);
		return "delSuccess";	
	}	
	@RequestMapping(value="/delSta")
	@ResponseBody
	public String delSta(Integer staffid){
		staffService.delSta(staffid);
		return "delSuccess";	
	}	
	
	@RequestMapping(value="/toAdd")
	public String toAdd(){
		return "addStaff";
	}
	
	@RequestMapping(value="/addStaff")
	@ResponseBody
	public String addStaff(Staff staff){
		staff.setLouji(0);
		staffService.addStaff(staff);
		return "addSuccess";
	}
	
	@RequestMapping(value="/delStaffs")
	@ResponseBody
	public Object delStaffs(String ids){
		
		return staffService.delStaffs(ids);
	}
	@ResponseBody
	@RequestMapping("queryStaff")
	public Object queryStaff(Staff staff,Model model){
		
		List list =staffService.queryStaff(staff);
		
		return list;
	}
	
	@RequestMapping("deptName")
	@ResponseBody
	public String deptName(){
		
		List lists = null;
		
		lists=staffService.deptName();
		
		String aa = JSON.toJSONString(lists);
		
		return aa;
	}

}
