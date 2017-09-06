package sch.com.service.yxf.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.yxf.PersonRecordDao;
import sch.com.entity.yxf.DataGrid;
import sch.com.entity.yxf.PerRecordPageCut;
import sch.com.service.yxf.PersonRecordService;

@Service	
public class PersonRecordServiceImpl implements PersonRecordService {
	@Autowired
	private PersonRecordDao prd;

	
	@Override
	public DataGrid queryRequestRceord(PerRecordPageCut perRecordPageCut) {
		// TODO Auto-generated method stub
		DataGrid dataGrid =new DataGrid();
		
		List<Map<String, Object>> rudl=prd.queryRequestRceord(perRecordPageCut);
		dataGrid.setRows(rudl);
		dataGrid.setTotal(rudl.size());
		System.out.println(perRecordPageCut.getUserId());
		return dataGrid;
	}

}
