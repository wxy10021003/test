/** 
 * <pre>项目名称:web-demo-wuzu 
 * 文件名称:UpFileService.java 
 * 包名:com.wuzu.lk.service 
 * 创建日期:2018年3月13日上午11:22:09 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.service;
/**
 *   王云聪
 */
import com.jk.model.Driectory;
import com.jk.model.UpFile;

import java.util.List;

public interface UpFileService {

	
	void xiangceAdd(Driectory dr);

	List<Driectory> queryXiangce(int userid);

	List<UpFile> queryPhoto(String driectoryid, int userid);

	void photoAdd(UpFile upFile);

}
