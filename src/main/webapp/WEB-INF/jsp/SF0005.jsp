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
    if(document.forms[0].orderId.value=="")
	{
	    alert("请输入原订单号");
		document.forms[0].orderId.focus();
		
		return false;
	}
    if(document.forms[0].amount.value=="")
	{
	    alert("请输入退款金额");
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
      <P><FONT COLOR="#003399" FACE="宋体">请录入退款信息：</FONT>
    </TD>
            <TD></TD>
        </TR>
        <TR VALIGN=TOP ALIGN=LEFT>
            <TD COLSPAN=3 HEIGHT=9></TD>
        </TR>
        <TR VALIGN=TOP ALIGN=LEFT>
            <TD HEIGHT=125></TD>
            <TD WIDTH=525 COLSPAN=2>
                <form  NAME="LayoutRegion1FORM" ACTION="SF0005_send.jsp" METHOD=POST onSubmit="return check()">
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
                                        <TD WIDTH=100><P><FONT COLOR="#003399" FACE="宋体">原订单号：</FONT></TD>
                                        <TD WIDTH=342><P><INPUT ID="orderId" TYPE=TEXT NAME="orderId" VALUE="" SIZE=32 MAXLENGTH=32>&nbsp;
                                         
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD WIDTH=100><P><FONT COLOR="#003399" FACE="宋体">退款金额：</FONT></TD>
                                        <TD WIDTH=342><P><INPUT ID="amount" TYPE=TEXT NAME="amount" VALUE="" SIZE=32 MAXLENGTH=32>&nbsp;
                               
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD WIDTH=100><P><FONT COLOR="#003399" FACE="宋体">退款原因：</FONT></TD>
                                        <TD WIDTH=342><P><INPUT ID="objectName" TYPE=TEXT NAME="objectName"  VALUE="" SIZE=32 MAXLENGTH=32>&nbsp;
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD WIDTH=100><P><FONT COLOR="#003399" FACE="宋体">备注：</FONT></TD>
                                        <TD WIDTH=342><P><INPUT ID="remark" TYPE=TEXT NAME="remark" VALUE="" SIZE=32 MAXLENGTH=32>&nbsp;
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD COLSPAN=3 align="center"><P><INPUT TYPE=SUBMIT NAME="FormsButton1" VALUE="提交" ID="FormsButton2">&nbsp;</TD>
                                    </TR>
                                    <TR>
                                        <TD COLSPAN=2 HEIGHT=16>&nbsp;</TD>
                                    </TR>
                                </TABLE>
                            </TD>
                        </TR>
                    </TABLE>
					
 
                </FORM>
            </TD>
        </TR>
    </TABLE>
	
</BODY>
</HTML>
 
