package sch.com.web.yang;
/**
 * �ļ��ϴ�����
 * @author yang
 *
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import sch.com.entity.ResourceYInfo;
import sch.com.entity.User;
import sch.com.service.yang.FileYService;

@Controller
@RequestMapping("/file")
public class FileYController {
	@Autowired
	private FileYService fs;

	@RequestMapping(value="/download")
	public ResponseEntity<byte[]> download(Integer id,HttpServletRequest request,Model model)throws Exception {
		//String filename = "timg.jpg";
		HttpSession session = request.getSession();
		//��ȡ�û���Ϣ
		User user = (User) session.getAttribute("user");
		List<Map<String, Object>> fileInfoList =  fs.fileDown(user.getUserId(),id);
		String filename = fileInfoList.get(0).get("RESOURCE_ROAD")+"";
		//��ȡ�ļ�·��
		String tomcaturl=System.getProperty("catalina.home");
		String saveFilePath = tomcaturl+"\\testwebapps\\schResource\\images";
		//�����ļ�·��

		String path = request.getServletContext().getRealPath("/images/");
		System.out.println(path);
		File file = new File("d:\\upload" + File.separator + filename);
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


	/** 
	 * ��֤�ϴ��ļ�
	 */  
	@RequestMapping("/upload")
	@ResponseBody
	public Map<String,Object> oneFileUpload(ResourceYInfo resourceInfo,@RequestParam("file") CommonsMultipartFile file,  
			HttpServletRequest request, ModelMap model) {  
		// ���ԭʼ�ļ���  
		String fileName = file.getOriginalFilename();  
		System.out.println("ԭʼ�ļ���:" + fileName);  
		//��ȡ�ļ��ĺ�׺
		int m = fileName.indexOf(".");
		String postfix = fileName.substring(m+1);
		System.out.println(postfix);
		//���ݺ�׺��ȡ�ļ���������Ϣ
		List<Map<String, Object>> postfixList = fs.getResourceInfoFix(postfix);
		// ���ļ���  
		if(postfixList.size()==0){
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("url", "1");
			return map;
		}
		String newFileName = UUID.randomUUID() + fileName;  

		// �����Ŀ��·��  
		ServletContext sc = request.getSession().getServletContext();  
		// �ϴ�λ��  
		//String path = sc.getRealPath("/image") + "/"; // �趨�ļ������Ŀ¼  
		
		String path = "/upload/";
		File f = new File(path);  
		if (!f.exists())  
			f.mkdirs();  
		if (!file.isEmpty()) {  
			try {  
				FileOutputStream fos = new FileOutputStream(path + newFileName);  
				InputStream in = file.getInputStream();  
				int b = 0;  
				while ((b = in.read()) != -1) {  
					fos.write(b);  
				}  
				fos.close();  
				in.close();  
			} catch (Exception e) {  
				e.printStackTrace();  
			}  
		}  
		postfixList.get(0).put("url", newFileName);
		System.out.println("�ϴ�ͼƬ��:" + path + newFileName);  
		// �����ļ���ַ������JSPҳ�����  
		model.addAttribute("fileUrl", path + newFileName);  
		return postfixList.get(0);  
	}
	/**
	 * �������ݿ�
	 * @param resourceInfo
	 * @return
	 */
	@RequestMapping("/uploadAll")
	@ResponseBody
	public String fileUploadAll(ResourceYInfo resourceInfo,HttpSession session){
		User user = (User) session.getAttribute("user");
		resourceInfo.setUserId(user.getUserId());
		System.out.println(resourceInfo.toString());
		
		return fs.fileUploadAll(resourceInfo);
	}

}
