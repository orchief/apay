<%@page import="com.ecc.util.formula.function.SubString"%>
<%@ page contentType="text/html; charset=gbk" %> 
 <HTML> 
 <HEAD> 
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
 <TITLE>buy</TITLE> 
 </HEAD> 
 <BODY BACKGROUND="/images/logo2.gif" BGCOLOR= "#FFFFFF" LINK= "#0000FF " VLINK= "#800080 " TEXT= "#000000 " TOPMARGIN=0 LEFTMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 > 
   <%
	//����ǩ���ؼ�����
	request.setCharacterEncoding("gbk");
//String  payee=request.getParameter("Payee");
	  int orderid ;// '������
	  String orderids;
	  java.util.Random r=new java.util.Random();
	  while(true){
     	orderid=r.nextInt(99999999);
		if (orderid<0)
	        orderid=-orderid;
		orderids = String.valueOf(orderid);
		 System.out.println("--orderids----"+orderids);
		if(orderids.length()<8){
			 System.out.println("--order22222ids----"+orderids);
			continue;
		}
		if(orderids.length()>=8){
			orderids = orderids.substring(0,8);
			 System.out.println("--orderids222----"+orderids);
			break;
		}
	  }

	//int count= Integer.parseInt(request.getParameter("count"));
//	double price=Double.parseDouble(request.getParameter("price"));
	String timestamp;//=System.currentTimeMillis();		
	String datetamp;
	java.util.Calendar calendar = java.util.Calendar.getInstance();
	java.util.Date date = calendar.getTime();
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat( "yyyyMMddHHmmss" );
	timestamp = formatter.format( date );
	datetamp = timestamp.substring(0, 8);	
	String customerId = request.getParameter("customerId");
	System.out.println(customerId==null);
	String masterId = request.getParameter("masterId");

	com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil(); 
	com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
	com.ecc.emp.data.KeyedCollection signDataput = new com.ecc.emp.data.KeyedCollection("signDataput"); 
	
    input.put("masterId",masterId);//�̻��ţ�ע������������Ҫ�滻���̻��Լ��������̻���
    input.put("orderId",masterId+datetamp+orderids);//�����ţ��ϸ����ظ�ʽ���̻���+8λ����YYYYMMDD+8λ��ˮ
   //input.put("orderId","20003111462016071717195270");
  
    input.put("customerId",customerId);//��Ա��

    
  input.put("dateTime",timestamp);//�µ�ʱ�䣬YYYYMMDDHHMMSS	
   // input.put("dateTime","");
	
	

	String orig="";		//ԭʼ����
	String origData="";
	String sign="";        //����ǩ��
	String signData="";
	String encoding = "GBK";
	String returnurl="";
	String NOTIFYURL="";
    try {//����ǰ���õ�ǩ�����ݺ�ǩ�������ݣ�����ʹ��
		 signDataput = util.getSignData(input);	
		    System.out.println("--2222----"+signDataput.toString());
		 orig = (String)signDataput.getDataValue("orig");
		 origData =orig.replace("\t","");
		 System.out.println(origData);
         sign = (String)signDataput.getDataValue("sign");
         signData = sign;
		 orig = util.Base64Encode(orig,encoding);
		 sign = util.Base64Encode(sign,encoding);		
		 orig = java.net.URLEncoder.encode(orig, encoding);
		 sign = java.net.URLEncoder.encode(sign, encoding);

		 returnurl="http://10.14.138.48:8000/khPayment_merchant_demosfj/receivedemo.jsp";
		
		 
		 NOTIFYURL="https://10.14.204.93:9080/khpayment/unionpayNotify.jsp";
	
		
		 
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

     <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=555> 
         <TR VALIGN=TOP ALIGN=LEFT> 
             <TD WIDTH=30 HEIGHT=30><IMG SRC= "/images/clearpixel.gif " WIDTH=30 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=293><IMG SRC= "/images/clearpixel.gif " WIDTH=293 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=232><IMG SRC= "/images/clearpixel.gif " WIDTH=232 HEIGHT=1 BORDER=0></TD> 
     
         <TR VALIGN=TOP ALIGN=LEFT><TD COLSPAN=3 HEIGHT=9></TD></TR> 
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD HEIGHT=125></TD> 
 <TD WIDTH=525 COLSPAN=2> 
<!--B2B-->
<form  NAME= "NetPayForm" ACTION="" target=_blank  METHOD=POST>
 <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD WIDTH=521> 
 <TABLE ID= "Table1 " BORDER=0 CELLSPACING=3 CELLPADDING=0 WIDTH=521> 
	
                <TR> 
		<TD COLSPAN=2 HEIGHT=16><P>
                     <INPUT TYPE=SUBMIT NAME= "Paygate" VALUE= "ȫ������ͨ" onClick="NetPayForm.action='https://my-uat1.orangebank.com.cn/khpayment/khPayment_BIND_API.do';">
                </TD> 
 		</TR>
 		</TABLE>
 		</TD>
 		</TR>
 		</TABLE>
		<input type=hidden name=sign value="<%=sign%>" >
		<input type=hidden name=orig value="<%=orig%>" >
		<input type=hidden name=returnurl value="<%=returnurl%>"  >
		<input type=hidden name=NOTIFYURL value="<%=NOTIFYURL%>" >
          <br>
         <br>
         <br>
         <br><br><br>
		 ԭ���ݣ�
		 <%=result%>
		 <br>
		 ǩ�����ݣ�<%=signData%>
		 <br>
        </FORM>
 		</TD></TR></TABLE>
</BODY>
</HTML> 
