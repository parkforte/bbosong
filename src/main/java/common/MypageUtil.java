package common;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MypageUtil {
	//자료실-업로드 경로
	public static final String UPLOAD_PATH="notice_upload";
	//테스트 경로
	public static final String TEST_PATH
="C:\\Users\\hello\\git\\bbosong\\src\\main\\webapp\\notice_upload";
	
	public static String displayRe(int step) {
		//답변글인 경우 단계별로 이미지 보여주기
		String result="";
		if(step>0){  //답변글
			for(int k=0;k<step;k++){ 
				result+= "&nbsp;";
			}//for 
			
			result+= "<img src='../img/re.gif'>";	
		}//if 
		
		return result;
	}
	
	public static String cutString(String title, int len) {		
		// 제목이 긴 경우 일부만 보여주기 - 30자
		String result=title;
		if(title.length()>len) {
			result=title.substring(0,len)+"...";
		}
		
		return result;
	}
	
	public static String displayNew(Date regdate) {
		//24시간 이내의 글인 경우 new 이미지 보여주기
		Date today = new Date();
		long gap=(today.getTime() - regdate.getTime())/1000;
		gap = gap/(60*60); //시간
		
		String result="";
		if(gap<24) {
			result="<img src='../img/new.gif' alt='new이미지'>";
		}
		
		return result;
	}
	
	public static String displayFile(String fileName) {
		//파일이 첨부된 경우 파일이미지 보여주기
		String result="";
		if(fileName!=null && !fileName.isEmpty()) {
			result="<img src='../img/file.gif' alt='file이미지'>";
		}
		
		return result;
	}
	
	public static String showFileInfo(String oFileName, long fileSize) {
		String result="";
		if(oFileName!=null && !oFileName.isEmpty()) {
			float fSize = Math.round(fileSize/1000f*10)/10f;
			
			result=displayFile(oFileName)+" " + oFileName
					+" (" + fSize+"KB)";
		}
		
		return result;
	}
	
	/**
	 * SimpleDateFormat 유틸
	 * @param regdate
	 * @return
	 */
	public static String changeFormat(Timestamp regdate) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String newRegdate=sdf.format(regdate);
		return newRegdate;
	}
	
	/**
	 * 이메일에서 지점명변경
	 * @param email
	 * @return
	 */
	public static String displayStoreName(String email) {
		String storeName="";
		if(email.equals("bbosong1001@dream.com")) {
			storeName="강남지점";
		}else if(email.equals("bbosong1002@dream.com")){
			storeName="서초지점";
		}else if(email.equals("bbosong1003@dream.com")){
			storeName="동작지점";
		}else if(email.equals("bbosong1004@dream.com")){
			storeName="송파지점";
		}else if(email.equals("bbosong1000@dream.com")){
			storeName="고객센터";
		}
		return storeName;
	}
}










