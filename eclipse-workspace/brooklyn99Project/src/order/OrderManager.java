package order;
import java.util.*;

import user.User;

import java.sql.*;

public class OrderManager {
	private final String JDBC_URL="jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	   private final String USER="root";
	   private final String PASS="sh032418";
	   
public void insertOrder(OrderBean bean) {
	   Connection conn=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;

	    try {
	    	String sql="insert into order_list(product_no,quantity,date,order_name) values(?,?,now(),?)";
	    	conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
			   pstmt=conn.prepareStatement(sql);
			   pstmt.setInt(1,bean.getProduct_no());
			   pstmt.setInt(2,bean.getQuantity());
			   pstmt.setString(3, bean.getOrder_name());
			   pstmt.executeUpdate();}

			   catch (Exception e) {

					System.out.println("insertOrder err : " + e);

				} finally {

					try {

						if(rs!=null)rs.close();

						if(pstmt!=null)pstmt.close();

						if(conn!=null)conn.close();

					} catch (Exception e2) {

						// TODO: handle exception

					}
				}}

public ArrayList <OrderBean> getOrder(String name){
	ArrayList<OrderBean>list=new ArrayList<OrderBean>();
	  Connection conn=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;

	    try {
	    	String sql="select * from order_list where order_name=? order by no desc";
	    	conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
			   pstmt=conn.prepareStatement(sql);
			   pstmt.setString(1, name);
			   rs=pstmt.executeQuery();
			   while(rs.next()) {
				   OrderBean bean=new OrderBean();
				   bean.setNo(rs.getInt("no"));
				   bean.setProduct_no(rs.getInt("product_no"));
				   bean.setQuantity(rs.getInt("quantity"));
				   bean.setDate(rs.getString("date"));
				   bean.setOrder_name("order_name");
				   list.add(bean);}} catch (Exception e) {

						System.out.println("getOrder err : " + e);

					} finally {

						try {

							if(rs!=null)rs.close();

							if(pstmt!=null)pstmt.close();

							if(conn!=null)conn.close();

						} catch (Exception e2) {

							// TODO: handle exception

						}

					}

					return list;

			   }
	
public void updateOrderList(User member,String formername) throws SQLException{
    
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {

        
        String query="UPDATE member_table SET user_name=? WHERE user_name=?";

        conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
        pstmt = conn.prepareStatement(query);


        
       
        pstmt.setString(1, member.getUser_id());
        pstmt.setString(2,formername);
       
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

