package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Customer;

public class CustomerDAO {
	public static ArrayList<Customer> getListCustomers() {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		ArrayList<Customer> list = new ArrayList<Customer>();
		Customer customer;
		try {
			String SQL = "{call sp_getListCustomer}";
			cstmt = conn.prepareCall (SQL);
			rs = cstmt.executeQuery();
			while(rs.next()){
				customer = new Customer();
				customer.setCustomerID(rs.getInt("CustomerID"));
				customer.setName(rs.getString("Name"));
				customer.setUserRoleID(rs.getInt("UserRoleID"));
				list.add(customer);
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return list;
	}
	
	public static Customer getCustomer(String loginName) {
		Connection conn = Connect.connect();
		String sql = "{call sp_getCustomer(?)}";
		ResultSet rs = null;
		Customer c = new Customer();
		try {
			CallableStatement cstmt = null;
			cstmt = conn.prepareCall (sql);
			cstmt.setString(1, loginName);
			rs = cstmt.executeQuery();
			if(rs.next()){
				c.setCustomerID(rs.getInt("CustomerID"));
				c.setLoginName(rs.getString("LoginName"));
				c.setName(rs.getString("Name"));
				c.setUserRoleID(rs.getInt("UserRoleID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}
	
	public static boolean checkLogin(String loginName, String pass) {
		Connection conn = Connect.connect();
		String sql = "{call sp_getListLoginName(?,?)}";
		ResultSet rs = null;
		try {
			CallableStatement cstmt = null;
			cstmt = conn.prepareCall (sql);
			cstmt.setString(1, loginName);
			cstmt.setString(2, pass);
			rs = cstmt.executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean checkSignup(String loginName) {
		Connection conn = Connect.connect();
		String sql = "{call sp_getListCustomerLoginName(?)}";
		ResultSet rs = null;
		try {
			CallableStatement cstmt = null;
			cstmt = conn.prepareCall (sql);
			cstmt.setString(1, loginName);
			rs = cstmt.executeQuery();
			if(rs.next()){
				return false; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public static void addCustomer(String name, String loginName, String pass) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_addCustomer(?,?,?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setString(1, name);
			cstmt.setString(2, loginName);
			cstmt.setString(3, pass);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
