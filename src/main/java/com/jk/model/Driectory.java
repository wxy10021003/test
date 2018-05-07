/** 
 * <pre>项目名称:web-demo-wuzu 
 * 文件名称:Driectory.java 
 * 包名:com.wuzu.lk.vo 
 * 创建日期:2018年3月13日上午11:24:13 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.model;

import java.io.Serializable;
/**
 *   王云聪
 */

public class Driectory implements Serializable{
	private static final long serialVersionUID = -8741874462729148360L;
	private Integer driectoryid;
	private String driectoryname;
	private Integer userid;
	private String driectorydate;
	private String product;
	public Integer getDriectoryid() {
		return driectoryid;
	}
	public void setDriectoryid(Integer driectoryid) {
		this.driectoryid = driectoryid;
	}
	public String getDriectoryname() {
		return driectoryname;
	}
	public void setDriectoryname(String driectoryname) {
		this.driectoryname = driectoryname;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getDriectorydate() {
		return driectorydate;
	}
	public void setDriectorydate(String driectorydate) {
		this.driectorydate = driectorydate;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "Driectory [driectoryid=" + driectoryid + ", driectoryname=" + driectoryname + ", userid=" + userid
				+ ", driectorydate=" + driectorydate + ", product=" + product + "]";
	}

	

}
