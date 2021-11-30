package util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VerifyAccount")
public class VerifyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request
								, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		String verifyCode = (String)session.getAttribute("verifyCode");
		String inputCode = request.getParameter("inputCode");
		
		if(verifyCode.equals(inputCode)) {
			// jsp로 처리해야하나? 아니면 ajax?
		}
		
		response.sendRedirect("../index.jsp");
	}

}
