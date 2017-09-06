package sch.com.dao.yang;

import java.util.List;
import java.util.Map;
/**
 * 文件下载
 * @author yang
 *
 */
public interface FileYDao {
	/**
	 * 根据上传ID获取文件存储信息
	 * @param id
	 * @return
	 */
	public List<Map<String, Object>> getFileInfo(Integer id);
	/**
	 * 插入下载资源表
	 * @param map
	 * @return
	 */
	public int insertDownload(Map<String,Object> map);
}
