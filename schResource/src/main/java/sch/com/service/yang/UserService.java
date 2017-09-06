package sch.com.service.yang;

import java.util.List;
import java.util.Map;

import sch.com.entity.User;
import sch.com.entity.UserPage;

public interface UserService {
	/**
	 * 根据名字查找用户
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
	public Map<String,Object> selectAllUser(UserPage up);
	/**
	 * 插入用户信息
	 * @param u
	 * @return
	 */
	public int insertUser(User u);
	/**
	 * 禁用用户
	 * @param arr
	 * @return
	 */
	public int deleteUser(String arr);
	/**
	 * 启用用户
	 * @param arr
	 * @return
	 */
	public int upUser(String arr);
	/**
	 * 修改用户
	 * @param u
	 * @return
	 */
	public int updateUser(User u);
	/**
	 * 修改密码
	 * @param map
	 * @return
	 */
	public String updatePwd(Map<String, Object> map);
	
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
