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
	String  refundNo=request.getParameter("refundNo");
	String businessCode = "SF0009";

	com.sdb.payclient.core.PayclientInterfaceUtil  util = new com.sdb.payclient.core.PayclientInterfaceUtil(); 
	com.ecc.emp.data.KeyedCollection input = new com.ecc.emp.data.KeyedCollection("input");
	com.ecc.emp.data.KeyedCollection output = new com.ecc.emp.data.KeyedCollection("output");
	com.ecc.emp.data.KeyedCollection signDataput = new com.ecc.emp.data.KeyedCollection("signDataput"); 

    input.put("masterId",masterId);
    input.put("refundNo",refundNo);
		try {
		 output = util.execute(input,businessCode); //执行发送，并返回结果对象
	 }catch (Exception e1) {
			e1.printStackTrace();
		}
	 
	

	String orig = (String)output.getDataValue("orig"); ;
	String sign = (String)output.getDataValue("sign"); 
	  orig = orig.replaceAll("\\&", "&amp;");
	  orig = orig.replaceAll("\\'", "&apos;");
	  orig = orig.replaceAll("\\\"", "&quot;");
	  orig = orig.replaceAll("\\<", "&lt;");
	  orig = orig.replaceAll("\\>", "&gt;"); 
     	
		
	
%>

     <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=555> 
      
 <TR VALIGN=TOP ALIGN=LEFT> 
 <TD HEIGHT=125></TD> 
 <TD WIDTH=525 COLSPAN=2> 
<!--B2B-->
<form  NAME= "NetPayForm" ACTION="" METHOD=POST>
 <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>

 		<TR><TD ALIGN ="center"><br>
         <br><INPUT TYPE=SUBMIT NAME="Paygate" VALUE="    返    回        "
							onClick="NetPayForm.action='index.htm';"></TD></TR>
 		</TABLE>
          <br>
         <br>
         <br>
         <br><br><br><br><br><br><br><br><br><br><br><br>
      银行返回数据：<%=output%>
		 银行返回源数据：<%=orig%><br> 银行返回签名数据：<%=sign%>
		 
		 <br>
        </FORM>
 		</TD></TR></TABLE>
</BODY>
</HTML> 
