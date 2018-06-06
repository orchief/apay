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
	    alert("请输入masterId");
		document.forms[0].masterId.focus();
		
		return false;
	}
    if(document.forms[0].customerId.value=="")
	{
	    alert("请输入customerId");
		document.forms[0].customerId.focus();
		
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
     <P><FONT COLOR="#003399" FACE="宋体">请输入全渠道开通信息：</FONT>
    </TD>
            <TD></TD>
        </TR>
        <TR VALIGN=TOP ALIGN=LEFT>
            <TD COLSPAN=3 HEIGHT=9></TD>
        </TR>
        <TR VALIGN=TOP ALIGN=LEFT>
            <TD HEIGHT=125></TD>
            <TD WIDTH=525 COLSPAN=2>
                <form  NAME="LayoutRegion1FORM" ACTION="khPayment_BIND_API_send.jsp" METHOD=POST onSubmit="return check()">
                    <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
                        <TR VALIGN=TOP ALIGN=LEFT>
                            <TD WIDTH=518>
                                <TABLE ID="Table1" BORDER=0 CELLSPACING=3 CELLPADDING=0 WIDTH=518>
                                   <TR>
                                        <TD WIDTH=80><P><FONT COLOR="#003399" FACE="宋体">商户号：</FONT></TD>
                                        <TD WIDTH=342><P><INPUT ID="masterId" TYPE=TEXT NAME="masterId" value="<%=request.getParameter("masterId")%>" SIZE=30 MAXLENGTH=10>&nbsp;
                                        </TD>
                                    </TR>
                                     <TR>
                                        <TD WIDTH=80><P><FONT COLOR="#003399" FACE="宋体">会员号：</FONT></TD>
                                        <TD WIDTH=342><P><INPUT ID="customerId" TYPE=TEXT NAME="customerId" VALUE="" SIZE=26 MAXLENGTH=20></TD>
                                    </TR>
                                    
                                    <TR>
                                        <TD COLSPAN=2><P><INPUT TYPE=SUBMIT NAME="FormsButton1" VALUE="全渠道开通" ID="FormsButton2">&nbsp;</TD>
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
 
