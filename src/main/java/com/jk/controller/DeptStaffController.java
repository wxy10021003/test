/** 
 * <pre>项目名称:ssm-tree-bams 
 * 文件名称:DeptStaffController.java 
 * 包名:com.zxt.tree.controller 
 * 创建日期:2018年3月13日下午8:20:10 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
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
import com.jk.model.Staff;
import com.jk.service.IDeptStaffService;

/** 
 * <pre>项目名称：ssm-tree-bams    
 * 类名称：DeptStaffController    
 * 类描述：    
 * 创建人：张晓甜  
 * 创建时间：2018年3月13日 下午8:20:10    
 * 修改人：张晓甜
 * 修改时间：2018年3月13日 下午8:20:10    
 * 修改备注：       
 * @version </pre>    
 */
@Controller
@RequestMapping("/deptStaffController")
public class DeptStaffController {
	
	
	@Autowired
	private IDeptStaffService deptStaffService;

	
	@RequestMapping("/selectDeptStaffList")
	@ResponseBody
	public JSONObject selectDeptStaffList(int rows,int page,Staff staff){
		JSONObject Stafflist= null;
		try {
			Stafflist=deptStaffService.selectDeptStaffList(staff,page,rows);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Stafflist;
	}
	
	@RequestMapping("/getDeptName")
	@ResponseBody
	public String getDeptName(){
		List  list=null;
		
			list = deptStaffService.getDeptName();
		String lt=JSON.toJSONString(list);
		return lt;
	}
	
	@RequestMapping("/updateDeptStaff")
	@ResponseBody
	public String updateDeptStaff(Staff staff){
		try {
			deptStaffService.updateDeptStaff(staff);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "success";
	}
	
	@RequestMapping("/deleteDeptStaff")
	@ResponseBody
	public String deleteDeptStaff(Integer staffid){
		try {
			deptStaffService.deleteDeptStaff(staffid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "success";
	}
	
	@RequestMapping("/toAdddeptStaff")
	public String toAdddeptStaff(HttpServletRequest request){
		/*List list=null;
		try {
			list = deptStaffService.getDeptName();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);*/
		return "addDeptStaff";
	}
	
	
	
	@RequestMapping("/addDeptStaff")
	@ResponseBody
	public String addDeptStaff(Staff staff){
		try {
			deptStaffService.addDeptStaff(staff);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	
	@RequestMapping("/queryDeptName")
	@ResponseBody
	public String queryDeptName(){
		List deptlist=null;
		try {
			deptlist = deptStaffService.queryDeptName();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return JSON.toJSONString(deptlist);
	}
	
	@RequestMapping("/queryDeptStaffById")
	public String queryDeptStaffById(Integer staffid,HttpServletRequest request){
		Staff dStaff=new Staff();
		try {
			dStaff = deptStaffService.queryDeptStaffById(staffid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("deptstaff", dStaff);
		return "UpdateDeptStaff";
	}
}
