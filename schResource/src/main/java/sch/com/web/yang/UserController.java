package sch.com.web.yang;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.entity.User;
import sch.com.entity.UserPage;
import sch.com.service.yang.UserService;

/**
 * 用户管理界面
 * @author yang
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService ue;
	/**
	 * 判断用户是否存在，并把用户放到Principal中
	 * 后台登录
	 * @return
	 */
	@RequestMapping("/getUser")
	public String getUser(User u,Model model,HttpSession session){
		System.out.println(u.getUserName()+u.getUserPwd());
		//获取当前对象
		Subject subject = SecurityUtils.getSubject();//未认证状态
		AuthenticationToken token = new UsernamePasswordToken(u.getUserName(), u.getUserPwd());
		try{
			subject.login(token);
		}catch (UnknownAccountException e) {
			e.printStackTrace();
			//设置错误信息
			model.addAttribute("msg", "用户名不存在");
			return "forward:/login.jsp";
		}catch (Exception e) {
			e.printStackTrace();
			//设置错误信息
			model.addAttribute("msg", "用户名或密码错误");
			return "forward:/login.jsp";
		}
		//获取认证信息对象中存储的User对象
		User user = (User) subject.getPrincipal();
		session.setAttribute("user", user);
		return "home";
	}
	
	/**
	 * 判断用户是否存在，并把用户放到Principal中
	 * 前端登录
	 * @return
	 */
	@RequestMapping("/login")
	public String UserLogin(User u,Model model,HttpSession session){
		System.out.println(u.getUserName()+u.getUserPwd());
		//获取当前对象
		Subject subject = SecurityUtils.getSubject();//未认证状态
		AuthenticationToken token = new UsernamePasswordToken(u.getUserName(), u.getUserPwd());
		try{
			subject.login(token);
		}catch (UnknownAccountException e) {
			e.printStackTrace();
			//设置错误信息
			model.addAttribute("msg", "用户名不存在");
			return "forward:/login.jsp";
		}catch (Exception e) {
			e.printStackTrace();
			//设置错误信息
			model.addAttribute("msg", "用户名或密码错误");
			return "forward:/login.jsp";
		}
		//获取认证信息对象中存储的User对象
		User user = (User) subject.getPrincipal();
		session.setAttribute("user", user);
		return "forward:/queryInformation.do";
	}
	/**
	 * 获取所有用户信息
	 * @param up
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/info")
	public Map<String,Object> getAllUser(UserPage up){ 
		return ue.selectAllUser(up);
	}
	
	/**
	 * 根据ID禁用用户
	 * @param arr
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/delete")
	public String deleteUser(String arr,HttpServletResponse response){
		int flag = ue.deleteUser(arr);
			if(flag==1){
				return "success";
			}else{
				return "error";
			}	
	}
	/**
	 * 启用用户
	 * @param arr
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/up")
	public String upUser(String arr,HttpServletResponse response){
		int flag = ue.upUser(arr);
		if(flag==1){
			return "success";
		}else{
			return "error";
		}	
	} 
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public String insertOrUpdateUser(User u){
		int flag = ue.insertUser(u);
			if(flag==1){
				return "success1";
			}else if(flag==2){
				return "success2";
			}else{
				return "error";
			}	
	}
	/**
	 * 修改密码
	 * @param pwd
	 * @param session
	 * @return
	 */
	@RequestMapping("/updatePwd")
	@ResponseBody
	public String updatePwd(String pwd,HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user == null){
			return "forward:login.jsp";
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", user.getUserId());
		map.put("pwd", pwd);
		return ue.updatePwd(map);
	}
	/**
	 * 退出后台
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		return "redirect:/login.jsp";
		
	}
	/**
	 * 获取上传文件信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/uploadInfo")
	@ResponseBody
	public List<Map<String, Object>> getUploadInfo(HttpSession session){
		User user = (User) session.getAttribute("user");
		return ue.getUploadByUserId(5);
	}
	/**
	 * 获取下载文件信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/downloadInfo")
	@ResponseBody
	public List<Map<String, Object>> getDownloadInfo(HttpSession session){
		User user = (User) session.getAttribute("user");
		return ue.getDownloadByUserId(5);
	}
}
