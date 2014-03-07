package cn.freeteam.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.freeteam.util.HttpInclude;

public class BasePathFilter implements Filter {

	protected FilterConfig filterConfig = null;

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		    HttpServletRequest httpServletRequest=(HttpServletRequest)request;
		    HttpServletResponse resp=(HttpServletResponse)response;
			//判断是否有basePath
			if (filterConfig.getServletContext().getAttribute("basePath")==null ||
					filterConfig.getServletContext().getAttribute("basePath").toString().trim().length()==0) {
				String basePath=httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName()+":"+httpServletRequest.getServerPort()+httpServletRequest.getContextPath()+"/";
				filterConfig.getServletContext().setAttribute("basePath", basePath);
			}
			httpServletRequest.setAttribute("httpInclude", new HttpInclude(httpServletRequest, resp));
			chain.doFilter(request, response);

	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

}
