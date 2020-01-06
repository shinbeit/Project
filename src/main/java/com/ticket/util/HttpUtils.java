package com.ticket.util;

import javax.servlet.http.*;

public class HttpUtils {
	
	public static boolean existsUserId(HttpServletRequest request) {
        javax.servlet.http.Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (javax.servlet.http.Cookie cookie : cookies)
                if ("userId".equals(cookie.getName()))
                    return true;
        }
        return false;
    }
	
	public static boolean existsCompanyId(HttpServletRequest request) {
        javax.servlet.http.Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (javax.servlet.http.Cookie cookie : cookies)
                if ("c_userId".equals(cookie.getName()))
                    return true;
        }
        return false;
    }
		
	public static String getPerformCode(HttpServletRequest request) {
		String performCode = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("performcode")) {
				performCode = cookie.getValue();
			}
		}
		return performCode;
	}
	
    public static String getUserId(HttpServletRequest request) {
        javax.servlet.http.Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (javax.servlet.http.Cookie cookie : cookies)
                if ("userId".equals(cookie.getName()))
                    return cookie.getValue();
        }
        return "";
    }
    
    public static String getCompanyId(HttpServletRequest request) {
        javax.servlet.http.Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (javax.servlet.http.Cookie cookie : cookies)
                if ("userId".equals(cookie.getName()))
                    return cookie.getValue();
        }
        return "";
    }
}
