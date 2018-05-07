package com.jk.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jk.model.Department;
import com.jk.service.DepartmentService;

@Controller
@RequestMapping("departmentController")
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/selectDeptList")
	@ResponseBody
	public JSONObject selectDeptList(String deptnam,int rows,int page,Department dept){
		JSONObject Stafflist= null;
		try {
			Stafflist=departmentService.selectDeptList(dept,page,rows,deptnam);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Stafflist;
	}
	
	@RequestMapping("/getDeptName")
	@ResponseBody
	public String getDeptName(){
		List  list=null;
		
			list = departmentService.getDeptName();
		String lt=JSON.toJSONString(list);
		return lt;
	}
	
	//新增
	@RequestMapping("/toAdddept")
	public String toAdddept(HttpServletRequest request){
		/*List list=null;
		try {
			list = deptStaffService.getDeptName();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);*/
		
		return "addDepart";
	}
	
	@RequestMapping("/addDept")
	@ResponseBody
	public String addDept(Department dept){
		try {
			departmentService.addDept(dept);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	
	
	//删除
	@RequestMapping("/deleteDept")
	@ResponseBody
	public String deleteDept(Integer deptid){
		try {
			departmentService.deleteDept(deptid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "success";
	}
	
	//修改
	@RequestMapping("/updateDept")
	@ResponseBody
	public String updateDept(Department dept){
		try {
			departmentService.updateDept(dept);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "success";
	}

	
	@RequestMapping("/queryDeptName")
	@ResponseBody
	public String queryDeptName(Integer deptid){
		Department deptlist=null;
		try {
			deptlist = departmentService.queryDeptName(deptid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return JSON.toJSONString(deptlist);
	}
	
	@RequestMapping("/queryDeptById")
	public String queryDeptById(Integer deptid,HttpServletRequest request){
		Department dStaff=new Department();
		try {
			dStaff = departmentService.queryDeptById(deptid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("deptid", dStaff);
		return "UpdateDept";
	}
	
}
