package product;
import order.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import user.User;

public class ProductManager {
	private final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	   private final String JDBC_URL="jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	   private final String USER="root";
	   private final String PASS="sh032418";
	   
	   
	   public ProductManager() {
		   try {
			   Class.forName(JDBC_DRIVER);
		   }
		   catch(Exception e) {e.printStackTrace();}
		  
	   }
	   
	   public ArrayList <ProductBean> getProductAll(){
		   ArrayList<ProductBean> list=new ArrayList<ProductBean>();
		   Connection conn=null;
		   PreparedStatement pstmt=null;
		   ResultSet rs=null;
		   try {
			   String strQuery="select * from product";
			   conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
			   pstmt=conn.prepareStatement(strQuery);
			   rs=pstmt.executeQuery();
			   while(rs.next()) {
				    ProductBean pro=new ProductBean();
				    pro.setName(rs.getString("name"));
				    pro.setPrice(rs.getInt("price"));
				    pro.setStock(rs.getInt("stock"));
				    pro.setImg(rs.getString("Img"));
				    list.add(pro);
			   }
			   
		   }catch(Exception e) {e.printStackTrace();}
		   finally {
			   try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {e2.printStackTrace();}
		   }
		   return list;
	   }
	   
	   public ProductBean getProduct(int id){
		  
		   Connection conn=null;
		   PreparedStatement pstmt=null;
		   ResultSet rs=null;
		   ProductBean pro=new ProductBean();

		   try {
			   String strQuery="select * from product where id=?";
			   conn=DriverManager.getConnection(JDBC_URL, USER, PASS);
			   pstmt=conn.prepareStatement(strQuery);
			   pstmt.setInt(1, id);
			   rs=pstmt.executeQuery();
			 			   if (rs.next()) {
				   pro.setId(id);
				    pro.setName(rs.getString("name"));
				    pro.setPrice(rs.getInt("price"));
				    pro.setStock(rs.getInt("stock"));
				    pro.setImg(rs.getString("Img"));
			   }
			   
		   }catch(Exception e) {e.printStackTrace();}
		   finally {
			   try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {e2.printStackTrace();}
		   }
		   return pro;
	   }
	   
	   public void reduceProduct(OrderBean bean) {
		   Connection conn=null;
		   PreparedStatement pstmt=null;
		   ResultSet rs=null;
		   try {

				String sql = "update product set stock=(stock-?) where id=?";
				   conn=DriverManager.getConnection(JDBC_URL, USER, PASS);

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, bean.getQuantity());

				pstmt.setInt(2, bean.getProduct_no());

				pstmt.executeUpdate();

			} catch (Exception e) {

				System.out.println("reduceProduct err : " + e);

			} finally {

				try {

					if(rs!=null)rs.close();

					if(pstmt!=null)pstmt.close();

					if(conn!=null)conn.close();

				} catch (Exception e2) {

					// TODO: handle exception

				}

			}
		   
	   }
}
