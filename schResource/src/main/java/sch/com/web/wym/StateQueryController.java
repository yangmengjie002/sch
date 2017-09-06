package sch.com.web.wym;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.dao.wymm.StateQueryDao;

@Controller
@RequestMapping("/wym")
public class StateQueryController {
	@Autowired
	private StateQueryDao stateQueryDao;
	
	//资源(jpg?)类型查询
	@RequestMapping("/stateQuery")
	@ResponseBody
	public List<HashMap<String, Object>> stateQuery(){
		return stateQueryDao.StateQuery();
	}
	
	
}
