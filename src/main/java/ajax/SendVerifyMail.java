package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.HashMap;
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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

@WebServlet("/SendVerifyMail")
public class SendVerifyMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String sender = "bbosong132@gmail.com";
	private final String password = "Bbosong132@!";
	
	protected void service(HttpServletRequest request
							, HttpServletResponse response) 
									throws ServletException, IOException {
		
		Gson gson = new Gson();
		HashMap<String, String> map = new HashMap<String, String>();
		PrintWriter writer = new PrintWriter(response.getWriter());
		String recipient = request.getParameter("email");
		
		if(recipient == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session mailSession = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });
        
        MimeMessage message = new MimeMessage(mailSession);
        
        byte[] randByte = new byte[256];
        new Random().nextBytes(randByte);
        String verifyCode = new String(randByte, Charset.forName("utf-8"));
        verifyCode = verifyCode.replaceAll("[^0-9A-Z]", "").substring(0, 6);
        
    	try {
    		message.setFrom(new InternetAddress(sender));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			message.setSubject("[뽀송 Dream] 이메일 인증을 완료해주세요!");
			message.setText("인증코드: " + verifyCode);
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
			map.put("result", "이메일 주소가 잘못입력되었습니다.");
		} catch (MessagingException e) {
			e.printStackTrace();
			map.put("result", "메일 전송에 실패하였습니다.");
		}
    	
    	map.put("result", verifyCode);
    	String result = gson.toJson(map);
    	writer.print(result);
	}
}
