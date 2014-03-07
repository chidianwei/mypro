<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
 <script type="text/javascript" src="ckeditor/ckconfig.js"></script>
 		<link rel="stylesheet" href="../img/common.css" type="text/css" />
		<link rel="stylesheet" href="../img/style.css" type="text/css" />
		<link rel="stylesheet" href="../img/style2.css" type="text/css" />
		<link rel="stylesheet" href="../img/style3.css" type="text/css" />
 
</head>
<body>
<form name="testForm" method="post" action="cms/templet_generateFile.do">
<DIV class=column>
				<TABLE cellSpacing=4 cellPadding=4 width="95%" align=center>
					<TBODY>
						<TR>
							<TD width="10%" align="left">
								 
									<NOBR>
										<SPAN id=ctl01_ctl00_lblLabel>文件名：</SPAN>
									</NOBR>
								</LABEL>
							</TD>
							<TD width="90%" align="left">
								<input type="text" name="tname"/><span style="color:red">文件名需要写后缀名，如hello.html</span>
								<SPAN  id=ctl03>*</SPAN>
							</TD>
						</TR>
						<TR>
							<TD width="10%" align="left">
								 
									<NOBR>
										<SPAN id=ctl01_ctl00_lblLabel>内容：</SPAN>
									</NOBR>
								</LABEL>
							</TD>
							<TD width="90%" align="left">
								<textarea  cols="80" id="editor1" name="editor1" rows="10">
            在此添加内容
     </textarea>
							</TD>
						</TR>
						  <script type="text/javascript">
    CKEDITOR.replace( 'editor1',
     {
      skin : 'kama',
      language : 'zh-cn'
     });
   </script>
   <TR><TD colspan="2"> <input type="submit" value="生成模板文件" class="button"/></TD></TR>
</TBODY>
</TABLE>
</DIV>

    </form>
</body>
</html>