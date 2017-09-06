package sch.com.service.yang.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.yang.UserDao;
import sch.com.entity.User;
import sch.com.entity.UserPage;
import sch.com.service.yang.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao ud;
	@Override
	public User getUser(String username) {
		// TODO Auto-generated method stub
		return ud.getUser(username);
	}
	@Override
	public User getUserInfo(User u) {
		// TODO Auto-generated method stub
		return ud.getUserInfo(u);
	}
	@Override
	public Map<String,Object> selectAllUser(UserPage up) {
		// TODO Auto-generated method stub
		System.out.println(up.getUserName()+up.getPage()+";"+up.getRows());
		//获取起始记录数
		int startIndex = (up.getPage()-1) * up.getRows();
		//获取结束记录数
		int endIndex = up.getPage() * up.getRows() + 1;
		up.setStartIndex(startIndex);
		up.setEndIndex(endIndex);
		//获取总记录数
		int total = ud.getCount(up);
		//获取记录
		List<Map<String, Object>> selectList = ud.selectAllUser(up);
		Map<String,Object> userMap = new HashMap<String,Object>();
		userMap.put("total", total);
		userMap.put("rows", selectList);
		return userMap;
		
	}
	@Override
	public int insertUser(User u) {
		if(u.getUserId() == null){
			//插入用户表
			int insertRole1 = ud.insertUser(u);
			int flag = 0;
			String[] ss = u.getArr().split(";");
			for (int i = 0; i < ss.length; i++) {
				int m = Integer.parseInt(ss[i]);
				flag += ud.insertUserRole(m);//插入用户角色表
			}
			if(flag == ss.length && insertRole1 == 1){
				return 1;
			}
			return 0;
		}else{
			//修改角色信息
			int updateRole = ud.updateUser(u);
			//删除用户角色表的此角色权限
			ud.deleteUserRole(u.getUserId());
			//重新插入角色权限信息
			int flag = 0;
			String[] ss = u.getArr().split(";");
			for (int i = 0; i < ss.length; i++) {
				int m = Integer.parseInt(ss[i]);
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("userId", u.getUserId());
				map.put("roleId", m);
				flag += ud.insertUserRoleByMap(map);//插入用户角色表
			}
			if(flag == ss.length && updateRole == 1){
				return 2;
			}
			return 0;
		}
	}
	@Override
	public int deleteUser(String arr) {
		// TODO Auto-generated method stub
		String []ss = arr.split(";");
		int flag = 0;
		for (int i = 0; i < ss.length; i++) {
			flag += ud.deleteUser(Integer.parseInt(ss[i]));
		}
		if(flag == ss.length){
			return 1;
		}
		return 0;
	}
	@Override
	public int upUser(String arr) {
		// TODO Auto-generated method stub
		String []ss = arr.split(";");
		int flag = 0;
		for (int i = 0; i < ss.length; i++) {
			flag += ud.upUser(Integer.parseInt(ss[i]));
		}
		if(flag == ss.length){
			return 1;
		}
		return 0;
	}
	@Override
	public int updateUser(User u) {
		// TODO Auto-generated method stub
		return ud.updateUser(u);
	}
	@Override
	public String updatePwd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int flag = ud.updatePwd(map);
		if(flag==1){
			return "success";
		}
		return "error";
	}
	@Override
	public List<Map<String, Object>> getUploadByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return ud.getUploadByUserId(userId);
	}
	@Override
	public List<Map<String, Object>> getDownloadByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return ud.getDownloadByUserId(userId);
	}
}
