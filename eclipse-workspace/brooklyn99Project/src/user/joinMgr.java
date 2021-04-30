package user;
import java.util.*;
import java.sql.*;

public class joinMgr {
  private final String JDBC_DRIVER="com.mysql.jdbc.Driver";
   private final String JDBC_URL="jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
   private final String USER="root";
   private final String PASS="sh032418";
   public int recordNum=0;
   private static joinMgr instance;
   
   public joinMgr() {
	   try {
		   Class.forName(JDBC_DRIVER);
	   }
	   catch(Exception e) {e.printStackTrace();}
	  
   }
   
   public static joinMgr getInstance(){
       if(instance==null)
           instance=new joinMgr();
       return instance;
   }
   
   
   public User getUserInfo(String id) {
	   Connection conn=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;
	   User userBean=null;
	   try {
		   conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
		   String strQuery="select * from member_table where user_id=?";
		   pstmt=conn.prepareStatement(strQuery);
		    pstmt.setString(1,id);
		   rs=pstmt.executeQuery();
		   
		   while(rs.next()) {
			   userBean=new User();
			   userBean.setUser_id(rs.getString(2));
			   userBean.setUser_pw(rs.getString(3));
			   userBean.setUser_name(rs.getString(4));
			   userBean.setUser_email(rs.getString(5));
		   }

		   }catch(Exception e) {e.printStackTrace();}
	   finally {
	            // Connection, PreparedStatement¸¦ ´Ý´Â´Ù.
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	 
	   }
	   }
	return userBean;
	   
   }
	   
   public Vector<User>getUserList(){
	   Connection conn=null;
	   Statement stmt=null;
	   ResultSet rs=null;
	   Vector<User>vlist=new Vector<User>();
	   try {
		   conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
		   String strQuery="select * from member_table";
		   stmt=conn.createStatement();
		   rs=stmt.executeQuery(strQuery);
		   while(rs.next()) {
			   User userBean=new User();
			   userBean.setUser_id(rs.getString("user_id"));
			   userBean.setUser_pw(rs.getString("user_pw"));
			   userBean.setUser_email(rs.getString("user_email"));
			   userBean.setUser_name(rs.getString("user_name"));			   
			   vlist.add(userBean);
			   recordNum++;
		   }
	   }
	   catch(Exception e) {
		   System.out.println(e);
	   }finally {
		   if(rs!=null)try {rs.close();}catch(SQLException e){}
		   if(stmt!=null)try {stmt.close();}catch(SQLException e){}
		   if(conn!=null)try {conn.close();}catch(SQLException e){}

	   }
	return vlist;
	   
   }
   
   public int getCount() {
	   return recordNum;
   }
   
   public void Deletemember(String deleteUser) {
	   Connection conn=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;
	   try {
    String deleteQuery="DELETE FROM member_table WHERE user_id=?";
    conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
    pstmt=conn.prepareStatement(deleteQuery);
    pstmt.setString(1,deleteUser);
   pstmt.executeUpdate();
	   }catch(Exception sqle) {
		   try {
			   conn.rollback();
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }
		   throw new RuntimeException(sqle.getMessage());
	   }finally {
		   try {if(pstmt!=null) {pstmt.close();pstmt=null;}
		      if(conn!=null) {conn.close();conn=null;}
		   }catch(Exception e) { throw new RuntimeException(e.getMessage());}
	   }
	   
   }

   public void updateMember(User member) throws SQLException{
       
       Connection conn = null;
       PreparedStatement pstmt = null;

       try {

           
           String query="UPDATE member_table SET user_pw=?, user_name=?, user_email=? WHERE user_id=?";

           conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
           pstmt = conn.prepareStatement(query);

  
           
          
           pstmt.setString(1, member.getUser_pw());
           pstmt.setString(2, member.getUser_name());
           pstmt.setString(3,member.getUser_email());
           pstmt.setString(4, member.getUser_id());
           pstmt.executeUpdate();
          
                       
       } catch (Exception sqle) {
        
           throw new RuntimeException(sqle.getMessage());
       } finally {
           try{
               if ( pstmt != null ){ pstmt.close(); pstmt=null; }
               if ( conn != null ){ conn.close(); conn=null;    }
           }catch(Exception e){
               throw new RuntimeException(e.getMessage());
           }
       }
   } // end updateMember
   
}
