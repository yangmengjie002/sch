package sch.com.web.wym;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.service.wym.HelpInsertService;

@Controller
@RequestMapping("/wym")
public class HelpInsertController {
	@Autowired
	private HelpInsertService helpInsertService;
	
	@RequestMapping("/helpInsert")
	@ResponseBody
	public String helpInsert(HttpServletResponse resp,String typename,
			String requestCause,String ziname,String majorname){
		resp.setContentType("text/html;charset=utf-8");
		System.out.println(typename);
		System.out.println(requestCause);
		System.out.println(ziname);
		System.out.println(majorname);
		helpInsertService.HelpInsert(typename, requestCause, ziname, majorname);
		return "1";
	}
}
