package sch.com.entity.yxf;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DataGrid {
	 private int total = 0;
	    private List<Map<String, Object>> rows ;
	    public int getTotal() {
	        return total;//数据总数
	    }
	    public void setTotal(int total) {
	        this.total = total;
	    }
		public List<Map<String, Object>> getRows() {
			return rows;
		}
		public void setRows(List<Map<String, Object>> rows) {
			this.rows = rows;
		}
	  
}
