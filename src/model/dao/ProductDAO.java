package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Product;

public class ProductDAO {
	
	public static ArrayList<Product> getListProducts() {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		ArrayList<Product> list = new ArrayList<Product>();
		Product p;
		try {
			String SQL = "{call sp_getListProduct}";
			cstmt = conn.prepareCall (SQL);
			rs = cstmt.executeQuery();
			while(rs.next()){
				p = new Product();
				p.setProductID(rs.getInt("ProductID"));
				p.setName(rs.getString("Name"));
				p.setDescription(rs.getString("Description"));
				p.setPrice(rs.getFloat("Price"));
				p.setImage(rs.getString("Image"));
				p.setProductCategoryID(rs.getInt("ProductCategoryID"));
				p.setQuantity(rs.getInt("Quantity"));
				list.add(p);
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<Product> getListProductsByPage(int limit) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		ArrayList<Product> list = new ArrayList<Product>();
		Product p;
		try {
			String SQL = "{call sp_getListProductsByPage(?)}";
			cstmt = conn.prepareCall (SQL);
			cstmt.setInt(1, limit);
			rs = cstmt.executeQuery();
			while(rs.next()){
				p = new Product();
				p.setProductID(rs.getInt("ProductID"));
				p.setName(rs.getString("Name"));
				p.setDescription(rs.getString("Description"));
				p.setPrice(rs.getFloat("Price"));
				p.setImage(rs.getString("Image"));
				p.setProductCategoryID(rs.getInt("ProductCategoryID"));
				p.setQuantity(rs.getInt("Quantity"));
				list.add(p);
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<Product> getListProductsWithCategoryByPage(int limit, int categoryID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		ArrayList<Product> list = new ArrayList<Product>();
		Product p;
		try {
			String SQL = "{call sp_getListProductsWithCategoryByPage(?,?)}";
			cstmt = conn.prepareCall (SQL);
			cstmt.setInt(1, limit);
			cstmt.setInt(2, categoryID);
			rs = cstmt.executeQuery();
			while(rs.next()){
				p = new Product();
				p.setProductID(rs.getInt("ProductID"));
				p.setName(rs.getString("Name"));
				p.setDescription(rs.getString("Description"));
				p.setPrice(rs.getFloat("Price"));
				p.setImage(rs.getString("Image"));
				p.setProductCategoryID(rs.getInt("ProductCategoryID"));
				p.setQuantity(rs.getInt("Quantity"));
				list.add(p);
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return list;
	}
	
	public static ArrayList<Product> getListProducts(int productCategoryID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		ArrayList<Product> list = new ArrayList<Product>();
		Product p;
		try {
			String SQL = "{call sp_getListProductWithID(?)}";
			cstmt = conn.prepareCall (SQL);
			cstmt.setInt(1, productCategoryID);
			rs = cstmt.executeQuery();
			while(rs.next()){
				p = new Product();
				p.setProductID(rs.getInt("ProductID"));
				p.setName(rs.getString("Name"));
				p.setDescription(rs.getString("Description"));
				p.setPrice(rs.getFloat("Price"));
				p.setImage(rs.getString("Image"));
				p.setProductCategoryID(rs.getInt("ProductCategoryID"));
				p.setQuantity(rs.getInt("Quantity"));
				list.add(p);
			}
			conn.close();
		} catch (SQLException e) {
			   e.printStackTrace();
		}
		return list;
	}
	
	public static Product getProduct(int productID) {
		Product p = new Product();
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			String sql = "{call sp_getProduct(?)}";
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, productID);
			rs = cstmt.executeQuery();
			while(rs.next()) {
				p.setProductID(rs.getInt("ProductID"));
				p.setName(rs.getString("Name"));
				p.setDescription(rs.getString("Description"));
				p.setPrice(rs.getFloat("Price"));
				p.setImage(rs.getString("Image"));
				p.setProductCategoryID(rs.getInt("ProductCategoryID"));
				p.setQuantity(rs.getInt("Quantity"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}
	public static void addProduct(int productID, String name, float price, String description, String image, int productCategoryID, int quantity) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_addProduct(?,?,?,?,?,?,?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, productID);
			cstmt.setString(2, name);
			cstmt.setFloat(3, price);
			cstmt.setString(4, description);
			cstmt.setString(5, image);
			cstmt.setInt(6, productCategoryID);
			cstmt.setInt(7, quantity);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteProduct(int productID) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_deleteProduct(?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, productID);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void updateProduct(int productID, String name, float price, String description, String image, int productCategoryID, int quantity) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_updateProduct(?,?,?,?,?,?,?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, productID);
			cstmt.setString(2, name);
			cstmt.setFloat(3, price);
			cstmt.setString(4, description);
			cstmt.setString(5, image);
			cstmt.setInt(6, productCategoryID);
			cstmt.setInt(7, quantity);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void updateProduct(int productID, int quantity) {
		Connection conn = Connect.connect();
		CallableStatement cstmt = null;
		String sql = "{call sp_completeOrder(?,?)}";
		try {
			cstmt = conn.prepareCall (sql);
			cstmt.setInt(1, productID);
			cstmt.setInt(2, quantity);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
