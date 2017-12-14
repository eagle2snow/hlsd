package com.fh.controller.hlsd;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fh.util.PageData;

@SuppressWarnings("all")
@Controller
@RequestMapping("file")
public class UploadFileController {

	@RequestMapping(value = "/upload.do")
	@ResponseBody
	public Map<String, Object> upload(@RequestParam(value = "pictureFile", required = false) MultipartFile pictureFile,
			HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		PageData responseContent = null;
		try {
			String path = request.getRealPath("uploadFiles/upload/");
			
			File file = new File(path);
			
			if (!file.exists()) {
				file.mkdir();
			}
			
			String fileName = pictureFile.getOriginalFilename();
			fileName = rename(fileName);
			File targetFile = new File(path, fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			pictureFile.transferTo(targetFile);
			
			map.put("responseCode", 0);
			map.put("responseMessage", "文件路劲");
			responseContent = new PageData();
			responseContent.put("fileUrl", "/uploadFiles/upload/"+ fileName);
			map.put("responseContent", responseContent);

		} catch (Exception e) {
			e.printStackTrace();
			map.put("responseCode", 1);
			map.put("responseMessage", "操作失败");
			map.put("responseContent", responseContent);
		}

		return map;
	}

	private static String rename(String name) {

		Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		Long random = (long) (Math.random() * now);
		String fileName = now + "" + random;

		if (name.indexOf(".") != -1) {
			fileName += name.substring(name.lastIndexOf("."));
		}

		return fileName;
	}
}
