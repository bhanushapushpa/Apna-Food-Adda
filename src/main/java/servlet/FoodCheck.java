package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class FoodCheck
 */

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 1000, // 1 GB
		maxRequestSize = 1024 * 1024 * 1000)
public class FoodCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FoodCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/plain;charset=UTF-8");
		try {
			
			String f_name, f_price, f_category, f_description;
			Part f_image;
			HttpSession session = request.getSession();

			f_name = request.getParameter("foodName");
			f_price = request.getParameter("foodPrice");
			f_category = request.getParameter("foodCategory");
			f_description = request.getParameter("foodDesc");

			/*Add image in part*/
			f_image = request.getPart("foodImage");
			InputStream is = f_image.getInputStream();
			
			String fileName = f_image.getSubmittedFileName();

			String folderName = "Img";
			String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName; 
			System.out.println(uploadPath);
			File dir = new File(uploadPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			
			
			Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "");

			String sql = "insert into addFood(fname,fprice,fcategory,fdescription,fimg) values('" + f_name + "','"
					+ f_price + "','" + f_category + "','" + f_description + "','" + fileName + "')";

			PreparedStatement p = con.prepareStatement(sql);

			int i = p.executeUpdate();

			if (i > 0) {
				session.setAttribute("Done", "Updated Successfully");
				RequestDispatcher rd = request.getRequestDispatcher("FoodAdd.jsp");
				rd.forward(request, response);
			} else {
				session.setAttribute("Done", "Technical issue");
				RequestDispatcher rd = request.getRequestDispatcher("FoodAdd.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
