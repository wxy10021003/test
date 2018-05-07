/** 
 * <pre>项目名称:ssm-tree-bams 
 * 文件名称:TreeTow.java 
 * 包名:com.zxt.tree.model 
 * 创建日期:2018年3月12日下午7:54:10 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.model;

import java.io.Serializable;

public class Tree   implements Serializable{

	private Integer id;
	private String text;
	private Integer pid;
	private String url;
	private Boolean checked=false;
	private String iconCls;
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	@Override
	public String toString() {
		return "Tree [id=" + id + ", text=" + text + ", pid=" + pid + ", url="
				+ url + ", checked=" + checked + ", iconCls=" + iconCls + "]";
	}
		
	

}
