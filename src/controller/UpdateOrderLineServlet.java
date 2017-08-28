package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Order;
import model.bean.OrderLine;
import model.dao.OrderDAO;
import model.dao.OrderLineDAO;

public class UpdateOrderLineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderLineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("orderLineID") !=null) {
			int odlID = Integer.parseInt(request.getParameter("orderLineID"));
			OrderLine od = OrderLineDAO.getOrderLine(odlID);
			if("plus".equals(request.getParameter("act"))) {
				OrderLineDAO.updateQuantity(od.getOrderLineID(), od.getQuantity() + 1);
			} 
			if("minus".equals(request.getParameter("act"))) {
				OrderLineDAO.updateQuantity(od.getOrderLineID(), od.getQuantity() - 1);
			}
		}

		HttpSession session = request.getSession();
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
		
		response.sendRedirect("CartServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
