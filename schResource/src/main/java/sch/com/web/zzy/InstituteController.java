package sch.com.web.zzy;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.service.zzy.Tb_instituteService;
import sch.com.utils.BaseController;

@Controller
@RequestMapping("/institute")
public class InstituteController {
	@Autowired
	private Tb_instituteService tis;
	/**
	 * ≤È—Ø—ß‘∫
	 * @param request
	 */
	@RequestMapping("/queryInst")
	@ResponseBody
	public void queryInst(HttpServletRequest request,HttpServletResponse response){
		List<HashMap<String, Object>> queryInst = tis.queryInst();
		System.out.println(queryInst.toString());
		request.setAttribute("queryInst", queryInst);
		BaseController.writeJson(response, queryInst);
	}
	@RequestMapping("/insertInst")
	public String insertInst(HttpServletRequest request,String instName,String instDean,Integer instNo){
		HashMap<String, Object> hm = new HashMap<>();
		String nameStr = "";
		String deanStr = "";
		try {
			nameStr = new String(instName.getBytes("ISO-8859-1"), "utf-8");
			deanStr = new String(instDean.getBytes("ISO-8859-1"), "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		hm.put("instName", nameStr);
		hm.put("instDean", deanStr);
		hm.put("instNo", instNo);
		tis.insertInst(hm);
		return null;
	}

}
