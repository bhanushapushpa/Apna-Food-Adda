package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import entities.Product;

/**
 * Servlet implementation class RemoveFromCart
 */
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try  {
			
			String  id =request.getParameter("id");
			if(id != null) {
				ArrayList<Product> cart_list = (ArrayList<Product>)request.getSession().getAttribute("cart_list");
				if(cart_list != null)
				{
					for(Product p : cart_list) {
						if(p.getId() ==  Integer.parseInt(id)) {
							cart_list.remove(cart_list.indexOf(p));
							break;
							
						}
					}
					response.sendRedirect("cart.jsp");
				}
				else {
					response.sendRedirect("cart.jsp");
				}
				 
				
			}
			
		}
		catch (Exception e) {
			
		
		}
	}

}
