package kr.co.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownload {
	
	public static void fileDownload(HttpServletRequest request, HttpServletResponse response, String paramName, String folderName)
	throws IOException, ServletException{
		
		String filename = paramName; // sys파일네임234
		String realPath = request.getServletContext().getRealPath(folderName); // 저장디렉토리이름
		String filePath = realPath + File.separator + filename; // \...디렉토리\파일명 
		
		FileInputStream in = null; // reader는 문자열만을 사용할 때, 
		try {
			in = new FileInputStream(filePath);
			
			//main타입을 설정
			String sMineType = request.getServletContext().getMimeType(filePath);
			if(sMineType == null) {
				sMineType = "applicaton/octet-stream";
			}
			response.setContentType(sMineType);
			//파일 이름 디코딩
			String encoding = new String(filename.getBytes("utf-8"),"8859_1");
			//저장될 파일이름 응답.셋헤더 http가 처리
			response.setHeader("Content-Disposition", "attachment;filename="+encoding);
			// OutputStream() 호출
			ServletOutputStream out = response.getOutputStream();
			byte[] arr = new byte[1024*1];
			int length = -1;
			while(true) {
				length = in.read(arr, 0, arr.length);
				if(length == -1) {
					break;
				}
				out.write(arr, 0, length);// 마지막 length != arr.length 일 수 있다.
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				in.close();
			}
		}
	}

	
}
