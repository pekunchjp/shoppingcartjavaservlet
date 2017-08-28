package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Order;
import model.bean.OrderLine;
import model.bean.Product;
import model.dao.OrderDAO;
import model.dao.OrderLineDAO;
import model.dao.ProductDAO;

/*
 * Tra ve order moi nhat cua khach hang
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		ArrayList<Product> listProducts = ProductDAO.getListProducts();
		request.setAttribute("listProducts", listProducts);
		
		if(session.getAttribute("loginName")==null){
			response.sendRedirect("LoginServlet");
			return;
		}
		String customerIDStr = String.valueOf(session.getAttribute("customerID"));
		int customerID = 0;
		try {
			if(customerIDStr != null) {
				customerID = Integer.parseInt(customerIDStr);
			}
		} catch (Exception e) {
			customerID = 0;
		}
		
		Order o = OrderDAO.getOrder(customerID);
		OrderDAO.updateTotalOfOrder(o.getOrderID());
		request.setAttribute("order", o); 
		
		ArrayList<OrderLine> od = OrderLineDAO.getListOrderLines(o.getOrderID());
		request.setAttribute("listOrderLine", od);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
