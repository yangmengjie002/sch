package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

/**
 * 个人中心相关操作
 * @author xiaoming
 *
 */
public interface MyCenterDao {
	//获取我的上传
	public List<HashMap<String,Object>> MyUploadQuery(int a);
}
