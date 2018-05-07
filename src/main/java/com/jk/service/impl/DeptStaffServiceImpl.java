/** 
 * <pre>项目名称:ssm-tree-bams 
 * 文件名称:DeptStaffServiceImpl.java 
 * 包名:com.zxt.tree.service.impl 
 * 创建日期:2018年3月13日下午8:22:12 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.jk.dao.IDeptStaffDao;
import com.jk.model.Department;
import com.jk.model.Staff;
import com.jk.service.IDeptStaffService;

/** 
 * <pre>项目名称：ssm-tree-bams    
 * 类名称：DeptStaffServiceImpl    
 * 类描述：    
 * 创建人：张晓甜  
 * 创建时间：2018年3月13日 下午8:22:12    
 * 修改人：张晓甜
 * 修改时间：2018年3月13日 下午8:22:12    
 * 修改备注：       
 * @version </pre>    
 */
@Service
public class DeptStaffServiceImpl implements IDeptStaffService {

	
	
	@Autowired
	private IDeptStaffDao deptStaffDao;

	/* (non-Javadoc)    
	 * @see com.zxt.tree.service.IDeptStaffService#selectDeptStaffList(com.zxt.tree.model.DeptStaff, int, int)    
	 */
	public JSONObject selectDeptStaffList(Staff staff, int page, int rows)
			throws Exception {
				//查询总记录数
				long total=deptStaffDao.queryDeptStaffCount(staff);
				//计算开始条数和结束条数
				int start=(page-1)*rows;
				List<Staff> stulist=deptStaffDao.selectDeptStaffList(staff,start,rows);
				
				JSONObject json=new JSONObject();
				json.put("total", total);
				json.put("rows", stulist);
				
				return json;
	}

	/* (non-Javadoc)    
	 * @see com.zxt.tree.service.IDeptStaffService#getDeptName(java.lang.Integer)    
	 */
	public List getDeptName(){
		
		return deptStaffDao.getDeptName();
	}

	/* (non-Javadoc)    
	 * @see com.zxt.tree.service.IDeptStaffService#updateDeptStaff(com.zxt.tree.model.DeptStaff)    
	 */
	public void updateDeptStaff(Staff staff) throws Exception {
		deptStaffDao.updateDeptStaff(staff);
	}

	/* (non-Javadoc)    
	 * @see com.zxt.tree.service.IDeptStaffService#deleteDeptStaff(java.lang.Integer)    
	 */
	public void deleteDeptStaff(Integer staffid) throws Exception {
		deptStaffDao.deleteDeptStaff(staffid);
	}

	/* (non-Javadoc)    
	 * @see com.zxt.tree.service.IDeptStaffService#addDeptStaff(com.zxt.tree.model.DeptStaff)    
	 */
	public void addDeptStaff(Staff staff) throws Exception {
		deptStaffDao.addDeptStaff(staff);
	}


	/* (non-Javadoc)    
	 * @see com.zxt.tree.service.IDeptStaffService#queryDeptName(java.lang.Integer)    
	 */
	public List queryDeptName() {
		return deptStaffDao.queryDeptName();
	}

	/* (non-Javadoc)    
	 * @see com.zxt.tree.service.IDeptStaffService#queryDeptStaffById(java.lang.Integer)    
	 */
	public Staff queryDeptStaffById(Integer staffid) throws Exception {
		
		return deptStaffDao.queryDeptStaffById(staffid);
	}
}
