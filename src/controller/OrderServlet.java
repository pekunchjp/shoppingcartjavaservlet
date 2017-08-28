package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Order;
import model.bean.OrderLine;
import model.dao.OrderDAO;
import model.dao.OrderLineDAO;

/*
 * Them san pham vao gio hang. Su dung javascript sau khi code jsp
 */
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
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
		//Neu hoa don cuoi cung da thanh toan
		if(o.getOrderStatusID() == 2) {
			OrderDAO.addOrder(customerID);
		}
		o = OrderDAO.getOrder(customerID);
//		OrderDAO.updateTotalOfOrder(o.getOrderID());
		
		String productIDStr = request.getParameter("productID");
		int productID = 0;
		try {
			if(productIDStr != null) {
				productID = Integer.parseInt(productIDStr);
			}
		} catch (Exception e) {
			productID = 0;
		}
		
		ArrayList<OrderLine> od = OrderLineDAO.getListOrderLines(o.getOrderID());
		int trung = 0;
		for(OrderLine odl:od) {
			if(odl.getProductID() == productID) {
				trung = 1;
				break;
			}
		}
		if(trung == 0) {
			OrderLineDAO.addOrderLine(o.getOrderID(), productID);
			response.sendRedirect("UpdateOrderLineServlet");
		} else {
			PrintWriter out = response.getWriter();
			try {
				out.println("San pham da co trong gio hang");
			} finally {
				// TODO: handle finally clause
				out.close();
			}
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
