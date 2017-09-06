package sch.com.web.zzy;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sch.com.service.zzy.Tb_teacherStyleService;
import sch.com.utils.BaseController;

@Controller
@RequestMapping("/teacherStyle")
public class TeacherStyleController {
	@Autowired
	private Tb_teacherStyleService tss;
	@RequestMapping("/findTeacher")
	public void findTeacher(HttpServletRequest req,HttpServletResponse resp){
		List<HashMap<String, Object>> findTeacher = tss.findTeacher();
		for (int i = 0; i < findTeacher.size(); i++) {
			System.out.println(findTeacher.get(i).toString());
		}
		req.setAttribute("findTeacher", findTeacher);
		BaseController.writeJson(resp, findTeacher);
	}
	/**
	 * 添加名师风采
	 * @return
	 */
	@RequestMapping("/insertTeacher")
	@ResponseBody
	public ModelAndView insertTeacher(HttpServletRequest request,String teacher_name,Integer teacher_age,String teacher_six,
				String entry_date,String teacher_info,String teacher_image){
		String strname = "";
		String strimage = "";
		String strinfo = "";
		String strsix = "";
		
		try {
			strname = new String(teacher_name.getBytes("ISO-8859-1"), "utf-8");
			strimage = new String(teacher_image.getBytes("ISO-8859-1"), "utf-8");
			strinfo = new String(teacher_info.getBytes("ISO-8859-1"), "utf-8");
			strsix = new String(teacher_six.getBytes("ISO-8859-1"), "utf-8");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		HashMap<String, Object> hm = new HashMap<>();
		System.out.println(strname);
		hm.put("teacher_name", strname);
		hm.put("teacher_age", teacher_age);
		hm.put("teacher_image", strimage);
		hm.put("teacher_info", strinfo);
		hm.put("teacher_six", strsix);
		hm.put("entry_date", entry_date);
		tss.insertTeacher(hm);
		ModelAndView mv = new ModelAndView("/teacherStyle");
		return mv;
	}
	/**
	 * 删除名师风采
	 * @param teacher_id
	 * @return
	 */
	@RequestMapping("/deleteTeacher")
	@ResponseBody
	public int deleteTeacher(Integer teacher_id){
		int flag = tss.deleteTeacher(teacher_id);
		return flag;
	}
}
