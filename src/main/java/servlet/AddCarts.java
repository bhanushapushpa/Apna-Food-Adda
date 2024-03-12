package servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import java.sql.*;
import entities.Product;

public class AddCarts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCarts() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Product> product = new ArrayList<Product>();
		String id = request.getParameter("id");
		HttpSession session = request.getSession();

		
		Product food = new Product();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "");

			String sql = "select * from addFood where id=" + id;

			PreparedStatement p = con.prepareStatement(sql);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				food.setId(rs.getInt("id"));
				food.setName((String) rs.getString("fname"));
				food.setCategory((String) rs.getString("fcategory"));
				food.setPrice((int) rs.getInt("fprice"));
				food.setQuantity(1);
			}

			ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("cart_list");
			if (products == null) {
				product.add(food);
				session.setAttribute("cart_list", product);
				session.setAttribute("message_cart", "Added");
				response.sendRedirect("indexCustomer.jsp");
			} else {
				product = products;
				boolean exist = false;
				for (Product po : products) {
					if (po.getId() == Integer.parseInt(id)) {
						exist = true;
						session.setAttribute("message_cart", "Product exist");
						response.sendRedirect("indexCustomer.jsp");
					}
				}
				if (!exist) {
					product.add(food);
					session.setAttribute("message_cart", "added");
					response.sendRedirect("indexCustomer.jsp");
				}
				/* for (Product po : product) { pout.println(po.getId()); } */
			}

			
		} catch (

		Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("cart_list", product);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
