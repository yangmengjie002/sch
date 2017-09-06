package sch.com.web.yxf;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sch.com.utils.FileDownload;

@RequestMapping("/download")
@Controller
public class FileDownloadController {
	
		private FileDownload fd;
    	
    /**
     * 文件下载
     * @Description: 
     * @param fileName
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/download")
    public void downloadFile( String fileName,
            HttpServletRequest request, HttpServletResponse response) {
    		System.out.println(fileName);
    	try {
    		fd.downloadFile(fileName, request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
    		
    		
      
    }
}
