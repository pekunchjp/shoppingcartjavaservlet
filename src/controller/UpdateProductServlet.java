package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Product;
import model.bean.ProductCategory;
import model.dao.ProductCategoryDAO;
import model.dao.ProductDAO;

public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<ProductCategory> list = ProductCategoryDAO.getListProductCategorys();
		request.setAttribute("listProductCategory", list);
		request.setCharacterEncoding("UTF-8");
		int productID = Integer.parseInt(request.getParameter("productID"));
		if ("submit".equals(request.getParameter("submit"))) {		
			String name = request.getParameter("name");
			float price = Float.parseFloat(request.getParameter("price"));
			String description = request.getParameter("description");
			String image = request.getParameter("image");
			int productCategoryID = Integer.parseInt(request.getParameter("productCategoryID"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			ProductDAO.updateProduct(productID, name, price, description, image, productCategoryID, quantity);
			response.sendRedirect("ListProductsServlet");
		} else {
			Product p = ProductDAO.getProduct(productID);
			request.setAttribute("product", p);
			RequestDispatcher rd = request.getRequestDispatcher("updateProduct.jsp");
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
