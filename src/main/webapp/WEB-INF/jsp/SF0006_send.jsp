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
    	String masterId = request.getParameter("masterId");
    	String beginDate = request.getParameter("beginDate");
    	String endDate = request.getParameter("endDate");
    	String businessCode = "SF0006";

    	com.sdb.payclient.core.PayclientInterfaceUtil util = new com.sdb.payclient.core.PayclientInterfaceUtil();
    	com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection(
    			"input");
    	com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection(
    			"output");
    	com.ecc.emp.data.KeyedCollection signDataput = new com.ecc.emp.data.KeyedCollection(
    			"signDataput");

    	input.put("masterId", masterId);
    	input.put("beginDate", beginDate);
    	input.put("endDate", endDate);

    	try {
    		output = util.execute(input, businessCode); //执行发送，并返回结果对象
    	} catch (Exception e1) {
    		e1.printStackTrace();
    	}

    	String errorCode = (String) output.getDataValue("errorCode");
    	String errorMsg = (String) output.getDataValue("errorMsg");
    	String sumAmount = (String) output.getDataValue("sumAmount");
    	String sumCount = (String) output.getDataValue("sumCount");
    	com.ecc.emp.data.IndexedCollection icoll = (com.ecc.emp.data.IndexedCollection) output
    			.getDataElement("iOrderListDetail");

    	String orig = (String) output.getDataValue("orig");
    	System.out.println(orig);
    	String sign = (String) output.getDataValue("sign");
    	orig = orig.replaceAll("\\&", "&amp;");
    	orig = orig.replaceAll("\\'", "&apos;");
    	orig = orig.replaceAll("\\\"", "&quot;");
    	orig = orig.replaceAll("\\<", "&lt;");
    	orig = orig.replaceAll("\\>", "&gt;");
    %>

     <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0> 
         <TR VALIGN=TOP ALIGN=LEFT> 
             <TD WIDTH=30 HEIGHT=30><IMG SRC= "/images/clearpixel.gif " WIDTH=30 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=293><IMG SRC= "/images/clearpixel.gif " WIDTH=293 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=232><IMG SRC= "/images/clearpixel.gif " WIDTH=232 HEIGHT=1 BORDER=0></TD> 
         </TR><TR VALIGN=TOP ALIGN=LEFT><td></td>
             <TD COLSPAN=2><b><FONT COLOR="#FF0000" FACE= "宋体 "  SIZE="3"><%=beginDate%>到<%=endDate%>时间段内退款信息如下：</FONT></b></TD> 
             </TR> 
         <TR VALIGN=TOP ALIGN=LEFT><TD COLSPAN=3 HEIGHT=9></TD></TR> 
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD HEIGHT=125></TD> 
 <TD COLSPAN=2> 
