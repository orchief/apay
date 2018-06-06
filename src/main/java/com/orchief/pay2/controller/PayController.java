package com.orchief.pay2.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ecc.emp.data.IndexedCollection;
import com.ecc.emp.data.KeyedCollection;
import com.orchief.pay2.util.RandomID;
import com.sdb.payclient.bean.exception.CsiiException;


@RestController
public class PayController {

	/*@Autowired
	private OrderRepository OrderRepository;*/
	
	/*@RequestMapping("/pay")
	public Orders createPay(@RequestParam int orderId) {
		return OrderRepository.findOne(orderId);
	}*/
	
	
	@RequestMapping(value = "/DemokhPayment_PAY_API"/*,method = RequestMethod.POST*/)
	public com.ecc.emp.data.KeyedCollection DemokhPayment_PAY_API() throws CsiiException {
		com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
		com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
		com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
		
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat( "yyyyMMddHHmmss" );
		String timestamp = formatter.format( date );  //时间
		String datetamp = timestamp.substring(0, 8);  //日期	
		
		input.put("masterId","2000311146");  //商户号，注意生产环境上要替换成商户自己的生产商户号
	    input.put("orderId","2000311146"+datetamp+RandomID.getOrderId());  //订单号，严格遵守格式：商户号+8位日期YYYYMMDD+8位流水
	    
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
	
	@RequestMapping("/DemokhPayment_QRY_API")
	public com.ecc.emp.data.KeyedCollection DemokhPayment_QRY_API() throws CsiiException {
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
	
/*	@RequestMapping("DemokhPayment_SMS_API")*/
	
	
}
