<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fs" uri="/fs-tags" %>
<%@include file="../../util/checkParentFrame.jsp"%>

<HTML>
	<HEAD>
		<LINK rel=stylesheet type=text/css href="../../img/style.css">
		<LINK rel=stylesheet type=text/css href="../../img/style3.css">
		<script type="text/javascript" src="../../js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="../../js/check.js"></script>
		<script type="text/javascript" src="../../js/checkAll.js"></script>
		<script type="text/javascript" src="../../js/weebox0.4/bgiframe.js"></script>
		<script type="text/javascript" src="../../js/weebox0.4/weebox.js"></script>
		<link type="text/css" rel="stylesheet" href="../../js/weebox0.4/weebox.css" />

		<script type="text/javascript" src="js/mailList.js"></script>
	</HEAD>
	<BODY style="padding:0;margin:0">
		<input type="hidden" id="type" value="${mail.type }"/>
		<input type="hidden" id="pageFuncId" value="${param.pageFuncId }"/>
			<DIV class="column" style="width:99%">
				<div class="columntitle">
					信件列表
				</div>

				<table id="MyDataList" cellspacing="1" cellpadding="1"
					Align="center" border="0" border="0"
					style="width: 100%; word-break: break-all">
					<TR class="summary-title" style="HEIGHT: 25px" align="center">
						<TD>
							<INPUT onClick="checkAll(this.checked)" type="checkbox" />
						</TD>
						<s:if test="%{#session.loginAdmin.loginname == 'admin' and 'unit' == mail.type}">
						<TD>
							<fs:order colName="部门" col="unitid"/>
						</TD>
						</s:if>
						<s:if test="%{#session.loginAdmin.loginname == 'admin' and 'user' == mail.type}">
						<TD>
							<fs:order colName="收信人" col="userid"/>
						</TD>
						</s:if>
						<TD>
							<fs:order colName="类型" col="mailtype"/>
						</TD>
						<TD>
							<fs:order colName="查询码" col="querycode"/>
						</TD>
						<TD>
							<fs:order colName="信件标题" col="title"/>
						</TD>
						<TD>
							
							<fs:order colName="发信人" col="writer"/>
						</TD>
						<TD>
							
							<fs:order colName="写信时间" col="addtime"/>
						</TD>
						<TD>
							
							<fs:order colName="公开" col="isopen"/>
						</TD>
						<TD>
							
							<fs:order colName="办理状态" col="state"/>
						</TD>
					</TR>
					
					<s:iterator value="mailList" id="bean">
					<TR class="tdbg" onMouseOver="this.className='tdbg-dark';"  id="tr<s:property value="id"/>"
						style="HEIGHT: 25px" onMouseOut="this.className='tdbg';">
						<TD align="center">
							<INPUT name="ids" type="checkbox" value="<s:property value="id"/>"/></TD>
						
						<s:if test="%{#session.loginAdmin.loginname == 'admin' and 'unit' == mail.type}">
						<TD  align="left" id="unit<s:property value="id"/>">
							<s:property value="unitname"/>
						</TD>
						</s:if>
						<s:if test="%{#session.loginAdmin.loginname == 'admin' and 'user' == mail.type}">
						<TD  align="left" id="user<s:property value="id"/>">
							<s:property value="username"/>
						</TD>
						</s:if>
						<TD  align="left" id="mailtype<s:property value="id"/>">
							<s:property value="mailtype"/>
						</TD>
						<TD  align="left" id="querycode<s:property value="id"/>">
							<s:property value="querycode"/>
						</TD>
						<TD  align="left" id="title<s:property value="id"/>">
							<s:property value="title"/>
						</TD>
						<TD  align="left" id="writer<s:property value="id"/>">
							<s:property value="writer"/>
						</TD>
						<TD  align="left" id="addtime<s:property value="id"/>">
							<s:date name="addtime" format="yyyy-MM-dd" />
						</TD>
						<TD  align="left" id="isopen<s:property value="id"/>">
							${"1"==bean.isopen?"是":"否" }
						</TD>
						<TD  align="left" id="state<s:property value="id"/>">
							${"1"==bean.state?"已办结":"办理中" }
						</TD>
					</TR>
					</s:iterator>
					
				</table>

			</DIV>

			<table width="95%" align="center">
				<tr>
					<td align="right">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left">
									<a href="#" onclick="window.location.href='/XJA_CMS/admin/cms/mail_list.do?mail.type=user&pageFuncId=f0709c68-3af5-413b-8503-0f0bc2a3eb74'">处理</a><fs:operButtons/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

	</BODY>
</HTML>

