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
	String  date=request.getParameter("date");
	String businessCode = "SF0003";

	com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil(); 
	com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
	com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
	com.ecc.emp.data.KeyedCollection signDataput = new com.ecc.emp.data.KeyedCollection("signDataput"); 
	
    input.put("masterId",masterId);
    input.put("date",date);
    
	 try {
		 output = util.execute(input,businessCode); //执行发送，并返回结果对象
	 }catch (Exception e1) {
			e1.printStackTrace();
		}
	 
	 String errorCode = (String) output.getDataValue("errorCode");
 	String errorMsg = (String) output.getDataValue("errorMsg");
 	String sumAmount = (String) output.getDataValue("sumAmount");
 	String sumCount = (String) output.getDataValue("sumCount");
 	com.ecc.emp.data.IndexedCollection icoll = (com.ecc.emp.data.IndexedCollection) output.getDataElement("iOrderListDetail");

 	String orig = (String) output.getDataValue("orig");
 	System.out.println(orig);
 	String sign = (String) output.getDataValue("sign");
	  orig = orig.replaceAll("\\&", "&amp;");
	  orig = orig.replaceAll("\\'", "&apos;");
	  orig = orig.replaceAll("\\\"", "&quot;");
	  orig = orig.replaceAll("\\<", "&lt;");
	  orig = orig.replaceAll("\\>", "&gt;"); 
	
	
	
%>
<form  NAME= "NetPayForm" ACTION=""  METHOD=POST>
     <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=555> 
         <TR VALIGN=TOP ALIGN=LEFT> 
             <TD WIDTH=30 HEIGHT=30><IMG SRC= "/images/clearpixel.gif " WIDTH=30 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=293><IMG SRC= "/images/clearpixel.gif " WIDTH=293 HEIGHT=1 BORDER=0></TD> 
             <TD WIDTH=232><IMG SRC= "/images/clearpixel.gif " WIDTH=232 HEIGHT=1 BORDER=0></TD> 
         </TR><TR VALIGN=TOP ALIGN=LEFT><TD></TD> 
             <TD WIDTH=293><b><FONT COLOR="#FF0000" FACE= "宋体 "  SIZE="5">订单信息如下：</FONT></b></TD> 
             <TD></TD></TR> 
         <TR VALIGN=TOP ALIGN=LEFT><TD COLSPAN=3 HEIGHT=9></TD></TR> 
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD HEIGHT=125></TD> 
 <TD WIDTH=525 COLSPAN=2> 
