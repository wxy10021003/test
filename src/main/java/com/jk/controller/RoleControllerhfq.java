package com.jk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk.model.Role;
import com.jk.model.RolesList;
import com.jk.model.User;
import com.jk.service.RoleServicehfq;
import com.jk.service.IUserService;

@RequestMapping("roleController")
@Controller
public class RoleControllerhfq {
	@Autowired
	private RoleServicehfq roleService;
	
	@Autowired
	private IUserService userService;
	
	  @RequestMapping("toRole") 
		 public String toRole(String userId,HttpServletRequest request){
			 request.setAttribute("userId", userId);
			  return "showRole";
		 }
	
	  @RequestMapping("roles")
	  @ResponseBody
	  public  RolesList roles(String userid,HttpServletRequest request){
		 
		  User user =new User();
		  user.setUserid(Integer.parseInt(userid));
		  RolesList rol=new RolesList();
		  try {
			  User usert=userService.getResourcesReList(user);
			List<Role> list=new ArrayList<Role>();
			list=roleService.roles();
			rol.setList(list);
			rol.setRoles(usert.getRoles());
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		  
		  
		  return rol;
	  }	
	
	
	  @RequestMapping("addRoleUserRelation")
	  @ResponseBody
	  public String addRoleUserRelation(String roleId,String userId){
		  roleService.addRoleUserRelation(roleId,userId);
		  return "success";
	  }
	
	  @RequestMapping("roleList")
	  @ResponseBody
	  public List<Role> roleList(){
		  List<Role> list=new ArrayList<Role>();
		      list=roleService.roles();
			return list;
	  }	
	  
	 
	  @RequestMapping("toTree")
	  public String toTree(String roleId,HttpServletRequest request){
		  request.setAttribute("roleId", roleId);
		  return "treeList";
	  }
	  

}
