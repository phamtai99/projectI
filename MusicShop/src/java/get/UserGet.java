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
import model.User;

/**
 *
 * @author NguyenDang
 */
public class UserGet {
    public ArrayList<User> getListUser() throws SQLException, NamingException {
        Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
        String sql = "SELECT * FROM users";
        PreparedStatement ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<User> list = new ArrayList<>();
        while (rs.next()) {
            User user = new User();
           user.setUserID(rs.getLong("user_id"));
           user.setUserName(rs.getString("user_name"));
           user.setUserEmail(rs.getString("user_email"));
           user.setUserPass(rs.getString("user_pass"));
           user.setUserRole(rs.getBoolean("user_role"));
           user.setUserPhone(rs.getString("user_phone"));
           list.add(user);
        }
        return list;
    }
   
    
    public boolean checkEmail(String name) throws SQLException, NamingException{
    Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
    String sql = "SELECT * FROM users WHERE user_name = '" + name + "'";
    PreparedStatement ps;
    try {
        ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            conn.close();
            return true;
        }
    } catch (SQLException ex) {
        Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null, ex);
    }
    return false;
    }
    // phương thức thêm tài khoản
    public boolean insertUser(User u) throws NamingException, SQLException {
       Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
        String sql = "INSERT INTO users VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setLong(1, u.getUserID());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getUserEmail());
            ps.setString(4, u.getUserPass());
            ps.setBoolean(5, u.isUserRole());
            ps.setString(6, u.getUserPhone());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
   
     public User login(String name, String password) throws NamingException {
             try {
            Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "select * from users where user_name='" + name + "' and user_pass='" + password + "'";
            ResultSet rs = sttm.executeQuery(sql);
         
         
         
         
//        Connection con = DBConnect.getConnecttion();
//        String sql = "select * from users where user_name='" + name + "' and user_pass='" + password + "'";
//        PreparedStatement ps;
//    
//            ps = (PreparedStatement) con.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserID(rs.getLong("user_id"));
                u.setUserName(rs.getString("user_name"));
                u.setUserPass(rs.getString("user_pass"));
                u.setUserRole(rs.getBoolean("user_role"));
                conn.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
     
     public User getUser(long userID) throws SQLException, NamingException {
      Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
     String sql = "SELECT * FROM users WHERE user_id = '" + userID + "'";
     PreparedStatement ps = conn.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     User user = new User();
     while (rs.next()) {
         
           user.setUserID(rs.getLong("user_id"));
           user.setUserName(rs.getString("user_name"));
           user.setUserEmail(rs.getString("user_email"));
           user.setUserPass(rs.getString("user_pass"));
           user.setUserRole(rs.getBoolean("user_role"));
           user.setUserPhone(rs.getString("user_phone"));
     }
     return user;
}
     public boolean updateUser(User u) throws NamingException, SQLException {
        
        Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
       // String sql = "UPDATE product SET product_id = ?, category_id = ?, product_name = ?, product_image = ?, product_image_forward = ?, product_image_back = ?, product_price = ?, product_description = ? WHERE product_id = ?";
        String sql = "UPDATE users SET user_id=?, user_name=?, user_email=?, user_pass=?, user_role=?, user_phone=? WHERE user_id = ?";
        
        try {
            PreparedStatement ps = conn.prepareCall(sql);
          ps.setLong(1, u.getUserID());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getUserEmail());
            ps.setString(4, u.getUserPass());
            ps.setBoolean(5, u.isUserRole());
            ps.setString(6, u.getUserPhone());
            ps.setLong(7, u.getUserID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
