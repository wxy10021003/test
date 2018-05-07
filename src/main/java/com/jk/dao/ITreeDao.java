package com.jk.dao;

import com.jk.model.Tree;

import java.util.List;

public interface ITreeDao {

	List<Tree> selectTreeList(Tree tree);

	Tree tuTree(Integer id);

	void addTree(Tree tree);

	void deleteTree(Integer id);

	void UpdateTree(Tree tree);

}
