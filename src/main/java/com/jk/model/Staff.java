/** 
 * <pre>项目名称:ssm_login 
 * 文件名称:User.java 
 * 包名:com.lz.color.model 
 * 创建日期:2018年1月24日下午2:16:20 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.model;

import java.io.Serializable;

public class Staff implements Serializable{
	private static final long serialVersionUID = 4673520838450988035L;
	private Integer staffid;
	private String  staffname;
	private String staffbir;
	private Integer staffage;
	private Integer deptid;
	private String staffpost;
	private String staffsalary;
	private Integer louji;
	private String deptname;
	
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public Integer getStaffid() {
		return staffid;
	}
	public void setStaffid(Integer staffid) {
		this.staffid = staffid;
	}
	public String getStaffname() {
		return staffname;
	}
	public void setStaffname(String staffname) {
		this.staffname = staffname;
	}
	public String getStaffbir() {
		return staffbir;
	}
	public void setStaffbir(String staffbir) {
		this.staffbir = staffbir;
	}
	public Integer getStaffage() {
		return staffage;
	}
	public void setStaffage(Integer staffage) {
		this.staffage = staffage;
	}
	public Integer getDeptid() {
		return deptid;
	}
	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}
	public String getStaffpost() {
		return staffpost;
	}
	public void setStaffpost(String staffpost) {
		this.staffpost = staffpost;
	}
	public String getStaffsalary() {
		return staffsalary;
	}
	public void setStaffsalary(String staffsalary) {
		this.staffsalary = staffsalary;
	}
	public Integer getLouji() {
		return louji;
	}
	public void setLouji(Integer louji) {
		this.louji = louji;
	}
	@Override
	public String toString() {
		return "Staff [staffid=" + staffid + ", staffname=" + staffname
				+ ", staffbir=" + staffbir + ", staffage=" + staffage
				+ ", deptid=" + deptid + ", staffpost=" + staffpost
				+ ", staffsalary=" + staffsalary + ", louji=" + louji
				+ ", deptname=" + deptname + "]";
	}
	
	
	
	
	
	
	
}
