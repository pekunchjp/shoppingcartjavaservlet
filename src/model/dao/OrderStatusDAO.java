package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.OrderStatus;

public class OrderStatusDAO {
	public static ArrayList<OrderStatus> getListOrderStatus() {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ArrayList<OrderStatus> list = new ArrayList<>();
		ResultSet rs = null;
		OrderStatus o = null;
		try {
			String SQL = "{call sp_getListOrderStatus}";
			cstmt = conn.prepareCall (SQL);
			rs = cstmt.executeQuery();
			while(rs.next()){
				o = new OrderStatus();
				o.setOrderStatusID(rs.getInt("OrderStatusID"));
				o.setName(rs.getString("Name"));
				list.add(o);
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return list;
	}
}
