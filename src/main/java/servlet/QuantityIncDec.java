package servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import entities.Product;

public class QuantityIncDec extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public QuantityIncDec() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try  {
			String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));
			ArrayList<Product> cart_list = (ArrayList<Product>)request.getSession().getAttribute("cart_list");
			
			if(action != null && id > 1) {
				if(action.equals("inc"))
				{
					for(Product p : cart_list) {
						if(p.getId() == id) {
							int quantity = p.getQuantity();
							quantity++;
							p.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
					}
				}
				 if(action.equals("dec"))
				{
					for(Product p : cart_list) {
						if(p.getId() == id && p.getQuantity() > 1) {
							int quantity = p.getQuantity();
							quantity--;
							p.setQuantity(quantity);
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
