package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ProductDAO;

public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		if ("submit".equals(request.getParameter("submit"))) {
			int productID = Integer.parseInt(request.getParameter("productID"));
			String name = request.getParameter("name");
			float price = Float.parseFloat(request.getParameter("price"));
			String description = request.getParameter("description");
			String image = request.getParameter("image");
			int productCategoryID = Integer.parseInt(request.getParameter("productCategoryID"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			ProductDAO.addProduct(productID, name, price, description, image, productCategoryID, quantity);
			response.sendRedirect("ListProductsServlet");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("listProducts.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
