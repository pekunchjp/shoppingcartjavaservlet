package controller;

import java.io.IOException;
import java.util.ArrayList;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.OrderLine;
import model.dao.OrderDAO;
import model.dao.OrderLineDAO;
import model.dao.ProductDAO;

/*
 * Thanh toán hóa đơn
 */
public class CompleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompleteOrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int orderID = Integer.parseInt(request.getParameter("orderID"));
		System.out.println(orderID);
		ArrayList<OrderLine> odList = OrderLineDAO.getListOrderLines(orderID);

		for (OrderLine od : odList) {
			ProductDAO.updateProduct(od.getProductID(), od.getQuantity());
		}
		
		OrderDAO.payOrder(orderID);
		response.sendRedirect("CartServlet");
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
