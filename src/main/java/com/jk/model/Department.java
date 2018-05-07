/** 
 * <pre>项目名称:ssm-tree-bams 
 * 文件名称:Department.java 
 * 包名:com.zxt.tree.model 
 * 创建日期:2018年3月13日下午7:42:40 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.model;

import java.io.Serializable;

/** 
 * <pre>项目名称：ssm-tree-bams    
 * 类名称：Department    
 * 类描述：    
 * 创建人：张晓甜  
 * 创建时间：2018年3月13日 下午7:42:40    
 * 修改人：张晓甜
 * 修改时间：2018年3月13日 下午7:42:40    
 * 修改备注：       
 * @version </pre>    
 */
public class Department implements Serializable{

	private static final long serialVersionUID = -1104546899087615831L;
	private Integer deptid ;//1
	private String deptname;//人事
	private Integer staffid ;//1 小米
	public Integer getDeptid() {
		return deptid;
	}
	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public Integer getstaffid() {
		return staffid;
	}
	public void setstaffid(Integer staffid) {
		this.staffid = staffid;
	}
	@Override
	public String toString() {
		return "Department [deptid=" + deptid + ", deptname=" + deptname
				+ ", staffid=" + staffid + "]";
	}
	
	
}
