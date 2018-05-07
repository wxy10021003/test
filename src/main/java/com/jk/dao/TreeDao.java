package com.jk.dao;

import java.util.List;

import com.jk.model.Tree;

public interface TreeDao {

    List<Tree> selectTreeList(Tree tree);

    Tree tuTree(Integer id);

    void addTree(Tree tree);

    void deleteTree(Integer id);

    void UpdateTree(Tree tree);

}
