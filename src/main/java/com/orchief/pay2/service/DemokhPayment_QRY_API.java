package com.orchief.pay2.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.ecc.emp.data.IndexedCollection;
import com.ecc.emp.data.KeyedCollection;
import com.sdb.payclient.bean.exception.*;

/**
 * 模拟（KH0001）单笔订单状态查询
 * @author: zhuning090
 */
public class DemokhPayment_QRY_API {	
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
