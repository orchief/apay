package com.orchief.pay2.util;

import java.util.Map;

import com.orchief.pay2.model.ResultModel;

public class ResultTools {

	 /**** 
     * 错误码记录： 
     * 0--------成功  
     * 1001-----请求传参错误 
     * 1002-----没有对应内容 
     * 1003-----此用户已存在 
     * 1004-----上传文件为空 
     * 404------异常抛出错误 
     *  
     */  
  
    /** 
     * @param Errcode--返回码 
     * @param Errmsg---404服务器内部异常时提示消息(返回码不是404时传空即可) 
     * @param map------数据源 
     * @return 
     */  
	
	public static ResultModel result(int errcode,String errmsg,Map<String,Object> map) {
		
		return null;
		
	}
}
