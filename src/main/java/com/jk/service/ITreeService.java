 
package com.jk.service;

import com.jk.model.Tree;

import java.util.List;


public interface ITreeService {

	List<Tree> selectTreeList(Tree tree)  throws Exception;

	Tree tuTree(Integer id)  throws Exception;

	void addTree(Tree tree) throws Exception;

	void deleteTree(Integer id) throws Exception;

	void UpdateTree(Tree tree) throws Exception;
	
	

}
