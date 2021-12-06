package util;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class OrderUtil {
	
	/**
	 * 메뉴번호
	 * @param laundryNo
	 * @return
	 */
	public static String displayPrice(int laundryNo) {
		String price="";
		if(laundryNo==2) {			//와이셔츠
			price="3000";
		}else if(laundryNo==3) {	//정장세트
			price="8000";
		}else if(laundryNo==4) {	//바지
			price="3000";
		}else if(laundryNo==5) {	//스웨터
			price="3000";
		}else if(laundryNo==6) {	//겨울코트
			price="8000";
		}else if(laundryNo==11) {	//이불
			price="10000";
		}else if(laundryNo==12) {	//신발
			price="6000";
		}
		return price;
	}
	
	/**
	 * 이름변경
	 * @param laundryNo
	 * @return
	 */
	public static String displayLaundryName(int laundryNo) {
		String laundryName="";
		if(laundryNo==2) {			//와이셔츠
			laundryName="와이셔츠";
		}else if(laundryNo==3) {	//정장세트
			laundryName="정장세트";
		}else if(laundryNo==4) {	//바지
			laundryName="바지";
		}else if(laundryNo==5) {	//스웨터
			laundryName="스웨터";
		}else if(laundryNo==6) {	//겨울코트
			laundryName="겨울코트";
		}else if(laundryNo==11) {	//이불
			laundryName="이불";
		}else if(laundryNo==12) {	//신발
			laundryName="신발";
		}
		return laundryName;
	}
	
	
	public static String changeDecimalFormat(int price) {
		DecimalFormat df=new DecimalFormat("#,###원");
		String cdf=df.format(price);
		return cdf;
	}
	
	
	public static String displayCouponName(int serialNo) {
		String couponName="";
		if(serialNo==11232) {
			couponName="회원가입 쿠폰(20%)";
		}
		return couponName;
	}

}
