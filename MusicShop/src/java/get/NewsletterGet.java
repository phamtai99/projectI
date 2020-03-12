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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import model.Contact;
import model.Newsletter;

/**
 *
 * @author NguyenDang
 */
public class NewsletterGet {
    
    public ArrayList<Newsletter> getListNewsletter() throws SQLException, NamingException {
        Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
        String sql = "SELECT * FROM newsletter";
        PreparedStatement ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Newsletter> list = new ArrayList<>();
        while (rs.next()) {
            Newsletter newsletter = new Newsletter();
           newsletter.setNewsletterID(rs.getLong("newsletter_id"));
           newsletter.setNewsletterName(rs.getString("newsletter_email"));       
           newsletter.setDate(rs.getTimestamp("date"));
           list.add(newsletter);
        }
         conn.close();
        return list;
    }
   
    
    public boolean insertNewsletter(Newsletter c) throws NamingException, SQLException {
        Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/MusicShop");
            
            Connection conn = ds.getConnection();
        String sql = "INSERT INTO newsletter VALUES(?,?,?)";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
         ps.setLong(1, c.getNewsletterID());    
         ps.setString(2, c.getNewsletterName());
         ps.setTimestamp(3, c.getDate());
         
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(NewsletterGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
}
