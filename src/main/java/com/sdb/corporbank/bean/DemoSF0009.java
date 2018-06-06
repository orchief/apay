package com.sdb.corporbank.bean;

import com.sdb.payclient.bean.exception.*;

/**
 * 模拟（SF0009）单笔退款状态查询
 * @author: zhuning090
 */
public class DemoSF0009 {	
	public static void main(String[] args) throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		input.put("masterId","2000311146");  //商户号，注意生产环境上要替换成商户自己的生产商户号
	    input.put("refundNo","20003111462016083127448429");  //退款单号，严格遵守格式：商户号+8位日期YYYYMMDD+8位流水
	    
	    try {
	    	output = util.execute(input,"SF0009"); //执行发送（SF0009）单笔退款状态查询请求，并返回结果对象
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---单笔退款状态查询查询结果详细信息---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){				
				System.out.println("---商户号---"+output.getDataValue("masterId"));
				System.out.println("---退款单号---"+output.getDataValue("refundNo"));
				System.out.println("---退款请求接收时间---"+output.getDataValue("refundTime"));
				System.out.println("---原订单号---"+output.getDataValue("orderId"));
				System.out.println("---币种---"+output.getDataValue("currency"));
				System.out.println("---本金清算标志---"+output.getDataValue("settleflg")); //退款本金扣收标志：0：未扣款；1：已扣款；2：扣款中
				System.out.println("---手续费清算标志---"+output.getDataValue("refundFlag"));//退款失败本金退还标志：0：未退款；1：已退款；2：处理中
				System.out.println("---下单时间---"+output.getDataValue("refundAmt"));
				System.out.println("---商品描述---"+output.getDataValue("refundStatus"));//退款状态：01成功；02失败；00处理中
			}else{
				System.out.println("---错误码---"+output.getDataValue("errorCode"));
				System.out.println("---错误说明---"+output.getDataValue("errorMsg"));
			}
	    }catch (Exception e) {
			e.printStackTrace();
		 }
	}
}
