package util;

import java.nio.charset.Charset;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendVerifyMail {
	String sender = "bbosong132@gmail.com";
	String password = "Bbosong132@!";
	
	/**
	 * @author YJ_Lee
	 * 
	 * @param recipient 보낼 이메일 주소
	 * @return verifyCode 인증코드
	 * 
	 * 이메일 주소를 매개변수로 받아 해당 이메일 주소에게 인증코드 6자리 전송
	 * 인증코드를 리턴하므로 해당 처리 필요
	 * e.g. 세션에 담아 인증 완료, 세션 만료시 재전송 필요
	 */
	public String send(String recipient) throws AddressException, MessagingException {
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });
        
        MimeMessage message = new MimeMessage(session);
        
        byte[] randByte = new byte[256];
        new Random().nextBytes(randByte);
        String verifyCode = new String(randByte, Charset.forName("utf-8"));
        verifyCode = verifyCode.replaceAll("[^0-9A-Z]", "").substring(0, 6);
        
    	message.setFrom(new InternetAddress(sender));
    	message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
    	message.setSubject("[뽀송 Dream] 이메일 인증을 완료해주세요!");
    	message.setText("인증코드: " + verifyCode);
    	Transport.send(message);
    	
    	return verifyCode;
	}
}