<!--B2B-->

				 <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
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
				    <TD  ><FONT COLOR="#003399 " FACE="宋体 ">序号</FONT></TD>
				    <TD WIDTH=200 ><FONT COLOR="#003399 " FACE="宋体 ">订单号 </FONT></TD>
				    <TD  WIDTH=100 align ="right"><FONT COLOR="#003399 " FACE="宋体 ">订单金额</FONT></TD>
				    <TD  ><FONT COLOR="#003399 " FACE="宋体 ">订单时间</FONT></TD>
					<TD ><FONT COLOR="#003399 " FACE="宋体 ">状态，‘01’成功</FONT></TD>
					<TD  ><FONT COLOR="#003399 " FACE="宋体 ">币种</FONT></TD>
					<TD  ><FONT COLOR="#003399 " FACE="宋体 ">款项描述</FONT></TD>
					<TD  ><FONT COLOR="#003399 " FACE="宋体 ">订单有效期(秒,0不生效</FONT></TD>
					<TD  ><FONT COLOR="#003399 " FACE="宋体 ">备注</FONT></TD>
					<TD ><FONT COLOR="#003399 " FACE="宋体 ">支付完成日期</FONT></TD>
					<TD  ><FONT COLOR="#003399 " FACE="宋体 ">订单手续费金额</FONT></TD>
					<TD ><FONT COLOR="#003399 " FACE="宋体 ">订单本金清算 标志‘1’已清算，‘0’待清算</FONT></TD>
					<TD ><FONT COLOR="#003399 " FACE="宋体 ">本金清算时间 </FONT></TD>
					<TD ><FONT COLOR="#003399 " FACE="宋体 ">手续费清算标志‘1’已清算，‘0’待清算</FONT></TD>
					<TD ><FONT COLOR="#003399 " FACE="宋体 ">手续费清算时间 </FONT></TD>
					<TD  ><FONT COLOR="#003399 " FACE="宋体 ">商户号</FONT></TD>
					<TD  ><FONT COLOR="#003399 " FACE="宋体 ">支付方式</FONT></TD>
					<TD  ><FONT COLOR="#003399 " FACE="宋体 ">银行名称</FONT></TD>					
					</TR>
					<%
						for (int i = 0; i < icoll.size(); i++) {
							com.ecc.emp.data.KeyedCollection kcoll = (com.ecc.emp.data.KeyedCollection) icoll
									.getElementAt(i);
							String status = (String) kcoll.getDataValue("status");
							String dateF = (String) kcoll.getDataValue("date");
							String charge = (String) kcoll.getDataValue("charge");
							String masterIdf = (String) kcoll.getDataValue("masterId");
							String orderId = (String) kcoll.getDataValue("orderId");
							String currency = (String) kcoll.getDataValue("currency");
							String amount = (String) kcoll.getDataValue("amount");
							String objectName = (String) kcoll.getDataValue("objectName");
							String paydate = (String) kcoll.getDataValue("paydate");
							String validtime = (String) kcoll.getDataValue("validtime");
							String remark = (String) kcoll.getDataValue("remark");
							String settleflg = (String) kcoll.getDataValue("settleflg");
							String settletime =(String) kcoll.getDataValue("settletime");
							String chargeflg = (String) kcoll.getDataValue("chargeflg");
							String chargetime =(String) kcoll.getDataValue("chargetime");
							String paytype = (String) kcoll.getDataValue("paytype");
							String bankname = (String) kcoll.getDataValue("bankname");
							if(null==status){status = " ";}
							if(null==date){date = " ";}
							if(null==charge){charge = " ";}
							if(null==masterIdf){masterIdf = " ";}
							if(null==orderId){orderId = " ";}
							if(null==currency){currency = " ";}
							if(null==amount){amount = " ";}
							if(null==objectName){objectName = " ";}
							if(null==paydate){paydate = " ";}
							if(null==validtime){validtime = " ";}
							if(null==remark){remark = " ";}
							if(null==settleflg){settleflg = " ";}
							if(null==settletime){settletime = " ";}
							if(null==chargeflg){chargeflg = " ";}
							if(null==chargetime){chargetime = " ";}
							if(null==paytype){chargetime = " ";}
							if(null==bankname){chargetime = " ";}
					
							
							
					%>
					<TR>
					 
				    <TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=i + 1%></FONT></TD>
				    <TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=orderId%></FONT></TD>	
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=amount%></FONT></TD>	 
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=paydate%></FONT></TD>	
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=status%></FONT></TD>	  
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=currency%></FONT></TD>	
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=objectName%></FONT></TD>
  					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=validtime%></FONT></TD>	
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=remark%></FONT></TD>	  
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=dateF%></FONT></TD>	    
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=charge%></FONT></TD>	  
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=settleflg%></FONT></TD>	
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=settletime%></FONT></TD>
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=chargeflg%></FONT></TD> 
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=chargetime%></FONT></TD>
					<TD align ="right" BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=masterIdf%></FONT></TD>
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=paytype%></FONT></TD>
					<TD BORDER=1 CELLSPACING=1 CELLPADDING=1><FONT COLOR="#003399 " FACE="宋体 "><%=bankname%></FONT></TD>					
					</TR>	   
				  	   <%
	   				  	   	}
	   				  	   %>
				</TABLE>
        	 
		 <br>
        
 		</TD></TR><TR><TD ALIGN ="center"><br>
         <br><INPUT TYPE=SUBMIT NAME="Paygate" VALUE="    返    回        "
							onClick="NetPayForm.action='index.htm';"></TD></TR></TABLE></FORM>

							  <br>
         <br>
         <br>
         <br><br><br><br><br><br><br><br><br><br><br><br>
		 银行返回数据：<%=orig%><br> 银行返回签名数据：<%=sign%>
</BODY>
</HTML> 
