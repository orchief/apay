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
	
	String  sign=request.getParameter("sign");
	String  orig=request.getParameter("orig");	

	String masterId =request.getParameter("masterId");
			String refundNo =request.getParameter("refundNo");
			String orderId =request.getParameter("orderId"); 
			String currency =request.getParameter("currency");
			String refundAmt =request.getParameter("refundAmt");
			String objectName =request.getParameter("objectName");
			String remark =request.getParameter("remark");		
  		String NOTIFYURL =request.getParameter("NOTIFYURL"); 
  		String businessCode = "SF0005";

	com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil(); 
	com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
	com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
	com.ecc.emp.data.KeyedCollection signDataput = new com.ecc.emp.data.KeyedCollection("signDataput"); 
	
   input.put("masterId",masterId); 
  
   //input.put("masterId","pt00000001"); 
    input.put("refundNo",refundNo);
    input.put("orderId",orderId);
    input.put("currency",currency);
    input.put("refundAmt",refundAmt);
    input.put("remark",remark);
    input.put("objectName",objectName);
    input.put("NOTIFYURL",NOTIFYURL);		
  
	 try {
		output = util.execute(input,businessCode); //执行发送，并返回结果对象
	 }catch (Exception e1) {
			e1.printStackTrace();
		}

	
 System.out.println("output<<<>>>"+output);
	String errorCode = (String)output.getDataValue("errorCode");
	String errorMsg = (String)output.getDataValue("errorMsg");
	String status = (String)output.getDataValue("status");
	String masterIdf = (String)output.getDataValue("masterId");
	String orderIdf = (String)output.getDataValue("orderId");
	String currencyf = (String)output.getDataValue("currency");
	String refundAmtf = (String)output.getDataValue("refundAmt");
	String refundNoF = (String)output.getDataValue("refundNo");
	//String remarkf = (String)output.getDataValue("remark");

	String reOrig = (String)output.getDataValue("orig"); ;
	String reSign = (String)output.getDataValue("sign"); 
	  reOrig = reOrig.replaceAll("\\&", "&amp;");
	  reOrig = reOrig.replaceAll("\\'", "&apos;");
	  reOrig = reOrig.replaceAll("\\\"", "&quot;");
	  reOrig = reOrig.replaceAll("\\<", "&lt;");
	  reOrig = reOrig.replaceAll("\\>", "&gt;"); 
	
	

%>

     <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=555> 
         <TR VALIGN=TOP ALIGN=LEFT> 
             <TD WIDTH=30 HEIGHT=30><IMG SRC= "/images/clearpixel.gif " WIDTH=30 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=293><IMG SRC= "/images/clearpixel.gif " WIDTH=293 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=232><IMG SRC= "/images/clearpixel.gif " WIDTH=232 HEIGHT=1 BORDER=0></TD> 
         </TR><TR VALIGN=TOP ALIGN=LEFT><TD></TD> 
             <TD WIDTH=293><P><FONT COLOR= "#003399 " FACE= "宋体 ">你的退款结果信息如下：</FONT></TD> 
             <TD></TD></TR> 
         <TR VALIGN=TOP ALIGN=LEFT><TD COLSPAN=3 HEIGHT=9></TD></TR> 
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD HEIGHT=125></TD> 
 <TD WIDTH=525 COLSPAN=2> 
<!--B2B-->
<form  NAME= "NetPayForm" ACTION="index.htm" METHOD=POST>
 <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD WIDTH=521> 
 <TABLE ID= "Table1 " BORDER=0 CELLSPACING=3 CELLPADDING=0 WIDTH=521> 
 <TR> 
 <TD ROWSPAN=10 WIDTH=105><P><IMG ID= "Picture11 " HEIGHT=106 WIDTH=75 SRC= "./images/<%= request.getParameter("type")%>.gif " VSPACE=0 HSPACE=0 ALIGN= "TOP " BORDER=0>&nbsp;</TD> 
 <TD COLSPAN=2><P><FONT COLOR= "#003399 " FACE= "宋体 "></FONT></TD>
 </TR>
 <TR> 
 <TD WIDTH=100>
                    <P><font color="#003399 " face="宋体 ">退款订单号: </font>
                  </TD> 
				  <TD>&nbsp;<%=refundNo %>元</TD>
 </TR>
 <TR> 
 <TD WIDTH=100>
                    <P><font color="#003399 " face="宋体 ">原订单号: </font>
                  </TD> 
				  <TD>&nbsp;<%=orderId %>元</TD>
 </TR><TR> 
                  <TD WIDTH=100>
<P><FONT COLOR= "#003399 " FACE= "宋体 ">退款原因：</FONT></TD>
                  <TD WIDTH=337>&nbsp;<%=objectName%></TD>
                </TR><TR> 
                  <TD WIDTH=100> 
                    <P><FONT COLOR= "#003399 " FACE= "宋体 ">退款金额：</FONT>
                  </TD>
                  <TD width="337"><FONT COLOR= "#003399 " FACE= "宋体 ">&nbsp;<%=refundAmt%>元</FONT></TD>
                </TR>
				         <TR> 
                  <TD WIDTH=100> 
                    <P><FONT COLOR= "#003399 " FACE= "宋体 ">备注：</FONT>
                  </TD>
                  <TD width="337"><FONT COLOR= "#003399 " FACE= "宋体 ">&nbsp;<%=remark%></FONT></TD>
                </TR>
				         <TR> 
                  <TD WIDTH=100> 
                    <P><FONT COLOR= "#003399 " FACE= "宋体 ">退款结果：</FONT>
                  </TD>
                  <TD width="337"><FONT COLOR= "#003399 " FACE= "宋体 ">&nbsp;<%=status%></FONT></TD>
                </TR>
                 <TR> 
                  <TD WIDTH=100> 
                    <P><FONT COLOR= "#003399 " FACE= "宋体 ">错误码：</FONT>
                  </TD>
                  <TD width="337"><FONT COLOR= "#003399 " FACE= "宋体 ">&nbsp;<%=errorCode%></FONT></TD>
                </TR>
                 <TR> 
                  <TD WIDTH=100> 
                    <P><FONT COLOR= "#003399 " FACE= "宋体 ">错误信息：</FONT>
                  </TD>
                  <TD width="337"><FONT COLOR= "#003399 " FACE= "宋体 ">&nbsp;<%=errorMsg%></FONT></TD>
                </TR>
 		</TABLE>
 		</TD>
 		</TR> 		<TR><TD ALIGN ="center"><br>
         <br><INPUT TYPE=SUBMIT NAME="Paygate" VALUE="    返    回        "
							></TD></TR>
 		</TABLE>
    </FORM>
 		</TD></TR>
		</TABLE>
</BODY>
</HTML> 
