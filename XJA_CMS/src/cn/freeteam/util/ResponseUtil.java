package cn.freeteam.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public class ResponseUtil {

	public static void  writeGBK(HttpServletResponse response,String content) {
		response.setCharacterEncoding("GBK");
		try {
			response.getWriter().print(content);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void  writeUTF(HttpServletResponse response,String content) {
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(content);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
