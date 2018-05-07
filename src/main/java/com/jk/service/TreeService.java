package com.jk.service;

import java.util.List;
import com.jk.model.Tree;

public interface TreeService {

    List<Tree> selectTreeList(Tree tree)  throws Exception;

    Tree tuTree(Integer id)  throws Exception;

    void addTree(Tree tree) throws Exception;

    void deleteTree(Integer id) throws Exception;

    void UpdateTree(Tree tree) throws Exception;

}
