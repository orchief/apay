<%@ page contentType="text/html; charset=gbk" %> 
<html>
<head>
<title>��ʾ����</title>
</head>
<body>
	
<%
  com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
  com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");  

  String encoding = "GBK";
  
	String orig = request.getParameter("orig");
	String sign = request.getParameter("sign");
	System.out.println("---���з��غ�̨֪ͨԭʼ����---"+orig); 
	System.out.println("---���з��غ�̨֪ͨǩ������---"+sign); 

	orig = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Decode(orig,encoding);
	sign = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Decode(sign,encoding);
	System.out.println("---Base64Decode��ĺ�̨֪ͨԭʼ����---"+orig); 
	System.out.println("---Base64Decode��ĺ�̨֪ͨǩ������---"+sign);
	
	String msg = "";
  
  boolean result = util.verifyData(sign,orig);
  System.out.println("---֪ͨ��ǩ���---"+result);
  
	if(result){
	  output = util.parseOrigData(orig);
		System.out.println("---������ϸ��Ϣ---"+output);
		System.out.println("---����״̬---"+output.getDataValue("status"));
		System.out.println("---֧�����ʱ��---"+output.getDataValue("date"));
		System.out.println("---�����ѽ��---"+output.getDataValue("charge"));
		System.out.println("---�̻���---"+output.getDataValue("masterId"));
		System.out.println("---������---"+output.getDataValue("orderId"));
		System.out.println("---����---"+output.getDataValue("currency"));
		System.out.println("---�������---"+output.getDataValue("amount"));
		System.out.println("---�µ�ʱ��---"+output.getDataValue("paydate"));
		System.out.println("---��Ʒ����---"+output.getDataValue("objectName"));
		System.out.println("---������Ч��---"+output.getDataValue("validtime"));
		System.out.println("---��ע---"+output.getDataValue("remark"));
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