package com.orchief.pay2.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.ecc.emp.data.IndexedCollection;
import com.ecc.emp.data.KeyedCollection;
import com.sdb.payclient.bean.exception.CsiiException;

public class ApayApi {

	//下单
	public static com.ecc.emp.data.KeyedCollection khPayment_PAY() throws CsiiException {
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
	    
	    input.put("currency","RMB");
	    input.put("customerId","6222980067337248");//客户号，商户对其客户的唯一标识
	    input.put("amount","1.21");
	    input.put("remark","forGodness");
	    input.put("objectName","1111");
	    input.put("paydate",timestamp);
	    input.put("validtime","0");
	    input.put("payType","05");//支付方式，01B2B网关，02B2C网关，03银联快捷，04平安付快捷，05微信扫码
	    //input.put("payCardType","00");//网关、平安付、银联快捷支付需上送，其他支付方式不上送
	    //input.put("issInsCode","PAB");//网关、平安付、银联快捷支付需上送，其他支付方式不上送
	    //input.put("dateTime","201706241530");//平安付快捷支付需上送(使用khPayment_PAY_API返回的dateTime)，其他支付方式不上送
	    //input.put("bindId","20003111462017051155340531");//平安付快捷支付需上送，其他支付方式不上送
	    //input.put("OpenId","20003111462017051155340531");//银联快捷支付需上送，其他支付方式不上送
	    //input.put("cardStr","20003111462017051155340531");//平安付快捷新卡支付需上送，其他支付方式不上送
	    String returnurl="123";
	    String NOTIFYURL="123";
	    input.put("returnurl",returnurl);
	    input.put("NOTIFYURL",NOTIFYURL);
	    try {
	    	output = util.execute(input,"khPayment_PAY_API"); //执行发送（KH0001）单笔订单状态查询请求，并返回结果对象
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---单笔订单状态查询结果详细信息---"+output);
			
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
	    
	    return output;
	}
	
	//绑定银行卡   （询已绑卡信息接口）
	public static com.ecc.emp.data.KeyedCollection khPayment_BIND() throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat( "yyyyMMddHHmmss" );
		String timestamp = formatter.format( date );  //时间
		String datetamp = timestamp.substring(0, 8);  //日期	
		
		input.put("masterId","2000311146");  //商户号，注意生产环境上要替换成商户自己的生产商户号
	    input.put("customerId","6222980067337248");
	    try {
	    	output = util.execute(input,"khPayment_QRY_API"); //执行发送（KH0001）单笔订单状态查询请求，并返回结果对象
			
			System.out.println("---发送验证码结果详细信息---"+output);
			
				/**
				 * 详细返回信息请看平安银行跨行支付接口文档
				 */
				System.out.println("---查询数据---"+output.getDataElement("bindAccIcoll"));
				IndexedCollection icoll = (IndexedCollection)output.getDataElement("bindAccIcoll");
				for(int i=0;i<icoll.size();i++){
					KeyedCollection kcoll= (KeyedCollection)icoll.getElementAt(i);
					System.out.println("---bindId---"+kcoll.getDataValue("bindId"));
					System.out.println("---OpenId---"+kcoll.getDataValue("OpenId"));
					System.out.println("---accNo---"+kcoll.getDataValue("accNo"));
				}
				
	    }catch (Exception e) {
			e.printStackTrace();
		 }
		return output;
	}
	
	//提现
	public static void khPayment_getMoney() {
		
	}
	
	//退款 （单笔退款接口）
	public static com.ecc.emp.data.KeyedCollection khPayment_refund() throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		int orderid ;
		String orderids;
		java.util.Random r=new java.util.Random();
		while(true){
			orderid=r.nextInt(99999999);
			if (orderid<0)orderid=-orderid;
			orderids = String.valueOf(orderid);
			if(orderids.length()<8){
				continue;
			}
			if(orderids.length()>=8){
				orderids = orderids.substring(0,8);
				break;
			}
		}
		java.util.Calendar calendar = java.util.Calendar.getInstance();
		java.util.Date date = calendar.getTime();
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat( "yyyyMMddHHmmss" );
		String timestamp = formatter.format( date );
		String datetamp = timestamp.substring(0, 8);
		
		input.put("masterId","2000311146");  //商户号，注意生产环境上要替换成商户自己的生产商户号
		input.put("refundNo","2000311146"+datetamp+orderids);  //退款单号，严格遵守格式：商户号+8位日期YYYYMMDD+8位流水
		input.put("orderId","20003111462016090928422839");  //原订单号，严格遵守格式：商户号+8位日期YYYYMMDD+8位流水
		input.put("currency","RMB");  //币种，目前只支持RMB
		input.put("refundAmt","0.01");  //退款金额，12整数，2小数，必须等于原订单金额
		input.put("remark","2000311146");  //备注字段（商户自定）
		input.put("objectName","测试退款");  //退款原因（商户自定）
		input.put("NOTIFYURL","http://localhost:8090/khPayment_merchant_demo1/receivedemo2.jsp");  //商户接收订单退款结果服务器异步通知的url，支付平台通知银行，则银行通知商户，否则不通知
		
	    try {
	    	output = util.execute(input,"SF0005"); //执行发送（SF0005）单笔订单退款请求，并返回结果对象
			String errorCode = (String)output.getDataValue("errorCode");
			String errorMsg = (String)output.getDataValue("errorMsg");
			
			System.out.println("---单笔订单退款结果详细信息---"+output);
			
			if((errorCode == null || errorCode.equals(""))&& (errorMsg == null || errorMsg.equals(""))){				
				System.out.println("---订单状态---"+output.getDataValue("status"));  //01：接收成功，退款是否成功请以异步通知结果为准；02：失败
				System.out.println("---商户号---"+output.getDataValue("masterId"));
				System.out.println("---退款单号---"+output.getDataValue("refundAmt"));
				System.out.println("---原订单号---"+output.getDataValue("orderId"));
				System.out.println("---币种---"+output.getDataValue("currency"));
				System.out.println("---退款金额---"+output.getDataValue("refundAmt"));
			}else{
				System.out.println("---错误码---"+output.getDataValue("errorCode"));
				System.out.println("---错误说明---"+output.getDataValue("errorMsg"));
			}

	    }catch (Exception e) {
			e.printStackTrace();
		}
		return output;
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
