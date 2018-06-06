<%@page import="com.ecc.util.formula.function.SubString"%>
<%@ page contentType="text/html; charset=gbk" %> 
 <HTML> 
 <HEAD> 
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
 <TITLE>buy</TITLE> 
 </HEAD> 
 <BODY BACKGROUND="/images/logo2.gif" BGCOLOR= "#FFFFFF" LINK= "#0000FF " VLINK= "#800080 " TEXT= "#000000 " TOPMARGIN=0 LEFTMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 > 
   <%
	//创建签名控件对象
	request.setCharacterEncoding("gbk");
	String  masterId=request.getParameter("masterId"); 
	String  orderId=request.getParameter("orderId"); 
	String refundAmt= request.getParameter("amount");
	//double amount =Double.parseDouble(request.getParameter("amount"));  
	String  objectName=request.getParameter("objectName");	 
	String  remark=request.getParameter("remark");	 
 
	
	  int orderid ;// '订单号
	  String orderids;
	  java.util.Random r=new java.util.Random();
	  while(true){
     	orderid=r.nextInt(99999999);
		if (orderid<0)
	        orderid=-orderid;
		orderids = String.valueOf(orderid);
 
		if(orderids.length()<8){
  
			continue;
		}
		if(orderids.length()>=8){
			orderids = orderids.substring(0,8);
 
			break;
		}
	  }

	String timestamp;//=System.currentTimeMillis();		
	String datetamp;
	java.util.Calendar calendar = java.util.Calendar.getInstance();
	java.util.Date date = calendar.getTime();
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat( "yyyyMMddHHmmss" );
	timestamp = formatter.format( date );
	datetamp = timestamp.substring(0, 8);	
	//	String masterId = "2000000009";
//String masterId = "2000311146";
	String refundNo=masterId+datetamp+orderids;
//	String refundNo="2000311146"+datetamp+orderids;
//String refundNo="20000000090000000000000520";

	String currency= "RMB";
	String NOTIFYURL="https://testebank.sdb.com.cn/corporbank/unionpayNotify.jsp";

	com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil(); 
	com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
	com.ecc.emp.data.KeyedCollection signDataput = new com.ecc.emp.data.KeyedCollection("signDataput"); 
	
    input.put("masterId",masterId); 
    input.put("refundNo",refundNo);
    input.put("orderId",orderId);
    input.put("currency",currency);
    input.put("refundAmt",refundAmt);
    input.put("remark",remark);
    input.put("objectName",objectName);
    input.put("NOTIFYURL",NOTIFYURL);		

	String orig="";		//原始数据
	String origData="";
	String sign="";        //产生签名
	String signData="";
	String encoding = "GBK";
    try {//发送前，得到签名数据和签名后数据，单独使用
		 signDataput = util.getSignData(input);	
		 orig = (String)signDataput.getDataValue("orig");
		 origData =orig.replace("\t","");
	 
         sign = (String)signDataput.getDataValue("sign");
         signData = sign;
     
		 orig = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Encode(orig,encoding);
		 sign = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Encode(sign,encoding);		
		 orig = java.net.URLEncoder.encode(orig, encoding);
		 sign = java.net.URLEncoder.encode(sign, encoding);
	} catch (Exception e1) {
		e1.printStackTrace();
		orig =e1.getMessage();
	}

	    String result = origData;
	    result = result.replaceAll("\\&", "&amp;");
	    result = result.replaceAll("\\'", "&apos;");
	    result = result.replaceAll("\\\"", "&quot;");
	    result = result.replaceAll("\\<", "&lt;");
	    result = result.replaceAll("\\>", "&gt;");

