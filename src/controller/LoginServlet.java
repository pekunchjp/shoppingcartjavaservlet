package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Customer;
import model.dao.CustomerDAO;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String loginName = request.getParameter("loginName");
		String p = request.getParameter("password");
		if(CustomerDAO.checkLogin(loginName, p)) {
			Customer c = CustomerDAO.getCustomer(loginName);
			session.setAttribute("loginName", loginName);
			session.setAttribute("customerID", c.getCustomerID());	
			session.setAttribute("loginResult", true);
			if (c.getUserRoleID() == 1) {
				RequestDispatcher rd = request.getRequestDispatcher("ListCustomersServlet");
				rd.forward(request, response);
			}
		} else {
			session.setAttribute("loginResult", false);
		}
		RequestDispatcher rd = request.getRequestDispatcher("HomeServlet");
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
