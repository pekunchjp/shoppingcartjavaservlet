package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Order;
import model.bean.OrderStatus;
import model.dao.OrderDAO;
import model.dao.OrderStatusDAO;

public class ListOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListOrdersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ArrayList<Order> listOrders = OrderDAO.getListOrders();
		request.setAttribute("listOrders", listOrders);
		
		ArrayList<OrderStatus> listOrderStatus = OrderStatusDAO.getListOrderStatus();
		request.setAttribute("listOrderStatus", listOrderStatus);
		
		RequestDispatcher rd = request.getRequestDispatcher("listOrders.jsp");
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
