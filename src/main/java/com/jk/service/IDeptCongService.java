package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.DeptCong;

public interface IDeptCongService {

	JSONObject queryDeptCount(int page, int rows, DeptCong deptcong);

	

}
