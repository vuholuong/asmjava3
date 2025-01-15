package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import daos.UserDAO;
import entities.User;

@WebServlet("/login") // Annotation định nghĩa URL mà servlet này sẽ xử lý
public class LoginController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Chuyển tiếp yêu cầu tới trang login.jsp để hiển thị form đăng nhập
        req.getRequestDispatcher("pages/login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Lấy giá trị email và password từ form đăng nhập
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Khởi tạo đối tượng UserDAO để tương tác với cơ sở dữ liệu
        UserDAO dao = new UserDAO();
        // Lấy thông tin người dùng từ cơ sở dữ liệu dựa trên email
        User user = dao.selectByEmail(email);

        // Kiểm tra xem người dùng có tồn tại và mật khẩu có khớp không
        if (user == null || !user.getPassword().equals(password)) {
            // Nếu người dùng không tồn tại hoặc mật khẩu không đúng, thiết lập thông báo lỗi
            req.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng");
            // Chuyển tiếp lại tới trang login.jsp để hiển thị thông báo lỗi
            req.getRequestDispatcher("pages/login.jsp").forward(req, res);
        } else {
            // Nếu đăng nhập thành công, tạo hoặc lấy session hiện tại
            HttpSession session = req.getSession();
            // Đặt thông tin người dùng vào session
            session.setAttribute("user", user);
            // Chuyển hướng tới trang admin/users
            res.sendRedirect("admin/users");
        }
    }
}
