package com.jk.service.impl;

import com.jk.dao.ITreeDao;
import com.jk.model.Tree;
import com.jk.service.ITreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TreeServiceImpl implements ITreeService {

	@Autowired
	private ITreeDao treeDao;

	@Cacheable(value="common",key="'selectTreeList'")
	public List<Tree> selectTreeList(Tree tree) throws Exception {
		return treeDao.selectTreeList(tree);
	}

	public Tree tuTree(Integer id)throws Exception {
		
		return treeDao.tuTree(id);
	}

	public void addTree(Tree tree) throws Exception {
		
		treeDao.addTree(tree);
	}

	public void deleteTree(Integer id) throws Exception {
		treeDao.deleteTree(id);
	}

	public void UpdateTree(Tree tree) throws Exception {
		treeDao.UpdateTree(tree);
	}
}
