package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import dao.OrderDao;
import entities.Order;
import entities.Product;

import java.text.SimpleDateFormat;


public class BuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter po = response.getWriter();
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
			Date date = new Date();
			
			
			String  name  = (String) request.getSession().getAttribute("Name");
			
			int userid = Integer.parseInt((String) request.getSession().getAttribute("auth"));
			
			
			if(name != null) {
				
				int productId=Integer.parseInt( request.getParameter("id"));
				
				String quantity_check = request.getParameter("quantity");
				int quantity = 1 ;
				
				
				//po.print(quantity);
				if (quantity_check != null) {
					quantity = Integer.parseInt(quantity_check);
				}
				
				
				/*
				 * if(productId) { throw new Exception("Something went wrong"); // product_int =
				 * Integer.parseInt(productId); }
				 */
				
				
				
				
				Order orderModel = new Order( productId, userid , quantity ,formatter.format(date));
				
				/*
				 * orderModel.setId(Integer.parseInt(productId));
				 * 
				 * orderModel.setuId(userid); orderModel.setQuantity(quantity);
				 * 
				 * orderModel.setDate(formatter.format(date));
				 */
				
				
				
				OrderDao orderdao = new OrderDao();
				boolean result = orderdao.insertOrder(orderModel);
				
				
				if(result) {
					ArrayList<Product> cart_list = (ArrayList<Product>)request.getSession().getAttribute("cart_list");
					if(cart_list != null)
					{
						for(Product p : cart_list) {
							if(p.getId() ==  (productId)) {
								cart_list.remove(cart_list.indexOf(p));
								break;
								
							}
						}
					}
					
					response.sendRedirect("orders.jsp");
				}
				else
					response.sendRedirect("cart.jsp");
			}
			
		}catch (Exception e) {
			e.getMessage();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
