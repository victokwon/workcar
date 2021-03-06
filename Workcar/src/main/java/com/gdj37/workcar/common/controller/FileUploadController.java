package com.gdj37.workcar.common.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.workcar.common.CommonProperties;
import com.gdj37.workcar.util.Utils;

@Controller
public class FileUploadController {
	@RequestMapping(value = "/fileUploadAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fileUploadAjax(HttpServletRequest request, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> modelMap = new HashMap<String, Object>();

		/* File Upload Logic */
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		String uploadExts = CommonProperties.FILE_EXT;
		String uploadPath = CommonProperties.FILE_UPLOAD_PATH;
		String fileFullName = "";

		File folder = new File(uploadPath);

		if (!folder.exists()) {
			folder.mkdir();
		}

		List<String> fileNames = new ArrayList<String>();
		try {
			final Map<String, MultipartFile> files = multipartRequest.getFileMap();
			Iterator<String> iterator = multipartRequest.getFileNames();

			while (iterator.hasNext()) {
				String key = iterator.next();
				MultipartFile file = files.get(key);
				if (file.getSize() > 0) {
					String fileRealName = file.getOriginalFilename();
					String fileTmpName = Utils.getPrimaryKey();
					String fileExt = FilenameUtils.getExtension(file.getOriginalFilename()).toLowerCase();

					if (uploadExts.toLowerCase().indexOf(fileExt) < 0) {
						throw new Exception("Not allowded file extension : " + fileExt.toLowerCase());
					} else {
						fileFullName = fileTmpName + fileRealName;
						file.transferTo(new File(new File(uploadPath), fileFullName));

						fileNames.add(fileFullName);
					}
				}
			}

			modelMap.put("result", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("result", CommonProperties.RESULT_ERROR);
		}

		modelMap.put("fileName", fileNames);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/imgFileUploadAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String imgFileUploadAjax(HttpServletRequest request, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> modelMap = new HashMap<String, Object>();
		
		/* File Upload Logic */
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		String uploadExts = CommonProperties.IMG_EXT;
		String uploadPath = CommonProperties.FILE_UPLOAD_PATH;
		String fileFullName = "";
		
		File folder = new File(uploadPath);
		
		if (!folder.exists()) {
			folder.mkdir();
		}
		
		List<String> fileNames = new ArrayList<String>();
		try {
			final Map<String, MultipartFile> files = multipartRequest.getFileMap();
			Iterator<String> iterator = multipartRequest.getFileNames();
			
			while (iterator.hasNext()) {
				String key = iterator.next();
				MultipartFile file = files.get(key);
				if (file.getSize() > 0) {
					String fileRealName = file.getOriginalFilename();
					String fileTmpName = Utils.getPrimaryKey();
					String fileExt = FilenameUtils.getExtension(file.getOriginalFilename()).toLowerCase();
					
					if (uploadExts.toLowerCase().indexOf(fileExt) < 0) {
						throw new Exception("Not allowded file extension : " + fileExt.toLowerCase());
					} else {
						fileFullName = fileTmpName + fileRealName;
						file.transferTo(new File(new File(uploadPath), fileFullName));
						
						fileNames.add(fileFullName);
					}
				}
			}
			
			modelMap.put("result", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("result", CommonProperties.RESULT_ERROR);
		}
		
		modelMap.put("fileName", fileNames);
		
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	public void editorImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload, ModelAndView modelAndView) throws Throwable {
		PrintWriter printWriter = null;
		try {
			String uploadExts = CommonProperties.IMG_EXT; // ?????????
			String uploadPath = CommonProperties.FILE_UPLOAD_PATH; // ???????????????
			String fileFullName = "";

			File fileDir = new File(uploadPath);

			if (!fileDir.exists()) {
				fileDir.mkdirs(); // ??????????????? ???????????? ???????????? ??????
			}

			if (upload.getSize() > 0) {
				String fileRealName = upload.getOriginalFilename().replace(" ", "_").toLowerCase(); // ???????????????
				String fileTmpName = Utils.getPrimaryKey(); // ?????? ????????? ??????
				String fileExt = FilenameUtils.getExtension(upload.getOriginalFilename()).toLowerCase(); // ??????

				if (uploadExts.toLowerCase().indexOf(fileExt) >= 0) {
					fileFullName = fileTmpName + fileRealName;
					upload.transferTo(new File(fileDir, fileFullName));

				} else {
					// ?????? ???????????? ?????? ??????
					printWriter = response.getWriter();

					printWriter.println("<script type='text/javascript'>alert('?????? ???????????? ????????? ?????? ????????????.');</script>");
					printWriter.flush();
					printWriter.close();
				}

				// ?????? ???
				String callback = request.getParameter("CKEditorFuncNum");

				printWriter = response.getWriter();

				printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
						+ callback + ",'" + "resources/upload/" + fileFullName + "','???????????? ????????? ???????????????.'" + ")</script>");
				printWriter.flush();
				printWriter.close();

			} else {
				// ?????? ????????? 0????????? ?????? ??????
				printWriter = response.getWriter();

				printWriter.println("<script type='text/javascript'>alert('?????? ???????????? ?????????????????????.');</script>");
				printWriter.flush();
				printWriter.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (printWriter != null) {
				printWriter.close();
			}
		}
	}
}
