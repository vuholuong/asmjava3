package utils;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import entities.User;

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter("/*")
public class AuthFilter extends HttpFilter implements Filter {
	String[] PUBLIC_PATHS = new String[]{"/login", "/google-login", "/callback"};
	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public AuthFilter() {
		super();
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);

		String requestedUri = req.getRequestURI();

		if (session == null || session.getAttribute("user") == null) {
			for (String publicPath : PUBLIC_PATHS) {
				if (requestedUri.endsWith(publicPath)) {
					chain.doFilter(request, response);
					return;
				} 
			}

			res.sendRedirect(req.getContextPath() + "/login");
			return;
			
		} else {
			for (String publicPath : PUBLIC_PATHS) {
				if (requestedUri.endsWith(publicPath)) {
					User u = (User) session.getAttribute("user");
					if (u.isBoss()) {
						res.sendRedirect("admin/courses");
					} else {
						res.sendRedirect("student/news");
					}
					return;
					
				}
			}
		}

		boolean isAdminRequest = req.getRequestURI().contains("/admin/");

		if (isAdminRequest) {
			User user = (User) session.getAttribute("user");
			if (!user.isBoss()) {
				if (req.getMethod().equalsIgnoreCase("POST") || req.getMethod().equalsIgnoreCase("DELETE")) {
					res.getWriter().write("NOT ALLOW!");
					return;

				} else {
					res.sendRedirect("/StudentManagement/student/grades");
					return;
				}

			}

		}

		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
