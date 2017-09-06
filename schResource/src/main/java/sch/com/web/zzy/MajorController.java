package sch.com.web.zzy;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.service.zzy.Tb_majorService;
import sch.com.utils.BaseController;

@Controller
@RequestMapping("/major")
public class MajorController {
	@Autowired
	private Tb_majorService ms;
	/**
	 * 查询所有专业
	 * @param request
	 * @param response
	 * @param selectId
	 */
	@RequestMapping("/queryMajor")
	@ResponseBody
	public void queryMajor(HttpServletRequest request,HttpServletResponse response,Integer selectId){
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("selectId", selectId);
		List<HashMap<String, Object>> queryMajor = ms.queryMajor();
		request.setAttribute("queryMajor", queryMajor );
		BaseController.writeJson(response, queryMajor);
	}
	@RequestMapping("/findMj")
	@ResponseBody
	public List<HashMap<String,Object>> findMj(Integer selectId,HttpServletRequest request){
		List<HashMap<String, Object>> findMj = ms.queryMajor();
		//BaseController.writeJson(response, findMj);
		request.setAttribute("findMj", findMj);
		System.out.println(selectId);
		System.out.println("*******findmj:"+findMj.toString());
		List<HashMap<String,Object>> flag = ms.findMj(selectId);
		return flag;
	}
}
