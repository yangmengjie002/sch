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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.entity.Role;
import sch.com.service.yang.FunctionService;
import sch.com.service.yang.RoleService;
import sch.com.utils.BaseController;

@Controller
@RequestMapping("/role")
@ResponseBody
public class RoleController {
	@Autowired
	private RoleService rs;
	@Autowired
	private FunctionService ft;
	
	/**
	 * 获取所有的权限
	 * @param id
	 * @param session
	 * @param response
	 */
	@RequestMapping("/url")
	public List<Map<String, Object>> getFunction(String id,Integer roleId){
		Map<String,Object> m = new HashMap<String,Object>();
		System.out.println(roleId+"bbbbbbbbbbbbbbbbbbbbbbbbbbb");
		m.put("id", id);
		m.put("roleId", roleId);
		List<Map<String, Object>> list = ft.functionQueryByPowerMap(m);
		System.out.println(list);
		return list;	
	}
	/**
	 * 获取所有角色信息
	 * @param response
	 */
	@RequestMapping("/allUrl")
	public List<Map<String, Object>> getAllRole(){
		return rs.getAllRole();
	}
	/**
	 * 根据ID禁用角色
	 * @param arr
	 * @param response
	 */
	@RequestMapping("/delete")
	public String deleteRole(String arr){
		int flag = rs.RoleDelete(arr);
			if(flag==1){
				return "success";
			}else{
				return "error";
			}		
	}
	/**
	 * 启用角色
	 * @param arr
	 * @param response
	 */
	@RequestMapping("/up")
	public String upRole(String arr){
		int flag = rs.roleUp(arr);
		if(flag==1){
			return "success";
		}else{
			return "error";
		}	
	}
	/**
	 * 插入或修改角色
	 * @param p
	 * @param response
	 */
	@RequestMapping("/insertOrUpdate")
	public String insertOrUpdateFunction(Role r,HttpServletRequest request){
		try {
			request.setCharacterEncoding("utf-8");
			String name = new String(r.getRoleName().getBytes("iso-8859-1"),"utf-8");
			r.setRoleName(name);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(r.getArr());
		int flag = rs.roleInsertOrUpdate(r);
		System.out.println(r.getRoleName()+r.getUserRoleKeywords()+r.getArr());
			if(flag==1){
				return "success1";
			}else if(flag==2){
				return "success2";
			}else{
				return "error";
			}
	}
	/**
	 * 根据角色ID获取角色权限
	 * @param roleId
	 * @param response
	 */
	@RequestMapping("/getUrlByRoleId")
	public List<Map<String, Object>> getUrlByRoleId(String roleId,HttpServletResponse response){
		 return rs.getUrlByRoleId(Integer.parseInt(roleId));
	}
}
