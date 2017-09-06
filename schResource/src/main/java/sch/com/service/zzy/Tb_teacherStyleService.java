package sch.com.service.zzy;

import java.util.HashMap;
import java.util.List;

public interface Tb_teacherStyleService {
	/**
	 * 查询名师风采
	 * @return
	 */
	public List<HashMap<String,Object>> findTeacher();
	/**
	 * 添加名师风采
	 */
	public void insertTeacher(HashMap<String, Object> hm);
	/**
	 * 删除
	 * @param teacher_id
	 * @return
	 */
	public int deleteTeacher(Integer teacher_id);
}
