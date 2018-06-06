<%@ page contentType="text/html; charset=gbk" %> 
<html>
<head>
<title>演示程序</title>
</head>
<body>
<br>

<%
    com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil();
    com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");  

    String encoding = "GBK";
	String orig = request.getParameter("orig");
	String sign = request.getParameter("sign"); 
	
	orig = java.net.URLDecoder.decode(orig, encoding);
	sign = java.net.URLDecoder.decode(sign, encoding);	
	orig = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Decode(orig,encoding);
	sign = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Decode(sign,encoding);
	
	boolean result;		// 校验结果
	result = util.verifyData(sign,orig);
	
	//if(result){
		//output = util.parseOrigData(orig);
		//String remark = (String) output.getDataValue("remark");//取银行返回信息
//	}

	orig = orig.replaceAll("\\&", "&amp;");
	orig = orig.replaceAll("\\'", "&apos;");
	orig = orig.replaceAll("\\\"", "&quot;");
	orig = orig.replaceAll("\\<", "&lt;");
	orig = orig.replaceAll("\\>", "&gt;");
%>
原始数据:<%=orig%><br>
签名为:<br>
<%=sign%>
<br><br>
校验结果:<%=result%>
<br>
</body>
</html>