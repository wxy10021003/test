/** 
 * <pre>项目名称:ssm-tree-bams 
 * 文件名称:IDeptStaffService.java 
 * 包名:com.zxt.tree.service 
 * 创建日期:2018年3月13日下午8:21:37 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Department;
import com.jk.model.Staff;

/** 
 * <pre>项目名称：ssm-tree-bams    
 * 类名称：IDeptStaffService    
 * 类描述：    
 * 创建人：张晓甜  
 * 创建时间：2018年3月13日 下午8:21:37    
 * 修改人：张晓甜
 * 修改时间：2018年3月13日 下午8:21:37    
 * 修改备注：       
 * @version </pre>    
 */
public interface IDeptStaffService {

	/** <pre>selectDeptStaffList(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月13日 下午11:07:16    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月13日 下午11:07:16    
	 * 修改备注： 
	 * @param deptStaff
	 * @param page
	 * @param rows
	 * @return</pre>    
	 */
	JSONObject selectDeptStaffList(Staff staff, int page, int rows) throws Exception;

	/** <pre>getDeptName(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月14日 上午12:14:28    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月14日 上午12:14:28    
	 * 修改备注： 
	 * @param Staffid
	 * @return</pre>    
	 */
	List getDeptName();

	/** <pre>updateDeptStaff(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月14日 上午9:58:12    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月14日 上午9:58:12    
	 * 修改备注： 
	 * @param deptStaff</pre>    
	 */
	void updateDeptStaff(Staff staff)throws Exception;

	/** <pre>deleteDeptStaff(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月14日 上午10:22:19    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月14日 上午10:22:19    
	 * 修改备注： 
	 * @param Staffid</pre>    
	 */
	void deleteDeptStaff(Integer staffid)throws Exception;

	/** <pre>addDeptStaff(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月14日 上午10:43:18    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月14日 上午10:43:18    
	 * 修改备注： 
	 * @param deptStaff</pre>    
	 */
	void addDeptStaff(Staff staff)throws Exception;


	/** <pre>queryDeptName(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月15日 下午8:10:29    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月15日 下午8:10:29    
	 * 修改备注： 
	 * @param deptid
	 * @return</pre>    
	 */
	List queryDeptName()throws Exception;

	/** <pre>queryDeptStaffById(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月16日 上午9:01:50    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月16日 上午9:01:50    
	 * 修改备注： 
	 * @param Staffid
	 * @return</pre>    
	 */
	Staff queryDeptStaffById(Integer Staffid)throws Exception;

}
