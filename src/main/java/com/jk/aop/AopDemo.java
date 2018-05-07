package com.jk.aop;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.jk.model.LogPojo;

import javax.annotation.Resource;

public class AopDemo implements AfterReturningAdvice {

	@Resource
	private MongoTemplate mongoTemplate;
	//returnVals:返回值      method :方法的对象        params: 方法的参数    url：实现类的类路径
	public void afterReturning(Object returnVals, Method method, Object[] params, Object url) throws Throwable {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		LogPojo logPojo = new LogPojo();
		logPojo.setReturnvals(returnVals);
		logPojo.setMethodname(method.getName());
		logPojo.setParams(params);
		logPojo.setUrlstr(url.toString());
		logPojo.setActtime(sdf.format(new Date()));
		
		mongoTemplate.insert(logPojo);
		
	}

}
