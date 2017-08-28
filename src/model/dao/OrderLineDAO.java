package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.OrderLine;
import model.bean.Product;

public class OrderLineDAO {
	/*
	 * Hien thi danh sach cac OrderLine trong Order
	 */
	public static ArrayList<OrderLine> getListOrderLines(int orderID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		ArrayList<OrderLine> list = new ArrayList<OrderLine>();
		OrderLine o;
		try {
			String SQL = "{call sp_getListOrderLine(?)}";
			cstmt = conn.prepareCall (SQL);
			cstmt.setInt(1, orderID);
			rs = cstmt.executeQuery();
			while(rs.next()){
				o = new OrderLine();
				o.setOrderLineID(rs.getInt("OrderLineID"));
				o.setOrderID(rs.getInt("OrderID"));
				o.setProductID(rs.getInt("ProductID"));
				o.setQuantity(rs.getInt("Quantity"));
				list.add(o);
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return list;
	}
	
	public static OrderLine getOrderLine(int orderLineID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		OrderLine o = new OrderLine();
		try {
			String SQL = "{call sp_getOrderLine(?)}";
			cstmt = conn.prepareCall (SQL);
			cstmt.setInt(1, orderLineID);
			rs = cstmt.executeQuery();
			while(rs.next()){
				o.setOrderLineID(rs.getInt("OrderLineID"));
				o.setOrderID(rs.getInt("OrderID"));
				o.setProductID(rs.getInt("ProductID"));
				o.setQuantity(rs.getInt("Quantity"));
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return o;
	}
	
	/*
	 * Them mot OrderLine vao Order
	 */
	public static void addOrderLine(int orderID, int productID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		try {
			String SQL = "{call sp_addOrderLine(?,?)}";
			cstmt = conn.prepareCall (SQL);
			cstmt.setInt(1, orderID);
			cstmt.setInt(2, productID);
			cstmt.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
	}
	
	public static void deleteOrderLine(int orderLineID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_deleteOrderLine(?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, orderLineID);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void updateQuantity(int od, int quantity) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_updateOrderLine(?,?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, od);
			cstmt.setInt(2, quantity);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * Tinh tong san pham co trong gio hang
	 */
	public static int countItems(int orderID) {
		ArrayList<OrderLine> list = getListOrderLines(orderID);
		return list.size();
	}
	
	/*
	 * Tinh tong tien
	 */
	public static float total(int orderID) {
		float sum = 0;
		ArrayList<OrderLine> list = getListOrderLines(orderID);
		for(OrderLine od: list) {
			Product p = ProductDAO.getProduct(od.getProductID());
			sum += p.getPrice()*od.getQuantity();
		}
		return sum;
	}
}
