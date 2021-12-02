package util;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AccountDAO;

@WebServlet("/VerifyAccount")
public class VerifyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request
							, HttpServletResponse response) 
									throws ServletException, IOException {
		
		String code = request.getParameter("verifyCode");
		String email = (String)request
								.getSession()
								.getAttribute("email");
		
		if(code.isEmpty() || code.equals(""))
			response.sendRedirect(request.getContextPath());
		
		try {
			new AccountDAO().verifyAccount(email);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("verified", true);
		response.sendRedirect(request.getContextPath());
	}

}
