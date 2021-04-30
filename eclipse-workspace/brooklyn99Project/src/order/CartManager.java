package order;
import java.util.*;
public class CartManager {
    private Hashtable <Integer,OrderBean>hCart=new Hashtable<Integer,OrderBean>();
    
    public void addCart(OrderBean obean) {
       int product_no=obean.getProduct_no();
    	int quantity=obean.getQuantity();
    	System.out.print("quantity:"+quantity);
    	if(quantity>0) {
    		if(hCart.containsKey(product_no)) {
    			OrderBean tempBean=(OrderBean)hCart.get(product_no);
    			quantity+=tempBean.getQuantity();
    			tempBean.setQuantity(quantity);
    			hCart.put(product_no, tempBean);
    			
    		}else {
    			hCart.put(product_no, obean);
             System.out.print("hCart size:"+hCart.size());

    		}
    	}
    }
    public Hashtable<Integer,OrderBean> getCartList(){
    	return hCart;
    }
    public void updateCart(OrderBean obean) {
       int product_no=obean.getProduct_no();
    	hCart.put(product_no, obean);}
   
     public void deleteCart(OrderBean obean) {
    	 int product_no=obean.getProduct_no();
    	 hCart.remove(product_no);
     }
     
    
    	
}
