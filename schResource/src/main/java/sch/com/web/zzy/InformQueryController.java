package sch.com.web.zzy;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import sch.com.entity.Tb_information;
import sch.com.service.zzy.Tb_informationService;
import sch.com.utils.BaseController;

@Controller
public class InformQueryController {
	@Autowired
	private Tb_informationService tb_informationService;

	/**
	 * 获取资讯表内容
	 * 
	 * @param response
	 */
	@RequestMapping("/queryInformation")
	public String queryInformation(HttpServletRequest request) {
		List<Tb_information> getList = tb_informationService.getList();
		request.setAttribute("getList", getList);
		for (int i = 0; i < getList.size(); i++) {
			System.out.println(getList.get(i).getInformationTitle());
		}
		return "resourceHome";
	}

	@RequestMapping("/informationManage")
	public void InformationManage(HttpServletResponse response) {
		List<Tb_information> getList = tb_informationService.getList();
		BaseController.writeJson(response, getList);

	}

	@RequestMapping("/insertInfo")
	@ResponseBody
	public ModelAndView insertInfo(String informationTitles, String informationContents, HttpServletRequest req) {
		String strTitles="";
		String strContents="";
		try {
			req.setCharacterEncoding("utf-8");
			strTitles = new String(informationTitles.getBytes("ISO-8859-1"), "utf-8");
			strContents = new String(informationContents.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("informationTitle", strTitles);
		hm.put("informationContent", strContents);
		hm.put("user_id", 1);
		tb_informationService.insertInfo(hm);
		System.out.println(hm.toString());
		ModelAndView mv = new ModelAndView("forward:jsp/InformationManage.jsp");//返回视图数据
		return mv;
	}
}
