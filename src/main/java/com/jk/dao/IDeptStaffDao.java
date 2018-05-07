/** 
 * <pre>项目名称:ssm-tree-bams 
 * 文件名称:IDeptStaffDao.java 
 * 包名:com.zxt.tree.dao 
 * 创建日期:2018年3月13日下午8:25:19 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jk.model.Department;
import com.jk.model.Staff;

/** 
 * <pre>项目名称：ssm-tree-bams    
 * 类名称：IDeptStaffDao    
 * 类描述：    
 * 创建人：张晓甜  
 * 创建时间：2018年3月13日 下午8:25:19    
 * 修改人：张晓甜
 * 修改时间：2018年3月13日 下午8:25:19    
 * 修改备注：       
 * @version </pre>    
 */
public interface IDeptStaffDao {

	/** <pre>queryDeptStaffCount(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月13日 下午11:08:54    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月13日 下午11:08:54    
	 * 修改备注： 
	 * @param deptStaff
	 * @return</pre>    
	 */
	long queryDeptStaffCount(@Param("staff") Staff staff) throws Exception;

	/** <pre>selectDeptStaffList(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月13日 下午11:13:56    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月13日 下午11:13:56    
	 * 修改备注： 
	 * @param deptStaff
	 * @param start
	 * @param rows
	 * @return</pre>    
	 */
	List<Staff> selectDeptStaffList(@Param("staff") Staff staff, @Param("start") int start, @Param("rows") int rows)throws Exception;

	/** <pre>getDeptName(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月14日 上午12:15:15    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月14日 上午12:15:15    
	 * 修改备注： 
	 * @param Staffid
	 * @return</pre>    
	 */
	List getDeptName();

	/** <pre>updateDeptStaff(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月14日 上午9:59:04    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月14日 上午9:59:04    
	 * 修改备注： 
	 * @param deptStaff</pre>    
	 */
	void updateDeptStaff(Staff staff)throws Exception;

	/** <pre>deleteDeptStaff(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月14日 上午10:22:59    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月14日 上午10:22:59    
	 * 修改备注： 
	 * @param Staffid</pre>    
	 */
	void deleteDeptStaff(@Param("staffid") Integer staffid)throws Exception;

	/** <pre>addDeptStaff(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月14日 上午10:43:50    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月14日 上午10:43:50    
	 * 修改备注： 
	 * @param deptStaff</pre>    
	 */
	void addDeptStaff(Staff staff)throws Exception;

	/** <pre>queryDeptStaffById(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月14日 下午6:30:07    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月14日 下午6:30:07    
	 * 修改备注： 
	 * @param Staffid
	 * @return</pre>    
	 */
	Staff queryDeptStaffById(@Param("staffid") Integer staffid);

	/** <pre>queryDeptName(这里用一句话描述这个方法的作用)   
	 * 创建人：张晓甜
	 * 创建时间：2018年3月15日 下午8:10:56    
	 * 修改人：张晓甜
	 * 修改时间：2018年3月15日 下午8:10:56    
	 * 修改备注： 
	 * @param deptid
	 * @return</pre>    
	 */
	List queryDeptName();

}
