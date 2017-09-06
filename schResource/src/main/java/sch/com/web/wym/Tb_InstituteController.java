package sch.com.web.wym;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import sch.com.entity.Tb_Institute;
import sch.com.service.wym.Tb_InstituteService;

@Controller
@RequestMapping("/wym")
public class Tb_InstituteController {
	@Autowired 
	private Tb_InstituteService service;
	
	@RequestMapping("/instituteAllQuery")
	public void Tb_InstituteAllQuery( HttpServletResponse resp){
		resp.setContentType("text/html;charset=utf-8");
		List<Tb_Institute> aa = new ArrayList<Tb_Institute>();		
		aa = service.Tb_InstituteAllQuery();
		String aaStr = JSON.toJSONString(aa);
		try {
			resp.getWriter().print(aaStr);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
