    <html>  
 
<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"]>
 
<html>
    <body>
  <#if lst?exists>
  <table>
  <tr><td>loginname</td><td>rolename</td><td>name</td></tr>
   <#list lst as item>
       <tr>
         <td>${item.loginname}</td>//获取循环下标值，默认是从0开始的.
         <td>${item.rolenames}</td>
         <td>${item.name}</td>
       </tr>
    </#list>
    </table>
</#if> 
    </body>
      
    </html>  