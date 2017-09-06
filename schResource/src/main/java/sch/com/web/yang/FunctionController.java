package sch.com.web.yang;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.entity.Power;
import sch.com.entity.User;
import sch.com.service.yang.FunctionService;
import sch.com.utils.BaseController;

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
	 * 获取所有权限信息
	 * @param response
	 */
	@RequestMapping("/allUrl")
	public List<Map<String,Object>> getAllUrl(){
		return  ft.functionQuery();
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
