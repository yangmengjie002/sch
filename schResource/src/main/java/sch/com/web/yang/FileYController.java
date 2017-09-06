package sch.com.web.yang;
/**
 * �ļ��ϴ�����
 * @author yang
 *
 */

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sch.com.entity.User;
import sch.com.service.yang.FileYService;

@Controller
@RequestMapping("/file")
public class FileYController {
	@Autowired
	private FileYService fs;
	
	@RequestMapping(value="/download")
    public ResponseEntity<byte[]> download(Integer id,HttpServletRequest request,Model model)throws Exception {
    	String filename = "timg.jpg";
    	HttpSession session = request.getSession();
    	//��ȡ�û���Ϣ
    	User user = (User) session.getAttribute("user");
    	List<Map<String, Object>> fileInfoList =  fs.fileDown(user.getUserId(),id);
       //�����ļ�·��
       String path = request.getServletContext().getRealPath("/images/");
       System.out.println(path);
       File file = new File(path + File.separator + filename);
       HttpHeaders headers = new HttpHeaders();  
       //������ʾ���ļ������������������������  
       String downloadFielName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
       //֪ͨ�������attachment�����ط�ʽ����ͼƬ
       headers.setContentDispositionFormData("attachment", downloadFielName); 
       //application/octet-stream �� �����������ݣ�������ļ����أ���
       headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
       return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
               headers, HttpStatus.CREATED);  
    }
}
