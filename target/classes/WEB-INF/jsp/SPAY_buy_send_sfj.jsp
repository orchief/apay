<%@page import="com.ecc.util.formula.function.SubString"%>
<%@page import="com.sdb.payclient.core.MerchantSignVerifyUtil"%>
<%@page import="java.security.*"%>
<%@page import="java.security.cert.*"%>
<%@page import="java.security.cert.Certificate"%>
<%@page import="java.security.cert.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page contentType="text/html; charset=gbk" %> 
<HTML> 
 <HEAD> 
 <meta http-equiv="Content-Type" content="text/html; charset=gbk">
 <TITLE>buy</TITLE> 
 </HEAD> 
  <BODY BACKGROUND="/images/logo2.gif" BGCOLOR= "#FFFFFF" LINK= "#0000FF " VLINK= "#800080 " TEXT= "#000000 " TOPMARGIN=0 LEFTMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 > 
 <%
	String timestamp;//=System.currentTimeMillis();		
	String datetamp;
	java.util.Calendar calendar = java.util.Calendar.getInstance();
	java.util.Date date = calendar.getTime();
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat( "yyyyMMddHHmmss" );
	timestamp = formatter.format( date );
	datetamp = timestamp.substring(0, 8);	

	  int orderid ;
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





	request.setCharacterEncoding("gbk");
	//���Ӳ�����˴�������

	String  masterId=request.getParameter("masterId"); 
	String  amount=request.getParameter("amount");

	String  currency=request.getParameter("currency");
    String  objectName=request.getParameter("objectName");
    String   validtime=request.getParameter("validtime");
    String  remark=request.getParameter("remark");
	String customerId=request.getParameter("customerId");
	String subcstno=request.getParameter("subcstno");
	String orderType=request.getParameter("orderType");
	String orderId=masterId+datetamp+orderids;
	com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil(); 
  com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
	com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
	com.ecc.emp.data.KeyedCollection signDataput = new com.ecc.emp.data.KeyedCollection("signDataput"); 
	
	
    input.put("masterId",masterId);
    input.put("amount",amount);
	input.put("orderId",orderId);
    input.put("currency",currency);
    input.put("objectName",objectName);
	input.put("validtime",validtime);
	    input.put("remark",remark);
    input.put("paydate",timestamp);
input.put("customerId",customerId);
input.put("subcstno",subcstno);
input.put("orderType",orderType);
    //���Ӳ�����˴�������
    
   String orig="";		//ԭʼ����
	String origData="";
	String sign="";        //����ǩ��
	String signData="";
	String encoding = "GBK";
    try {//����ǰ���õ�ǩ�����ݺ�ǩ�������ݣ�����ʹ��
		 signDataput = util.getSignData(input);	
		    System.out.println("--2222----"+signDataput.toString());
		 orig = (String)signDataput.getDataValue("orig");
		 origData =orig.replace("\t","");
		 System.out.println(origData);
         sign = (String)signDataput.getDataValue("sign");
         signData = sign;
		 orig = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Encode(orig,encoding);
		 sign = com.sdb.payclient.core.PayclientInterfaceUtil.Base64Encode(sign,encoding);		
		 orig = java.net.URLEncoder.encode(orig, encoding);
		// orig = java.net.URLEncoder.encode(orig, encoding);
		 //sign = java.net.URLEncoder.encode(sign, encoding);
		 sign = java.net.URLEncoder.encode(sign, encoding);
	} catch (Exception e1) {
		e1.printStackTrace();
		orig =e1.getMessage();
	}




	 /* 183 */     String result = origData;
	 /* 184 */     result = result.replaceAll("\\&", "&amp;");
	 /* 185 */     result = result.replaceAll("\\'", "&apos;");
	 /* 186 */     result = result.replaceAll("\\\"", "&quot;");
	 /* 187 */     result = result.replaceAll("\\<", "&lt;");
	 /* 188 */     result = result.replaceAll("\\>", "&gt;");
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
 <TITLE>buy</TITLE> 

 <script type="text/javascript">
 function submit1(v){
	  if(v=='6'){
	  	document.NetPayForm.action="https://my-uat1.orangebank.com.cn/khpayment/khPayment_sfj.do";
	  
	  }else  if(v=='7'){
	  //�������������л�Ϊ�����ӿڵ�ַ
	  	document.NetPayForm.action="https://my-uat1.orangebank.com.cn/khpayment/khPayment_sfj.do";
	  
	  }
		document.NetPayForm.submit();
 }
 </script>
 <BODY BACKGROUND="/images/logo2.gif" BGCOLOR= "#FFFFFF" LINK= "#0000FF " VLINK= "#800080 " TEXT= "#000000 " TOPMARGIN=0 LEFTMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 onload=""> 
   
<form  NAME= "NetPayForm" METHOD=POST target="_blank">
     <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=900> 
           <TR VALIGN=TOP HEIGHT=30> 
          <TD ROWSPAN=1 COLSPAN=2 VALIGN=TOP ></TD>
        </TR><TR VALIGN=TOP ALIGN=LEFT><TD></TD> 
             <TD WIDTH=300><b><FONT COLOR="#003399" FACE= "���� "  SIZE="4">��E��_����̨_������Ϣ���£�</FONT></b></TD> 
             <TD></TD></TR> 
         <TR VALIGN=TOP ALIGN=LEFT><TD COLSPAN=2 HEIGHT=9></TD></TR> 
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD HEIGHT=125 WIDTH=50></TD> 
 <TD WIDTH=850 COLSPAN=1> 
		<TABLE ID="Table1 " BORDER=1 CELLSPACING=1 CELLPADDING=1 WIDTH=800>
					<TR>
						<TD colspan="2" align="center">
							<INPUT TYPE=BUTTON NAME="Paygate" VALUE="     �ύ�ո�+        " onClick="javascript:submit1(6)">
							<INPUT TYPE=BUTTON NAME="Paygate" VALUE="     �ύ�����ո�+        " onClick="javascript:submit1(7)">
						</TD>
					</TR><TR>
						<TD WIDTH=60>
						<font color="#003399 " face="���� ">������: </font>
						</TD>
						<TD>&nbsp;<%=orderId%></TD>
					</TR>
					<TR>
						<TD>
						<font color="#003399 " face="���� ">ǩ��Դ����: </font>
						</TD>
						<TD>&nbsp;<%=result%></TD>
					</TR>
					<TR>
						<TD WIDTH=400>
						<FONT COLOR="#003399 " FACE="���� ">ǩ�������ݣ�</FONT>
						</TD>
						<TD WIDTH=200><%=sign%></div></TD>
					</TR>
						
				</TABLE>
				</TD>
 		</TR>
 		</TABLE>
          <br>
         <br>
         <br><INPUT TYPE=TEXT NAME="sign" ID="sign" value="<%=sign%>">&nbsp;
             <INPUT TYPE=TEXT NAME="orig" ID="orig" value="<%=orig%>">&nbsp;
		 <br> 
		 <INPUT TYPE=TEXT NAME="returnurl" ID="returnurl" value="http://10.14.138.48:8000/khPayment_merchant_demosfj/receivedemo.jsp">&nbsp;
		  <INPUT TYPE=TEXT NAME="NOTIFYURL" ID="NOTIFYURL" value="http://10.14.138.48:8000/khPayment_merchant_demosfj/receivedemo2.jspk">&nbsp;
		  <input type="text" size="18" name="transName" value="paygate">
		 
 		 </FORM> 
</BODY>
</HTML> 