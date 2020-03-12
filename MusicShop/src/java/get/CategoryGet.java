/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package get;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import model.Category;

/**
 *
 * @author NguyenDang
 */
public class CategoryGet {
    public ArrayList<Category> getListCategory() throws SQLException, NamingException {
         Context initContext = new InitialContext();
         DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "select * from category";
            ResultSet rs = sttm.executeQuery(sql);
//        Connection connection = DBConnect.getConnecttion();
//        String sql = "SELECT * FROM category";
//        PreparedStatement ps = connection.prepareCall(sql);
//        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while (rs.next()) {
            Category category = new Category();
            category.setCategoryID(rs.getLong("category_id"));
            category.setCategoryName(rs.getString("category_name"));
            list.add(category);
        }
         conn.close();
        return list;
    }
    
    
    public Category getCategory(long categoryID) throws SQLException, NamingException {
       Context initContext = new InitialContext();
         DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
        String sql =  "SELECT * FROM category WHERE category_id = '" + categoryID + "'";
        PreparedStatement ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Category category = new Category();
        while (rs.next()) {
            
            category.setCategoryID(rs.getLong("category_id"));
            category.setCategoryName(rs.getString("category_name"));
           
        }
         conn.close();
        return category;
    }
    

public boolean insert(Category c) throws SQLException {
    try {
      Context initContext = new InitialContext();
         DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
         String sql = "INSERT INTO category VALUE(?,?)";
         PreparedStatement ps = conn.prepareCall(sql);
         ps.setLong(1, c.getCategoryID());
         ps.setString(2, c.getCategoryName());
         int temp = ps.executeUpdate();
          conn.close();
         return temp == 1;
    } catch (Exception e) {
         return false;
    }
}

public boolean update(Category c) throws SQLException {
    try {
        Context initContext = new InitialContext();
         DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
         String sql = "UPDATE category SET category_name = ? WHERE category_id = ?";
         PreparedStatement ps = conn.prepareCall(sql);
         ps.setString(1, c.getCategoryName());
         ps.setLong(2, c.getCategoryID());
         int temp = ps.executeUpdate();
          conn.close();
         return temp == 1;
    } catch (Exception e) {
         return false;
    }
}

public boolean delete(long category_id) throws SQLException {
    try {
        Context initContext = new InitialContext();
         DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
        String sql = "DELETE FROM category WHERE category_id = ?";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setLong(1, category_id);
        int temp = ps.executeUpdate();
         conn.close();
            return temp == 1;
    } catch (Exception e) {
        return false;
    }
}
 public boolean insertCategory(Category c) throws NamingException, SQLException {
       Context initContext = new InitialContext();
         DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
        String sql = "INSERT INTO category VALUES(?,?)";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setLong(1, c.getCategoryID());
            ps.setString(2, c.getCategoryName());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean updateCategory(Category c) throws NamingException, SQLException {
       Context initContext = new InitialContext();
         DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
        String sql = "UPDATE category SET category_name = ? WHERE category_id = ?";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.setLong(2, c.getCategoryID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean deleteCategory(long category_id) throws NamingException, SQLException {
       Context initContext = new InitialContext();
         DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
        String sql = "DELETE FROM category WHERE category_id = ?";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setLong(1, category_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }


    public static void main(String[] args)throws SQLException, NamingException {
        CategoryGet get = new CategoryGet();
        for(Category ds : get.getListCategory()){
        System.out.println(ds.getCategoryID() + " - "+ds.getCategoryName());
        }
    }
    
    
}
