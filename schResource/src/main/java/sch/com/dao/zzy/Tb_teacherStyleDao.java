package sch.com.dao.zzy;

import java.util.HashMap;
import java.util.List;

public interface Tb_teacherStyleDao {
	/**
	 * 查询名师风采
	 * @return
	 */
	public List<HashMap<String, Object>> findTeacher();
	/**
	 * 添加名师风采
	 */
	public void insertTeacher(HashMap<String, Object> hm);
	/**
	 * 删除名师
	 * @param teacher_id
	 * @return
	 */
	public int deleteTeacher(Integer teacher_id);
}
