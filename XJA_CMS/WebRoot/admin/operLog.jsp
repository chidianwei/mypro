<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="fs" uri="/fs-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@include file="../util/checkParentFrame.jsp"%>
<HTML>
<HEAD>
<LINK rel=stylesheet type=text/css href="../img/style.css">
	<LINK rel=stylesheet type=text/css href="../img/style3.css">
		<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="../js/check.js"></script>
		<script type="text/javascript" src="../js/checkAll.js"></script>
		<script type="text/javascript" src="../js/weebox0.4/bgiframe.js"></script>
		<script type="text/javascript" src="../js/weebox0.4/weebox.js"></script>
		<link type="text/css" rel="stylesheet"
			href="../js/weebox0.4/weebox.css" />
		<script language="javascript" type="text/javascript"
			src="../My97DatePicker/WdatePicker.js"></script>
</HEAD>
<BODY>
	<form name="myForm" method="post" action="operLog_list.do" id="myForm"
		style="margin: 0px">
		<input type="hidden" name="pageFuncId" value="${param.pageFuncId }" />
		<DIV class="column">
			<div class="columntitle">日志搜索</div>
			<TABLE width="100%" border=0 align=center cellpadding="2"
				cellspacing="0">
				<TBODY>
					<TR class=summary-title>
						<TD height="30" align=left style="padding-left: 10px;">操作人： <input
							name="operlog.loginname" type="text" maxlength="50"
							class="colorblur" onfocus="this.className='colorfocus';"
							onblur="this.className='colorblur';" /> 时间范围： <input
							name="info.infostarttime" id="starttime" class="Wdate"
							type="text" size="24" value="${info.infostarttimeStr }"
							onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
							至 <input name="info.infoendtime" id="endtime" class="Wdate"
							type="text" size="24" value="${info.infoendtimeStr }"
							onClick="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />

							操作内容： <input name="operlog.content" type="text" maxlength="50"
							class="colorblur" onfocus="this.className='colorfocus';"
							onblur="this.className='colorblur';" /> 每页显示条数： <select
							name="pageSize" id="pageSize">
								<option selected="selected" value="10">10</option>
								<option value="30">30</option>
								<option value="50">50</option>
								<option value="100">100</option>
								<option value="200">200</option>
								<option value="300">300</option>

						</select> <script>
							function clickSearch(obj) {
								obj.action = "operLog_list.do";
								obj.submit();
							}
							function clickDelete(obj) {
								var starttime = document
										.getElementById("starttime").value;
								var endtime = document
										.getElementById("endtime").value;

								if (starttime == "" && endtime == "") {
									alert("删除操作必须设置时间！");
								} else {
									if (window.confirm("是否删除？")) {
										obj.action = "operLog_delete.do";
										obj.submit();
									}
								}
							}
						</script> <input type="button" name="Search" value="搜 索" id="Search"
							onclick="clickSearch(this.form)" class="button"
							style="MARGIN-BOTTOM: 0px" /> <input type="button" name="Search"
							value="删 除" id="Search" onclick="clickDelete(this.form)"
							class="button" style="MARGIN-BOTTOM: 0px" />
						</TD>
					</TR>

				</TBODY>
			</TABLE>
		</DIV>
	</form>
	<DIV class="column">
		<div class="columntitle">操作日志列表</div>

		<table id="MyDataList" cellspacing="1" cellpadding="1" Align="center"
			border="0" border="0" style="width: 100%; word-break: break-all">
			<TR class="summary-title" style="HEIGHT: 25px" align="center">


				<TD width="10%"><fs:order colName="操作人" col="loginname" />
				</TD>
				<TD width="15%"><fs:order colName="操作时间" col="opertime" />
				</TD>
				<TD width="50%"><fs:order colName="操作内容" col="content" />
				</TD>
				<TD width="10%"><fs:order colName="操作IP" col="ip" />
				</TD>
			</TR>

			<s:iterator value="operlogList" status="bean">
				<TR class="tdbg" onMouseOver="this.className='tdbg-dark';"
					id="tr<s:property value="id"/>" style="HEIGHT: 25px"
					onMouseOut="this.className='tdbg';">

					<TD align="left" id="name<s:property value="id"/>"><s:property
							value="loginname" />
					</TD>
					<TD align="left" id="isok<s:property value="id"/>"><s:property
							value="opertimeStr" />
					</TD>
					<TD align="left" id="isopennewwin<s:property value="id"/>"><s:property
							value="content" />
					</TD>
					<TD align="left" id="ordernum<s:property value="id"/>"><s:property
							value="ip" />
					</TD>
				</TR>
			</s:iterator>
			<TR class="tdbg" style="HEIGHT: 25px">
				<TD align="center" colspan="10">${pageStr }</TD>
			</TR>
		</table>

	</DIV>

	<table width="95%" align="center">
		<tr>
			<td align="right">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left"><fs:operButtons />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</BODY>
</HTML>

