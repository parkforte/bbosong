package util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;

public class BoardUtil {
	private String uploadPath;
	
	public BoardUtil(ServletConfig config, String path) {
		uploadPath = config.getServletContext().getRealPath(path);
	}
	
	public String getUploadPath() {
		return uploadPath;
	}
	
	public static String displayRe(int step) {
		String result = "";
		if (step > 0) { // 답변글
			for (int k = 0; k < step; k++) {
				result += ("&nbsp;");
			}

			result += "<img src='../img/re.gif'>";
		}

		return result;
	}

	public static String cutString(String title, int len) {
		// 제목이 긴 경우 일부만 보여주기 - 30자
		String result = title;
		if (title.length() > len) {
			result = title.substring(0, len) + "...";
		}

		return result;
	}
	
	public static String displayNew(Date regdate) {
		// 24시간 이내의 글인 경우 new 이미지 보여주기
		Date today = new Date();
		long gap = (today.getTime() - regdate.getTime()) / 1000;
		gap = gap / (60 * 60); // 시간

		String result = "";
		if (gap < 24) {
			result = "<img src='../img/new.gif' alt='new이미지'>";
		}

		return result;
	}

	public static String displayFile(String fileName) {
		// 파일이 첨부된 경우 파일이미지 보여주기
		String result = "";
		if (fileName != null && !fileName.isEmpty()) {
			result = "<img src='../img/file.gif' alt='file이미지'>";
		}

		return result;
	}

	public static String showFileInfo(String oFileName, long fileSize) {
		String result = "";
		if (oFileName != null && !oFileName.isEmpty()) {
			Float fSize = Math.round(fileSize / 1000f * 10) / 10f;

			result = displayFile(oFileName) + " " + oFileName + " (" + fSize + "KB)";
		}

		return result;
	}
	
	public static String changeFormat(Timestamp regdate) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String newRegdate=sdf.format(regdate);
		return newRegdate;
	}
}
