package sch.com.service.yang.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sch.com.dao.yang.RoleDao;
import sch.com.entity.Role;
import sch.com.entity.User;
import sch.com.service.yang.RoleService;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao rd;
	@Override
	public List<Map<String, Object>> getAllRole() {
		// TODO Auto-generated method stub
		return rd.getAllRole();
	}
	@Override
	public int RoleDelete(String arr) {
		// TODO Auto-generated method stub
		String []ss = arr.split(";");
		int flag = 0;
		for (int i = 0; i < ss.length; i++) {
			flag += rd.deleteRole(Integer.parseInt(ss[i]));
		}
		if(flag == ss.length){
			return 1;
		}
		return 0;
	}
	@Override
	public int roleUp(String arr) {
		// TODO Auto-generated method stub
		String []ss = arr.split(";");
		int flag = 0;
		for (int i = 0; i < ss.length; i++) {
			flag += rd.reverseRole(Integer.parseInt(ss[i]));
		}
		if(flag == ss.length){
			return 1;
		}
		return 0;
	}
	@Override
	@Transactional
	public int roleInsertOrUpdate(Role p) {
		// TODO Auto-generated method stub
		if(p.getRoleId() == null){
			//插入角色表
			int insertRole1 = rd.insertRole(p);
			int flag = 0;
			String[] ss = p.getArr().split(";");
			for (int i = 0; i < ss.length; i++) {
				int m = Integer.parseInt(ss[i]);
				flag += rd.insertRoleUrl(m);//插入角色权限表
			}
			if(flag == ss.length && insertRole1 == 1){
				return 1;
			}
			return 0;
		}else{
			//修改角色信息
			int updateRole = rd.updateRole(p);
			//删除用户角色表的此角色权限
			rd.deleteRoleUrl(p.getRoleId());
			//重新插入角色权限信息
			int flag = 0;
			String[] ss = p.getArr().split(";");
			for (int i = 0; i < ss.length; i++) {
				int m = Integer.parseInt(ss[i]);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("roleId", p.getRoleId());
				map.put("powerId", m);
				flag += rd.insertRoleUrlByMap(map);//插入角色权限表
			}
			if(flag == ss.length && updateRole == 1){
				return 2;
			}
			return 0;
		}
	}
	@Override
	public List<Map<String, Object>> getUrlByRoleId(int roleId) {
		// TODO Auto-generated method stub
		return rd.getUrlByRoleId(roleId);
	}

}
