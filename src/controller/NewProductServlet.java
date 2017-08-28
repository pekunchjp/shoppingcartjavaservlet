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

public class NewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String limitStr = request.getParameter("limit");
		int limit;
		
		if(limitStr == null) {
			limit = 0;
			request.setAttribute("limit", 0);
		} else {
			limit = Integer.parseInt(request.getParameter("limit"));
			if(limit < 0) {
				limit = 0;
			}
			request.setAttribute("limit", limit);
		}
		ArrayList<Product> listProducts = ProductDAO.getListProductsByPage(limit);
		request.setAttribute("listProducts", listProducts);
		
		ArrayList<ProductCategory> list = ProductCategoryDAO.getListProductCategorys();
		request.setAttribute("listProductCategorys", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("product.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
