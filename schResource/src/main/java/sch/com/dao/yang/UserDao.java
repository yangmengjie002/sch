package sch.com.dao.yang;


import java.util.List;
import java.util.Map;

import sch.com.entity.User;
import sch.com.entity.UserPage;

public interface UserDao {
	/**
	 * 根据用户名获取用户信息
	 * @param username
	 * @return
	 */
	public User getUser(String username);
	/**
	 * 获取用户信息
	 * @param u
	 * @return
	 */
	public User getUserInfo(User u);
	/**
	 * 查询用户信息
	 * @param up 
	 * @param up
	 * @return
	 */
	public List<Map<String, Object>> selectAllUser(UserPage up);
	/**
	 * 插入用户信息
	 * @param u
	 * @return
	 */
	public int insertUser(User u);
	/**
	 * 获取所有的记录
	 * @param up 
	 * @return
	 */
	public int getCount(UserPage up);
	/**
	 * 禁用用户
	 * @param userId
	 * @return
	 */
	public int deleteUser(int userId);
	/**
	 * 启用用户
	 * @param userId
	 * @return
	 */
	public int upUser(int userId);
	/**
	 * 修改用户
	 * @param u
	 * @return
	 */
	public int updateUser(User u);
	/**
	 * 插入用户角色表
	 * @param m
	 * @return
	 */
	public int insertUserRole(int m);
	/**
	 * 根据用户ID删除其角色
	 * @param userId
	 */
	public void deleteUserRole(Integer userId);
	/**
	 * 修改用户密码
	 * @param map
	 * @return
	 */
	public int updatePwd(Map<String, Object> map);
	/**
	 * 插入角色用户表
	 * @param map
	 * @return
	 */
	public int insertUserRoleByMap(Map<String, Object> map);
	/**
	 * 根据用户名查找上传信息
	 * @return
	 */
	public List<Map<String, Object>> getUploadByUserId(Integer userId);
	
	/**
	 * 根据用户名查找下载信息
	 * @return
	 */
	public List<Map<String, Object>> getDownloadByUserId(Integer userId);
}
