package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.ProductCategory;

public class ProductCategoryDAO {
	public static ArrayList<ProductCategory> getListProductCategorys() {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		ArrayList<ProductCategory> list = new ArrayList<ProductCategory>();
		ProductCategory pd;
		try {
			String SQL = "{call sp_getListProductCategory}";
			cstmt = conn.prepareCall (SQL);
			rs = cstmt.executeQuery();
			while(rs.next()){
				pd = new ProductCategory();
				pd.setProductCategoryID(rs.getInt("ProductCategoryID"));
				pd.setName(rs.getString("Name"));
				list.add(pd);
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return list;
	}
	
	public static ProductCategory getProductCategory(int id) {
		ProductCategory pc = new ProductCategory();
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			String sql = "{call sp_getProductCategory(?)}";
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, id);
			rs = cstmt.executeQuery();
			while(rs.next()) {
				pc.setProductCategoryID(rs.getInt("ProductCategoryID"));
				pc.setName(rs.getString("Name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pc;
	}
}
