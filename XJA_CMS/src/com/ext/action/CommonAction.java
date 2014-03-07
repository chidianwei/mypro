package com.ext.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.freeteam.util.DbUtil;

import com.opensymphony.xwork2.ActionSupport;
/***
 * 
 * @author chidianwei
 * 扩展网站涉及业务访问的请求，用该类处理
 */
public class CommonAction extends ActionSupport {
	private String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String test()
	{
		this.setUsername("xiaoming");
		
		return "success";
	}
	public String list() throws Exception
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("aa", "sssssssss");
		DbUtil db=new DbUtil();
		String sql="select loginName,roleNames,name from freecms_users";
		List<Map<String,Object>> lst=db.getListBySql(sql);
		request.setAttribute("lst", lst);
		return "success";
	}
}
