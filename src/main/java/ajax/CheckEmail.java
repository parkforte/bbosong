package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.AccountDAO;

@WebServlet("/CheckEmail")
public class CheckEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request
							,HttpServletResponse response)
								throws ServletException, IOException {
		
		Gson gson = new Gson();
		HashMap<String, Boolean> map = new HashMap<String, Boolean>();
		PrintWriter writer = new PrintWriter(response.getWriter());
		
		String email = request.getParameter("email");
		
		if(email == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		
		AccountDAO dao = new AccountDAO();
		boolean isDuplicated = true;
		
		try {
			isDuplicated = dao.checkDuplicate(email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(isDuplicated) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		
		String result = gson.toJson(map);
		System.out.println(result);
		writer.print(result);
	}
}
