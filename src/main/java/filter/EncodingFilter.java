package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * @author YJ_Lee
 *
 * 어노테이션이 /* 이므로 모든 주소는 이 필터를 거침
 * 필터에서 response의 인코딩 타입을 정함
 * 다시말해 각각의 페이지에서 따로 설정할 필요 없음
 */
@WebFilter("/*")
public class EncodingFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response
							, FilterChain chain) throws IOException, ServletException {
		
		response.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
	}

}
