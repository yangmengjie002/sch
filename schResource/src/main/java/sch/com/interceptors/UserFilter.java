package sch.com.interceptors;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sch.com.entity.User;

public class UserFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest request = (HttpServletRequest)req;  
	        HttpServletResponse response = (HttpServletResponse)resp;  
	        request.setCharacterEncoding("UTF-8");  
	        response.setContentType("text/html;charset=UTF-8");  
	        HttpSession session = request.getSession();  
	        PrintWriter out = response.getWriter();  
	        User user = (User)session.getAttribute("user");  
	        if(user != null){  
	            chain.doFilter(request,response);  
	        } else{  
	            out.println("Äú»¹Î´µÇÂ½£¬ÈýÃëÖÓºóÌø×ªÖÁµÇÂ¼Ò³Ãæ");  
	            //out.println("<script language='javascript'>alert('Äã»¹Î´µÇÂ¼');");  
	            response.setHeader("refresh","3;/schResource/loginqian/index.html");  
	            //response.sendRedirect("/pages/users/login.jsp");  
	            //request.getRequestDispatcher("/pages/users/login.jsp").forward(request,response);  
	        }  
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}



}
