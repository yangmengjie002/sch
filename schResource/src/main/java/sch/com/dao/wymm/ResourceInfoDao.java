package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

/**
 * 信息下载详情页面相关操作
 * @author xiaoming
 *
 */
public interface ResourceInfoDao {
	//获得已发布信息列表
	public List<HashMap<String,Object>> InfoQuery();
}
