/** 
 * <pre>项目名称:web-demo-wuzu 
 * 文件名称:UpFileMapper.java 
 * 包名:com.wuzu.lk.dao 
 * 创建日期:2018年3月13日上午11:23:20 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jk.model.Driectory;
import com.jk.model.UpFile;
/**
 *   王云聪
 */

public interface UpFileMapper {

	void xiangceAdd(@Param("dr") Driectory dr);

	
	List<Driectory> queryXiangce(@Param("userid") int userid);

	
	List<UpFile> queryPhoto(@Param("driectoryid") int driectoryid, @Param("userid") int userid);


	void photoAdd(@Param("upFile") UpFile upFile);

}
