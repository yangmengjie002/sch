package sch.com.web.wym;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.service.wym.CheckQueryService;

@Controller
@RequestMapping("/wym")
public class CheckQueryController {
	
	@Autowired
	private CheckQueryService checkQueryService;
	
	/**
	 * 获取审核列表
	 * @param resp
	 */
	@RequestMapping("/checkQuery")
	public void checkQuery(HttpServletResponse resp){
		resp.setContentType("text/html;charset=utf-8");
		try {
			resp.getWriter().print(checkQueryService.checkQuery());
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/checkMajQuery")
	@ResponseBody
	public List<HashMap<String, Object>> checkMajQuery(String institute_name){
		System.out.println(institute_name);
		
		return checkQueryService.checkMajQuery(institute_name);
	}
	
	/**
	 * 审核表插入和资源上传表更新
	 * @param resourceId
	 * @param checkIdea
	 * @param checkStatuId
	 */
	@RequestMapping("/checkInsert")
	@Transactional
	public void checkInsert(Integer resourceId,String checkIdea,
			Integer checkStatuId,String major_name){
		System.out.println("major_name========"+major_name);
		checkQueryService.checkInsert(resourceId,checkIdea,checkStatuId,major_name);
	}
	
	
}
