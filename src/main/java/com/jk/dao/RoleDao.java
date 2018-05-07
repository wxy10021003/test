package com.jk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jk.model.Role;
import com.jk.model.Tree;

public interface RoleDao {

	long selectCount(Role role);

	List<Role> roleList(@Param("start") int start, @Param("rows") int rows, @Param("role") Role role);

	List<Tree> addcharolemenulist(Integer roid);

	List addchamenulist();

	void roleService(@Param("roid") Integer roid);

	void saverolemenulist(@Param("parseInt") int parseInt, @Param("roid") Integer roid);


}
