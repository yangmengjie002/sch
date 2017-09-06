package sch.com.web.wym;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sch.com.service.wym.ReleaseResourceService;

@Controller
@RequestMapping("/wym")
public class ReleaseController {
	@Autowired
	private ReleaseResourceService releaseResourceService;
	
	@RequestMapping("/ReleaseResourceQuery")
	public void ReleaseResourceQuery(HttpServletResponse resp){
		resp.setContentType("text/html;charset=utf-8");
		String release = releaseResourceService.ReleaseResourceQuery();
		try {
			resp.getWriter().println(release);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/ReleaseResourceUPdate")
	public void ReleaseResourceUPdate(HttpServletResponse resp,String rowArr){
		releaseResourceService.UploadUpdate(rowArr);
		try {
			resp.getWriter().print(1);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
}







