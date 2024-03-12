package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import dao.OrderDao;
import entities.Order;
import entities.Product;

/**
 * Servlet implementation class CheckOutServlet
 */
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckOutServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		ArrayList<Product> cart_list = (ArrayList<Product>)request.getSession().getAttribute("cart_list");
		
		String auth = (String) request.getSession().getAttribute("auth");
		
		if(auth != null && cart_list != null) {
			
			for(Product p : cart_list) {
				Order order = new Order(p.getId(),Integer.parseInt(auth),p.getQuantity(),formatter.format(date));
				/*
				 * order.setId();
				 * 
				 * order.setuId(); order.setQuantity(); order.setDate();
				 */
				
				OrderDao orderdao = new OrderDao();
				boolean result = orderdao.insertOrder(order);
				if(!result) break;
			}
			cart_list.clear();
			response.sendRedirect("orders.jsp");
		}
		else {
			if(auth == null )
				response.sendRedirect("Login.jsp");
			response.sendRedirect("cart.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
