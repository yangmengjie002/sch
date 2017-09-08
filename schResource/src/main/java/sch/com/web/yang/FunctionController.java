package sch.com.web.yang;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.entity.PageBean;
import sch.com.entity.Power;
import sch.com.entity.User;
import sch.com.service.yang.FunctionService;

@Controller
@RequestMapping("/power")
@ResponseBody
public class FunctionController {
	@Autowired
	private FunctionService ft;
	/**
	 * 获取用户权限
	 */
	@RequestMapping("/url")
	public List<Map<String,Object>> getFunction(String id,HttpSession session){
		User user = (User) session.getAttribute("user");
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("id", id);
		m.put("userId", user.getUserId());
		return ft.functionQueryByUserMap(m);	
	}
	/**
	 * 根据用户ID获取用户权限
	 * @return
	 */
	@RequestMapping("/getFunction")
	public List<Map<String,Object>> getFunctionByUserId(HttpSession session){
		User user = (User) session.getAttribute("user");
		List<Map<String, Object>> urlList = ft.functionQueryByUserId(user.getUserId());
		for (int i = 0; i < urlList.size(); i++) {
			urlList.get(i).put("id", urlList.get(i).get("POWER_ID"));
			urlList.get(i).put("pid", urlList.get(i).get("POWER_PID"));
		}
		return urlList;
	}
	
	/**
	 * 获取所有权限信息
	 * @param response
	 */
	@RequestMapping("/allUrl")
	public Map<String, Object> getAllUrl(PageBean pb){
		System.out.println(pb.getPage()+":"+pb.getRows());
		return  ft.functionQuery(pb);
	}
	/**
	 * 根据ID禁用权限
	 * @param arr
	 * @param response
	 */
	@RequestMapping("/delete")
	public String deleteFunction(String arr){
		int flag = ft.functionDelete(arr);
		if(flag==1){
			return "success";
		}else{
			return "error";
		}
	}
	/**
	 * 启用权限
	 * @param arr
	 * @param response
	 */
	@RequestMapping("/up")
	public String upFunction(String arr){
		int flag = ft.functionUp(arr);
		if(flag==1){
			return "success";
		}else{
			return "error";
		}
		
	}
	@RequestMapping("/insertOrUpdate")//插入或修改权限
	public String insertOrUpdateFunction(Power p,HttpServletRequest request){
		try {
			request.setCharacterEncoding("utf-8");
			String name = new String(p.getPowerName().getBytes("iso-8859-1"),"utf-8");
			p.setPowerName(name);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(p.getPowerId()+";"+p.getPowerView()+";"+p.getPowerPriority()+";"+p.getPowerRoad()+";"+p.getPowerName());
		int flag = ft.functionInsert(p);
			if(flag==1){
				return "success1";
			}else if(flag==2){
				return "success2";
			}else{
				return "error";
			}
	}
}
