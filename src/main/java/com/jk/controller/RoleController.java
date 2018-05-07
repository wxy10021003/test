package com.jk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Role;
import com.jk.model.Tree;
import com.jk.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	 
	
	@RequestMapping("/roleList")
	@ResponseBody
	public JSONObject roleList(int page,int rows,Role role){
		
		JSONObject list=(JSONObject) roleService.roleList(page,rows,role);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/addchamenulist")
	public List<Tree> addchamenulist(Integer roid){
		List<Tree>   list1= 	roleService.addcharolemenulist(roid);
		  List<Tree>   list2=   roleService.addchamenulist();
		  /*System.out.println(list2);
		  System.out.println(list1);*/
		   for (Tree menu : list2) {
			  for (Tree menu1 : list1) {
				if (menu.getId()==menu1.getId()) {
					menu.setChecked(true);
				}
			}
		}
			return list2;
	}
	
	@ResponseBody
	@RequestMapping("/updaterolemenulist")
	public String  updaterolemenulist(String  ids,Integer roid){
		roleService.roleService(roid);
		String[] arr = 	ids.split(",");
		for (int i = 0; i < arr.length; i++) {
			roleService.saverolemenulist(Integer.parseInt(arr[i]),roid);
		}
		return "true";

		
	}
	
	
}
