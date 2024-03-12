package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import entities.Order;

public class OrderDao {

	private String query;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public boolean insertOrder(Order Model) {
		boolean result = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "");
			query = "insert into orders(p_id,u_id,o_quantity,o_date) values(?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setInt(1, Model.getOrderId());
			ps.setInt(2, Model.getuId());
			ps.setInt(3, Model.getQuantity());
			ps.setString(4, Model.getDate());
			ps.executeUpdate();
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Order> userOrders(int id) {
		List<Order> list = new ArrayList();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "");
			query = "SELECT * "
					+ "FROM orders INNER JOIN addfood ON orders.p_id = addfood.id and orders.u_id="+id;
			ps = this.con.prepareStatement(query);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				/*
				 * ProductDao productDao = new ProductDao(this.con); int pId =
				 * rs.getInt("p_id"); Product product = productDao.getSingleProduct(pId);
				 */order.setOrderId(rs.getInt("o_id"));
				order.setId(rs.getInt("p_id"));
				order.setName(rs.getString("fname"));
				order.setCategory(rs.getString("fcategory"));
				order.setPrice(rs.getInt("fprice") * rs.getInt("o_quantity"));
				order.setQuantity(rs.getInt("o_quantity"));
				order.setDate(rs.getString("o_date"));
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}

	public List<Order> userOrdersAdmin(int id) {
		List<Order> list = new ArrayList();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "");
			query = "SELECT * FROM orders INNER JOIN addfood ON orders.p_id = addfood.id";
			ps = this.con.prepareStatement(query);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				/*
				 * ProductDao productDao = new ProductDao(this.con); int pId =
				 * rs.getInt("p_id"); Product product = productDao.getSingleProduct(pId);
				 */order.setOrderId(rs.getInt("o_id"));
				order.setId(rs.getInt("p_id"));
				order.setName(rs.getString("fname"));
				order.setCategory(rs.getString("fcategory"));
				order.setPrice(rs.getInt("fprice") * rs.getInt("o_quantity"));
				order.setQuantity(rs.getInt("o_quantity"));
				order.setDate(rs.getString("o_date"));
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	public void cancelOrder(int id) {
		// boolean result = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "");
			query = "delete from orders where o_id=?";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, id);
			ps.execute();
			// result = true;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		// return result;
	}
}
