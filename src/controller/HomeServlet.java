package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import model.bean.Customer;
import model.bean.Product;
import model.bean.ProductCategory;
import model.dao.CustomerDAO;
import model.dao.ProductCategoryDAO;
import model.dao.ProductDAO;

public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeServlet() {
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

		ArrayList<Customer> listCustomers = CustomerDAO.getListCustomers();
		request.setAttribute("listCustomers", listCustomers);
		
		ArrayList<Product> listProducts = ProductDAO.getListProducts();
		request.setAttribute("listProducts", listProducts);
		
		ArrayList<Product> listProducts1 = ProductDAO.getListProducts(1);
		request.setAttribute("listProducts1", listProducts1);

		ArrayList<Product> listProducts2 = ProductDAO.getListProducts(2);
		request.setAttribute("listProducts2", listProducts2);

		ArrayList<Product> listProducts3 = ProductDAO.getListProducts(3);
		request.setAttribute("listProducts3", listProducts3);

		ArrayList<Product> listProducts4 = ProductDAO.getListProducts(4);
		request.setAttribute("listProducts4", listProducts4);

		ArrayList<ProductCategory> listProductCategorys = ProductCategoryDAO.getListProductCategorys();
		request.setAttribute("listProductCategorys", listProductCategorys);

		String productIDStr = request.getParameter("productID");
		int productID = 0;
		ArrayList<Product> listProductsWithID = new ArrayList<>();
		try {
			if (productIDStr != null) {
				productID = Integer.parseInt(productIDStr);
				listProductsWithID = ProductDAO.getListProducts(productID);
			}
		} catch (Exception e) {
			productID = 0;
		}
		request.setAttribute("listProductsWithID", listProductsWithID);
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
		// doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
