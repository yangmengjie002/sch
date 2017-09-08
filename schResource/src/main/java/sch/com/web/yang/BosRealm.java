package sch.com.web.yang;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import ch.qos.logback.core.joran.action.ActionUtil.Scope;
import sch.com.entity.Power;
import sch.com.entity.User;
import sch.com.service.yang.FunctionService;
import sch.com.service.yang.UserService;

/**
 * realm子类接口的自定义方法，类似jdbcrealm
 * @author yang
 *
 */
public class BosRealm extends AuthorizingRealm{
	@Resource
	private UserService ut;
	@Resource
	private FunctionService fs;
	/**
	 * 认证方法
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		System.out.println("认证方法。。。");
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String username = upToken.getUsername();// 从令牌中获得用户名

		User user =ut.getUser(username);
		System.out.println(user.getUserName());
		if (user == null) {
			// 用户名不存在
			return null;
		} else {
			// 用户名存在
			String password = user.getUserPwd();// 获得数据库中存储的密码
			// 创建简单认证信息对象
			/***
			 * 参数一：签名，程序可以在任意位置获取当前放入的对象
			 * 参数二：从数据库中查询出的密码
			 * 参数三：当前realm的名称
			 */
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,
					password, this.getClass().getSimpleName());
			return info;//返回给安全管理器，由安全管理器负责比对数据库中查询出的密码和页面提交的密码
		}
	}

	/**
	 * 授权方法
	 */
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		//根据当前登录用户查询其对应的权限，授权
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		User user = (User) principals.getPrimaryPrincipal();//获取用户
		List<Map<String,Object>> list = null;//获取用户权限
		/*if(user.getUserName().equals("admin")){
			//用户为超级管理员，获取所有权限。
			list = fs.functionQuery();
		}else{*/
			//用户为普通用户，根据id获取权限
			list = fs.functionQueryByUserId(user.getUserId());
		/*}*/
		//把权限赋给认证对象。
		for (int i = 0; i < list.size(); i++) {
			String key = list.get(i).get("POWER_KEY")+"";
			info.addStringPermission(key);
		}
		return info;
	}



}
