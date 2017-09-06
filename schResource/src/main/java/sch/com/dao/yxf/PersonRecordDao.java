package sch.com.dao.yxf;

import java.util.List;
import java.util.Map;

import sch.com.entity.yxf.PerRecordPageCut;


public interface PersonRecordDao {
	List<Map<String, Object>>  queryRequestRceord(PerRecordPageCut perRecordPageCut);
	public int getTotalNum(PerRecordPageCut perRecordPageCut);
}
