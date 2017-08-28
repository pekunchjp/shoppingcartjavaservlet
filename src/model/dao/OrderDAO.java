package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Order;

public class OrderDAO {
	public static ArrayList<Order> getListOrders() {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		ArrayList<Order> list = new ArrayList<Order>();
		Order o;
		try {
			String SQL = "{call sp_getListOrder}";
			cstmt = conn.prepareCall (SQL);
			rs = cstmt.executeQuery();
			while(rs.next()){
				o = new Order();
				o.setOrderID(rs.getInt("OrderID"));
				o.setCustomerID(rs.getInt("CustomerID"));
				o.setOrderStatusID(rs.getInt("OrderStatusID"));
				o.setTotalAmount(rs.getFloat("TotalAmount"));
				list.add(o);
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return list;
	}
	
	/*
	 * Tìm kiếm hóa đơn gần đây nhất theo mã khách hàng
	 */
	public static Order getOrder(int CustomerID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		Order o = new Order();
		try {
			String SQL = "{call sp_getOrder(?)}";
			cstmt = conn.prepareCall (SQL);
			cstmt.setInt(1, CustomerID);
			rs = cstmt.executeQuery();
			while(rs.next()){
				o.setOrderID(rs.getInt("OrderID"));
				o.setCustomerID(rs.getInt("CustomerID"));
				o.setOrderStatusID(rs.getInt("OrderStatusID"));
				o.setTotalAmount(rs.getFloat("TotalAmount"));
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return o; // mục đích trả về orderID để gọi hàm getListOrderLine từ OrderLineDAO
	}
	
	public static void updateTotalOfOrder(int orderID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_updateTotalOfOrder(?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, orderID);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void payOrder(int orderID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_payOrder(?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, orderID);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void addOrder(int customerID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_addOrder(?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, customerID);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
