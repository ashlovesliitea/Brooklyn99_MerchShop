package user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;

/**
 * Servlet implementation class joinServlet
 */
@WebServlet("/join")
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private UserDAO userDAO=new UserDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String user_id=request.getParameter("user_id");
		  String user_pw=request.getParameter("user_pw");
		  String user_name=request.getParameter("user_name");
		 String user_email=request.getParameter("user_email");
		 
	   User user=new User();
		 user.setUser_email(user_email);
		 user.setUser_name(user_name);
		 user.setUser_id(user_id);
		 user.setUser_pw(user_pw);
		 
		 try {
			userDAO.joinUser(user);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 //특정 페이지로 이동하고 싶을 때 사용한다.
		  response.sendRedirect("templates/login.jsp");
		 
	}

}
