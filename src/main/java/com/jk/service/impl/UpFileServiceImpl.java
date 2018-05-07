/** 
 * <pre>项目名称:web-demo-wuzu 
 * 文件名称:UpFileServiceImpl.java 
 * 包名:com.wuzu.lk.service.impl 
 * 创建日期:2018年3月13日上午11:22:38 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk.dao.UpFileMapper;
import com.jk.model.Driectory;
import com.jk.model.UpFile;
import com.jk.service.UpFileService;
/**
 *   王云聪
 */

@Service
public class UpFileServiceImpl implements UpFileService {
	@Autowired
	private UpFileMapper upFileDao;

	/* (non-Javadoc)    
	 * @see com.wuzu.lk.service.UpFileService#xiangceAdd(com.wuzu.lk.vo.Driectory)    
	 */
	public void xiangceAdd(Driectory dr) {
		upFileDao.xiangceAdd(dr);
	}

	/* (non-Javadoc)    
	 * @see com.wuzu.lk.service.UpFileService#queryXiangce(int)    
	 */
	public List<Driectory> queryXiangce(int userid) {
		return upFileDao.queryXiangce(userid);
	}

	/* (non-Javadoc)    
	 * @see com.wuzu.lk.service.UpFileService#queryPhoto(java.lang.String, int)    
	 */
	public List<UpFile> queryPhoto(String driectoryid, int userid) {
		int did = Integer.parseInt(driectoryid);
		return upFileDao.queryPhoto(did,userid);
	}

	/* (non-Javadoc)    
	 * @see com.wuzu.lk.service.UpFileService#photoAdd(com.wuzu.lk.vo.UpFile)    
	 */
	public void photoAdd(UpFile upFile) {
		upFileDao.photoAdd(upFile);
	}
}
