package com.sdb.corporbank.bean;

import com.sdb.payclient.bean.exception.*;

/**
 * 模拟（Union10004）查询商户T0信息
 * @author: zhuning090
 */
public class DemoUnion10004 {	
	public static void main(String[] args) throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		input.put("masterId","2000311146");  //商户号，注意生产环境上要替换成商户自己的生产商户号
	    
	    try {
	    	output = util.execute(input,"Union10004"); //执行发送（Union10004）查询商户T0信息请求，并返回结果对象
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---查询商户T0信查询结果详细信息---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){				
				System.out.println("---T0清分状态---"+output.getDataValue("status"));//TO开关 0代表T0不清分,1代表T0清分
				System.out.println("---T0总额度---"+output.getDataValue("amount"));//T0总额度
				System.out.println("---商户T0可用余额---"+output.getDataValue("useamount"));//商户T0可用余额
				System.out.println("---商户T0单笔限额---"+output.getDataValue("singlelimt"));//商户T0单笔限额
			}else{
				System.out.println("---错误码---"+output.getDataValue("errorCode"));
				System.out.println("---错误说明---"+output.getDataValue("errorMsg"));
			}

	    }catch (Exception e) {
			e.printStackTrace();
		 }
	}
}
