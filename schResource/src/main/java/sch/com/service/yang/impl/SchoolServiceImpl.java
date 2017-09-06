package sch.com.service.yang.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.yang.SchoolDao;
import sch.com.service.yang.SchoolService;
@Service
public class SchoolServiceImpl implements SchoolService{
	@Autowired
	private SchoolDao sd;

	@Override
	public List<Map<String, Object>> getInstitute() {
		// TODO Auto-generated method stub
		return sd.getInstitute();
	}

	@Override
	public List<Map<String, Object>> getMajor(int instituteId) {
		// TODO Auto-generated method stub
		return sd.getMajor(instituteId);
	}

	@Override
	public List<Map<String, Object>> getAllMajor() {
		// TODO Auto-generated method stub
		return sd.getAllMajor();
	}

}
