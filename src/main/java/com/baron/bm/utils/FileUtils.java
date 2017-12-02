package com.baron.bm.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.baron.member.model.BookModel;

@Component("fileUtils")
public class FileUtils   {
	private static final String filePath = "C:\temp\file\\";

	public List<Map<String, Object>> parseInsertFileInfo(BookModel book,
			HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest
					.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName
						.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString()
						+ originalFileExtension;

				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);

				listMap = new HashMap<String, Object>();
				listMap.put("book_cd", book.getBook_cd());
				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("fileName", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}

	/**
	 * @author haneulnoon
	 * @since 2009-09-10
	 *
	 */

	private FTPClient client = null;

	/**
	 * 서버와 연결에 필요한 값들을 가져와 초기화 시킴
	 *
	 * @param host
	 *            서버 주소
	 * @param userName
	 *            접속에 사용될 아이디
	 * @param password
	 *            비밀번호
	 * @param port
	 *            포트번호
	 */
	public void init() {
		String host = "175.200.81.11";
		String userName="ATTFL";
		String password="EDPS";
		int port= 21;
		client = new FTPClient();
		client.setControlEncoding("euc-kr"); // 한글 encoding....

		FTPClientConfig config = new FTPClientConfig();
		client.configure(config);
		try {
			client.connect(host, port);
			client.login(userName, password);
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 하나의 파일을 업로드 한다.
	 *
	 * @param dir
	 *            저장시킬 주소(서버)
	 * @param uploadfile
	 *            저장할 파일
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	public void upload(String dir, MultipartFile uploadfile, String fileName) throws IllegalStateException, IOException {		 
		InputStream in = null; 
		try {
			init();
			in = uploadfile.getInputStream();
			client.storeFile(dir + fileName, in);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
				disconnection();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 하나의 파일을 다운로드 한다.
	 *
	 * @param dir
	 *            저장할 경로(서버)
	 * @param downloadFileName
	 *            다운로드할 파일
	 * @param path
	 *            저장될 공간
	 * @throws IOException 
	 */
	public FileOutputStream download(String dir, String downloadFileName) throws NullPointerException, IOException { 
		String path ="c:/temp/" + downloadFileName;
		FileOutputStream out = null; 
		InputStream in = null;
		dir += downloadFileName;
		try {
			init();
			in = client.retrieveFileStream(dir);
			out = new FileOutputStream(new File(path));
			int i;
			while ((i = in.read()) != -1) {
				out.write(i);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (in!=null){in.close();}
 			if (out!=null){out.close();} 
			disconnection();
		}
		return out;
	};

	/**
	 * 서버와의 연결을 끊는다.
	 */
	public void disconnection() {
		try {
			client.logout();
			if (client.isConnected()) {
				client.disconnect();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}