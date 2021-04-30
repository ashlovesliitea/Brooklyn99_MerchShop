package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private String id,pw,name;
       Connection conn;
      Statement st;
       ResultSet rs;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
       request.setCharacterEncoding("UTF-8");
       id=request.getParameter("id");
       pw=request.getParameter("pw");
       String query="select * from member_table where user_id='"+id+"'and user_pw='"+pw+"'";
       try {
    	   Class.forName("com.mysql.jdbc.Driver");
    	   conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", "root", "sh032418");
    	   st=conn.createStatement();
    	   rs=st.executeQuery(query);
    	   while(rs.next()) {
    		   id=rs.getString("user_id");
    		   pw=rs.getString("user_pw");
    		   name=rs.getString("user_name");
    		   System.out.println(id+" "+pw+" "+name);
    		   if(id!=null&&pw!=null&&name!=null) {
    		   HttpSession httpSession=request.getSession();
    		   httpSession.setAttribute("name", name);
    		   httpSession.setAttribute("id", id);
    		   httpSession.setAttribute("pw", pw);}
    		   else {
    			    ServletResponse resp=null;
					resp.setContentType("text/html; charset=utf-8");

    				PrintWriter out = resp.getWriter();

    				out.println("<script>");

    				out.println("alert('로그인 실패하였습니다!!');");

    				out.println("history.back();");

    				out.println("</script>");
    		   }
    	   }
       }catch(Exception e){
    	   e.printStackTrace();
       }
       response.sendRedirect("templates/main.jsp");
       }
    		   
	}



