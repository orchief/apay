package com.orchief.pay2.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.sdb.payclient.bean.exception.*;
import com.sdb.payclient.core.MerchantSignVerify;

/**
 * 模拟（KH0001）单笔订单状态查询
 * @author: zhuning090
 */
public class DemokhPayment_SMS_API {	
	public static void main(String[] args) throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat( "yyyyMMddHHmmss" );
		String timestamp = formatter.format( date );  //时间
		String datetamp = timestamp.substring(0, 8);  //日期	
		
		input.put("masterId","2000311146");  //商户号，注意生产环境上要替换成商户自己的生产商户号
		input.put("orderId","2000311146"+datetamp+getOrderId());  //订单号，严格遵守格式：商户号+8位日期YYYYMMDD+8位流水
		
		input.put("customerId","19901120");
		input.put("OpenId","20003111462017122041072723");
	    
		input.put("currency","RMB");
	    input.put("remark","forGodness");
	    input.put("amount","1.21");
	    input.put("objectName","1111");
	    input.put("paydate",timestamp);
	    input.put("validtime","0");
	    input.put("payType","03");
		
		String cardStr = "";
		try {
			cardStr = util.getSignData("6226641111188899");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    //input.put("cardStr",cardStr);
	    try {
	    	output = util.execute(input,"khPayment_SMS_API"); //执行发送（KH0001）单笔订单状态查询请求，并返回结果对象
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---发送验证码结果详细信息---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){				
				/**
				 * 详细返回信息请看平安银行跨行支付接口文档
				 */
				System.out.println("---订单状态---"+output.getDataValue("status"));
			}else{
				System.out.println("---错误码---"+output.getDataValue("errorCode"));
				System.out.println("---错误说明---"+output.getDataValue("errorMsg"));
			}

	    }catch (Exception e) {
			e.printStackTrace();
		 }
	}
	//生成8位随机数
	private static String getOrderId(){
		String orderId ;
		java.util.Random r=new java.util.Random();
		while(true){
			int i=r.nextInt(99999999);
			if(i<0)i=-i;
			orderId = String.valueOf(i);
			System.out.println("---生成随机数---"+orderId);
			if(orderId.length()<8){
				System.out.println("---位数不够8位---"+orderId);
				continue;
			}
			if(orderId.length()>=8){
				orderId = orderId.substring(0,8);
				System.out.println("---生成8位流水---"+orderId);
				break;
			}
		  }
		return orderId;
	}
}