%>

     <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=555> 
         <TR VALIGN=TOP ALIGN=LEFT> 
             <TD WIDTH=30 HEIGHT=30><IMG SRC= "/images/clearpixel.gif " WIDTH=30 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=293><IMG SRC= "/images/clearpixel.gif " WIDTH=293 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=232><IMG SRC= "/images/clearpixel.gif " WIDTH=232 HEIGHT=1 BORDER=0></TD> 
         </TR><TR VALIGN=TOP ALIGN=LEFT><TD></TD> 
             <TD WIDTH=293><P><FONT COLOR= "#003399 " FACE= "宋体 ">你的退款信息如下：</FONT></TD> 
             <TD></TD></TR> 
         <TR VALIGN=TOP ALIGN=LEFT><TD COLSPAN=3 HEIGHT=9></TD></TR> 
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD HEIGHT=125></TD> 
 <TD WIDTH=525 COLSPAN=2> 
<!--B2B-->
<form  NAME= "NetPayForm" ACTION="SF0005_result.jsp"  METHOD=POST>
 <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD WIDTH=521> 
 <TABLE ID= "Table1 " BORDER=0 CELLSPACING=3 CELLPADDING=0 WIDTH=521> 
 <TR> 
 <TD ROWSPAN=7 WIDTH=105><P><IMG ID= "Picture11 " HEIGHT=106 WIDTH=75 SRC= "./images/<%= request.getParameter("type")%>.gif " VSPACE=0 HSPACE=0 ALIGN= "TOP " BORDER=0>&nbsp;</TD> 
 <TD COLSPAN=2><P><FONT COLOR= "#003399 " FACE= "宋体 "></FONT></TD>
 </TR>
 <TR><TD WIDTH=100>
                  <P><font color="#003399 " face="宋体 ">退款单号: </font>
                  </TD> 
				              <TD>&nbsp;<%=refundNo %>元</TD>
                   </TR>
 <TR><TD WIDTH=100>
                  <P><font color="#003399 " face="宋体 ">原订单号: </font>
                  </TD> 
				              <TD>&nbsp;<%=orderId %></TD>
                   </TR><TR> 
                  <TD WIDTH=100> 
                    <P><FONT COLOR= "#003399 " FACE= "宋体 ">退款金额：</FONT>
                  </TD>
                  <TD width="337"><FONT COLOR= "#003399 " FACE= "宋体 ">&nbsp;<%=refundAmt%>元</FONT></TD>
                </TR><TR> 
                  <TD WIDTH=100>
                        <P><FONT COLOR= "#003399 " FACE= "宋体 ">退款原因：</FONT></TD>
                  <TD WIDTH=337>&nbsp;<%=objectName%></TD>
                </TR>
				         <TR> 
                  <TD WIDTH=100> 
                    <P><FONT COLOR= "#003399 " FACE= "宋体 ">备注：</FONT>
                  </TD>
                  <TD width="337"><FONT COLOR= "#003399 " FACE= "宋体 ">&nbsp;<%=remark%></FONT></TD>
                </TR>
                <TR> 
		<TD COLSPAN=2 HEIGHT=26 align="center"><P>
                      <INPUT TYPE=SUBMIT NAME= "Paygate" VALUE= "确定退款">
                     
                </TD> 
 		</TR>

 		</TABLE>
 		</TD>
 		</TR>
 		</TABLE>
	      <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
 
 		<input type=hidden name=masterId value="<%=masterId%>" >
		<input type=hidden name=refundNo value="<%=refundNo%>" >
		<input type=hidden name=orderId value="<%=orderId%>" >
		<input type=hidden name=currency value="<%=currency%>" >
		<input type=hidden name=refundAmt value="<%=refundAmt%>" >
		<input type=hidden name=objectName value="<%=objectName%>" >
		<input type=hidden name=remark value="<%=remark%>" >		
  	<input type=hidden name=NOTIFYURL value="<%=NOTIFYURL%>" >  
		<input type=hidden name=sign value="<%=sign%>" >
		<input type=hidden name=orig value="<%=orig%>" >

		 原数据：<%=result%>
		 <br>
		 签名数据：<%=signData%>
		 <br>
        </FORM>
 		</TD></TR></TABLE>
</BODY>
</HTML> 
