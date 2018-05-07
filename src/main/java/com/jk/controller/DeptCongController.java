package com.jk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.DeptCong;
import com.jk.service.IDeptCongService;
/*
 * 
 * 王云聪 
 * */
@Controller
@RequestMapping("/DeptCongController")
public class DeptCongController {
	@Autowired
	private IDeptCongService deptCongService;
	
	@RequestMapping("/queryDeptCountList")
	public String queryDeptCountList(){
		return "deptCongList";
	}
	
	@RequestMapping("/queryDeptCount")
	@ResponseBody
	public JSONObject queryDeptCount(int page,int rows,DeptCong deptcong){
		JSONObject list=(JSONObject) deptCongService.queryDeptCount(page,rows,deptcong);
		return list;
	}
}
