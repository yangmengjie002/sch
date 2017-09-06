package sch.com.service.yxf;

import sch.com.entity.yxf.DataGrid;
import sch.com.entity.yxf.PerRecordPageCut;

public interface PersonRecordService {
	public DataGrid  queryRequestRceord(PerRecordPageCut perRecordPageCut);
	
}
