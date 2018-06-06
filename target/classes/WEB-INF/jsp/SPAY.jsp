<%@ page contentType="text/html; charset=gbk" %> 
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gbk">
<TITLE>select</TITLE>
<script language="JavaScript">
<!--hide
function check()
{
    if(document.forms[0].masterId.value=="")
	{
	    alert("请输入商户号");
		document.forms[0].masterId.focus();
		
		return false;
	}
    if(document.forms[0].amount.value=="")
	{
	    alert("请输入订单金额");
		document.forms[0].amount.focus();
		
		return false;
	}
	
	
	return true;
}
//endhide-->
</script>
</HEAD>
<BODY BACKGROUND="./images/logo2.gif" BGCOLOR="#FFFFFF" LINK="#0000FF" VLINK="#800080" TEXT="#000000" TOPMARGIN=0 LEFTMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
    <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=555>
        <TR VALIGN=TOP ALIGN=LEFT>
            <TD WIDTH=30 HEIGHT=30><IMG SRC="./images/clearpixel.gif" WIDTH=30 HEIGHT=1 BORDER=0></TD>
            <TD WIDTH=293><IMG SRC="./images/clearpixel.gif" WIDTH=293 HEIGHT=1 BORDER=0></TD>
            <TD WIDTH=232><IMG SRC="./images/clearpixel.gif" WIDTH=232 HEIGHT=1 BORDER=0></TD>
        </TR>
        <TR VALIGN=TOP ALIGN=LEFT>
            <TD></TD>
            <TD WIDTH=293>
      <P><FONT COLOR="#003399" FACE="宋体">收付加_收银台_输入订单信息</FONT>
    </TD>
            <TD></TD>
        </TR>
        <TR VALIGN=TOP ALIGN=LEFT>
            <TD COLSPAN=3 HEIGHT=9></TD>
        </TR>
        <TR VALIGN=TOP ALIGN=LEFT>
            <TD HEIGHT=125></TD>
            <TD WIDTH=525 COLSPAN=2>
                <form  NAME="LayoutRegion1FORM" ACTION="SPAY_buy_send_sfj.jsp" METHOD=POST onSubmit="return check()">
                    <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
                        <TR VALIGN=TOP ALIGN=LEFT>
                            <TD WIDTH=518>
                                <TABLE ID="Table1" BORDER=0 CELLSPACING=3 CELLPADDING=0 WIDTH=518>
                                   <TR>
                                        <TD WIDTH=80><P><FONT COLOR="#003399" FACE="宋体">商户号：</FONT></TD>
                                        <TD WIDTH=342><P><INPUT ID="masterId" TYPE=TEXT NAME="masterId" value="2000311146" SIZE=30 MAXLENGTH=10>&nbsp;
                                        </TD>
                                    </TR>
                                     <TR>
                                        <TD><FONT COLOR="#003399" FACE="宋体">订单金额：</FONT></TD>
                                        <TD WIDTH=342><INPUT ID="amount" TYPE=TEXT NAME="amount" VALUE="" SIZE=30 MAXLENGTH=26>&nbsp;
                                        </TD>
                                    </TR> 
									  <TR>
                                        <TD><FONT COLOR="#003399" FACE="宋体">币种：</FONT></TD>
                                        <TD WIDTH=342><INPUT ID="currency" TYPE=TEXT NAME="currency" VALUE="RMB" SIZE=30 MAXLENGTH=26>&nbsp;
                                        </TD>
                                    </TR> 
	                                     <TR>
                                        <TD><FONT COLOR="#003399" FACE="宋体">订单有效时间：</FONT></TD>
                                        <TD WIDTH=342><INPUT ID="validtime" TYPE=TEXT NAME="validtime" VALUE="0" SIZE=30 MAXLENGTH=26>&nbsp;
                                        </TD>
                                    </TR> 
									  <TR>
                                        <TD><FONT COLOR="#003399" FACE="宋体">备注字段：</FONT></TD>
                                        <TD WIDTH=342><INPUT ID="remark" TYPE=TEXT NAME="remark" VALUE="" SIZE=30 MAXLENGTH=100>&nbsp;
                                        </TD>
                                    </TR> 
	                                     <TR>
                                        <TD><FONT COLOR="#003399" FACE="宋体">订单款项描述：</FONT></TD>
                                        <TD WIDTH=342><INPUT ID="objectName" TYPE=TEXT NAME="objectName" VALUE="test" SIZE=30 MAXLENGTH=100>&nbsp;
                                        </TD>
                                    </TR> 
	                                  <TR>
                                       <TD colspan="2"> &nbsp;--------------------------------------------&nbsp;
                                        </TD>
                                    </TR> 

                            
                                    <TR>
                                        <TD><FONT COLOR="#003399" FACE="宋体">客户号</FONT></TD>
                                        <TD WIDTH=342><INPUT ID="customerId" TYPE=TEXT NAME="customerId" VALUE="" SIZE=30 MAXLENGTH=100>&nbsp;
                                        </TD>
                                    </TR> 
                                    <TR>
                                        <TD><FONT COLOR="#003399" FACE="宋体">二级商户号</FONT></TD>
                                        <TD WIDTH=342><INPUT ID="subcstno" TYPE=TEXT NAME="subcstno" VALUE="" SIZE=30 MAXLENGTH=100>&nbsp;
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD><FONT COLOR="#003399" FACE="宋体">订单类型</FONT></TD>
                                        <TD WIDTH=342>
                                        	<select name="orderType" onChange="">
                                        		<option value="T1">T1</option>
		  																			<option value="T0">T0</option></select>
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD COLSPAN=2><P><INPUT TYPE=SUBMIT NAME="FormsButton1" VALUE="提交" ID="FormsButton2">&nbsp;</TD>
                                    </TR>
                                    <TR>
                                        <TD COLSPAN=2 HEIGHT=16>&nbsp;</TD>
                                    </TR>
                                </TABLE>
                            </TD>
                        </TR>
                    </TABLE>
					
					<input type="hidden" name="type" value="<%=request.getParameter("type")%>">
                </FORM>
            </TD>
        </TR>
    </TABLE>
	
</BODY>
</HTML>
 