<!--B2B-->
<form  NAME= "NetPayForm" ACTION="index.htm" METHOD=POST>
 <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=1800>
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD WIDTH=521>
				<TABLE>
					<TR>
						<TD WIDTH=100>
						<font color="#003399 " face="宋体 ">总金额: </font>
						</TD>
						<TD>&nbsp;<%=sumAmount%>元</TD>
					</TR>
					<TR>
						<TD>
						<FONT COLOR="#003399 " FACE="宋体 ">总笔数：</FONT>
						</TD>
						<TD >&nbsp;<%=sumCount%>笔</TD>
					</TR><TR>
					<TD >
					<FONT COLOR="#003399 " FACE="宋体 ">错误码 ：</FONT>
					</TD>
					<TD ><FONT COLOR="#003399 " FACE="宋体 ">&nbsp;<%=errorCode%></FONT></TD>
					</TR><TR>
					<TD >
					<FONT COLOR="#003399 " FACE="宋体 ">错误信息 ：</FONT>
					</TD>
					<TD ><FONT COLOR="#003399 " FACE="宋体 ">&nbsp;<%=errorMsg%></FONT></TD>
					</TR>
				</TABLE>
				<TABLE ID="Table1 " BORDER=1 CELLSPACING=1 CELLPADDING=1 WIDTH=1500>
				  <TR>
				    <TD><FONT COLOR="#003399 " FACE="宋体 ">序号</FONT></TD>
				    <TD WIDTH=200 ><FONT COLOR="#003399 " FACE="宋体 ">退款流水号</FONT></TD>
				    <TD WIDTH=150 align ="right"><FONT COLOR="#003399 " FACE="宋体 ">退款金额</FONT></TD>
				  	<TD><FONT COLOR="#003399 " FACE="宋体 ">币种</FONT></TD>
				  	<TD><FONT COLOR="#003399 " FACE="宋体 ">状态<br>01成功<br>02失败<br>00处理中</FONT></TD>
            <TD WIDTH=100><FONT COLOR="#003399 " FACE="宋体 ">商户客户号</FONT></TD>
				    <TD><FONT COLOR="#003399 " FACE="宋体 ">原订单流水</FONT></TD>
				    <TD><FONT COLOR="#003399 " FACE="宋体 ">退款时间</FONT></TD>		
				  	<TD ><FONT COLOR="#003399 " FACE="宋体 ">退款本金扣收标志<br> 0：未扣款<br>1：已扣款<br>2：扣款中 </FONT></TD>
				  	<TD><FONT COLOR="#003399 " FACE="宋体 ">退款失败本金退还标志<br>0:未退款<br>1：已退款<br>2：处理中 </FONT></TD>
				  	<TD><FONT COLOR="#003399 " FACE="宋体 ">错误信息</FONT></TD>
				  	<TD><FONT COLOR="#003399 " FACE="宋体 ">错误码</FONT></TD>					
					</TR>
					<%
						for (int i = 0; i < icoll.size(); i++) {
							com.ecc.emp.data.KeyedCollection kcoll = (com.ecc.emp.data.KeyedCollection) icoll
									.getElementAt(i);


							String masterIdf = (String) kcoll.getDataValue("masterId");									
							String refundNo = (String) kcoll.getDataValue("refundNo");
							String orderId = (String) kcoll.getDataValue("orderId");
							String refundTime =(String) kcoll.getDataValue("refundTime");								
              String currency = (String) kcoll.getDataValue("currency");
							String refundAmt = (String) kcoll.getDataValue("refundAmt");
              String refundStatus = (String) kcoll.getDataValue("refundStatus");
							String settleflg =(String) kcoll.getDataValue("settleflg");
							String refundFlag = (String) kcoll.getDataValue("refundFlag");
							String errorCodef =(String) kcoll.getDataValue("errorCode");
							String errorMsgf = (String) kcoll.getDataValue("errorMsg");					
														
							if(null==masterIdf){masterIdf = " ";}
							if(null==refundNo){refundNo = " ";}
							if(null==orderId){orderId = " ";}
							if(null==refundTime){refundTime = " ";}
							if(null==currency){currency = " ";}
							if(null==refundAmt){refundAmt = " ";}
							if(null==refundStatus){refundStatus = " ";}
							if(null==settleflg){settleflg = " ";}
							if(null==refundFlag){refundFlag = " ";}
							if(null==errorCode){errorCode = " ";}
							if(null==errorMsg){errorMsg = " ";}
				%>
					<TR>					 
				  <TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=i + 1%></FONT></TD>
				  <TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=refundNo%></FONT></TD>	
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=refundAmt%></FONT></TD>	 
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=currency%></FONT></TD>	
					<TD align ="center" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=refundStatus%></FONT></TD>	  
					<TD align ="center" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=masterIdf%></FONT></TD>	
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=orderId%></FONT></TD>
  				<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=refundTime%></FONT></TD>	
					<TD align ="center" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=settleflg%></FONT></TD>	  
					<TD align ="center" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=refundFlag%></FONT></TD>	    
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=errorCodef%></FONT></TD>	  
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=errorMsgf%></FONT></TD>
					</TR>	   
				  	   <%
	   				  	   	}
	   				  	   %>
				</TABLE>
				</TD>
 		</TR>
 		<TR><TD ALIGN ="center"><br>
         <br><INPUT TYPE=SUBMIT NAME="Paygate" VALUE="    返    回        "
							></TD></TR>
 		</TABLE>
          <br>
         <br>
         <br>
         <br><br><br><br><br><br><br><br><br><br><br><br>
         		<input type=hidden name=sign value="<%=sign%>" >
		<input type=hidden name=orig value="<%=orig%>" >
 
		 <br>
        </FORM>
 		</TD></TR></TABLE>
</BODY>
</HTML> 
