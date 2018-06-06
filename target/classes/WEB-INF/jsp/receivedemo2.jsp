<%@ page contentType="text/html; charset=gbk" %> 
<html>
<head>
<title>演示程序</title>
</head>
<body>
	
<%
  com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
  com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");  

  String encoding = "GBK";
  
	String orig = request.getParameter("orig");
	String sign = request.getParameter("sign");
	System.out.println("---银行返回后台通知原始数据---"+orig); 
	System.out.println("---银行返回后台通知签名数据---"+sign); 

	orig = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Decode(orig,encoding);
	sign = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Decode(sign,encoding);
	System.out.println("---Base64Decode后的后台通知原始数据---"+orig); 
	System.out.println("---Base64Decode后的后台通知签名数据---"+sign);
	
	String msg = "";
  
  boolean result = util.verifyData(sign,orig);
  System.out.println("---通知验签结果---"+result);
  
	if(result){
	  output = util.parseOrigData(orig);
		System.out.println("---订单详细信息---"+output);
		System.out.println("---订单状态---"+output.getDataValue("status"));
		System.out.println("---支付完成时间---"+output.getDataValue("date"));
		System.out.println("---手续费金额---"+output.getDataValue("charge"));
		System.out.println("---商户号---"+output.getDataValue("masterId"));
		System.out.println("---订单号---"+output.getDataValue("orderId"));
		System.out.println("---币种---"+output.getDataValue("currency"));
		System.out.println("---订单金额---"+output.getDataValue("amount"));
		System.out.println("---下单时间---"+output.getDataValue("paydate"));
		System.out.println("---商品描述---"+output.getDataValue("objectName"));
		System.out.println("---订单有效期---"+output.getDataValue("validtime"));
		System.out.println("---备注---"+output.getDataValue("remark"));
		msg = "ok";
	}else{
		msg = "fail";
	}
	
	java.io.PrintWriter o = response.getWriter();
	o.print(msg);
  o.flush();	
  o.close();
%>

</body>
</html>