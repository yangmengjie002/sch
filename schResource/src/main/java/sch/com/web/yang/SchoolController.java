package sch.com.web.yang;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.service.yang.SchoolService;

@Controller
@ResponseBody
@RequestMapping("/school")
public class SchoolController {
	@Autowired
	private SchoolService ss;
	/**
	 * 获取学院信息
	 * @return
	 */

	@RequestMapping("/getInstitute")
	public List<Map<String, Object>> getInstitute(){
		return ss.getInstitute();
	}
	@RequestMapping("/getMajor")
	public List<Map<String, Object>> getMajor(int instituteId){
		return ss.getMajor(instituteId);
	}
	
	@RequestMapping("/getAllMajor")
	public List<Map<String, Object>> getAllMajor(){
		return ss.getAllMajor();
	}
	
	
}
