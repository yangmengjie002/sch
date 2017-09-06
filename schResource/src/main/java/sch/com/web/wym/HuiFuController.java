package sch.com.web.wym;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sch.com.service.wym.HuiFuDaoService;

@Controller
@RequestMapping("/wym")
public class HuiFuController {
	@Autowired
	private HuiFuDaoService huiFuDaoService;
	
	@RequestMapping("/HuiFu")
	public void HuiFu(HttpServletResponse resp){
		resp.setContentType("text/html;charset=utf-8");
		String huifu = huiFuDaoService.HuiFu();
		try {
			resp.getWriter().print(huifu);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/HuiFuUpdate")
	public void HuiFuUpdate(HttpServletResponse resp,String rowArr){
		huiFuDaoService.HuiFuUpdate(rowArr);
		try {
			resp.getWriter().print(1);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}






