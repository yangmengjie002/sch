package sch.com.web.wym;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sch.com.service.wym.ResourceEndService;

@Controller
@RequestMapping("/wym")
public class ResourceEndController {
	@Autowired
	private ResourceEndService resourceEndService;	
	
	
	@RequestMapping("/ResourceEnd")
	public void ResourceEnd(HttpServletResponse resp,String rowArr){
		resp.setContentType("text/html;charset=utf-8");
		String str = resourceEndService.ResourceEnd();
		try {
			resp.getWriter().print(str);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	@RequestMapping("/ResourceEndInsert")
	public void ResourceEndInsert(HttpServletResponse resp,String rowArr){
		resourceEndService.ResourceEndInsert(rowArr);
		try {
			resp.getWriter().print(1);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}








