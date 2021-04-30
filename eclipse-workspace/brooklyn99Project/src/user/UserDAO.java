package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.User;

import java.sql.DriverManager;

public class UserDAO {
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
	   public int joinUser(User user) throws ClassNotFoundException, SQLException{
	    	 String INSERT_USERS_SQL="INSERT INTO member_table"+
	     "(id,user_id,user_pw,user_name,user_email) VALUES"+
	    	"(?,?,?,?,?)";
	    	 
	    	 int result=0;
	    	 Class.forName("com.mysql.jdbc.Driver");
	    	 try(Connection conn=
	    			 DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", "root", "sh032418");
	    		 PreparedStatement ps=conn.prepareStatement(INSERT_USERS_SQL)){
	    		    ps.setInt(1, user.getId());
	    			 ps.setString(2, user.getUser_id());
	    			 ps.setString(3, user.getUser_pw());
	    			 ps.setString(4, user.getUser_name());
	    			 ps.setString(5, user.getUser_email());
	    			 System.out.println(ps);
	    			 result=ps.executeUpdate();
	    			 
	    			 
	    		 } catch(SQLException e) {
	    			 e.printStackTrace();
	    		 }
	    		 return result;
	    	 }
   }

