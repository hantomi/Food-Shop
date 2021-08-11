/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.daos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import longnlt.db.DBUtils;
/**
 *
 * @author redra
 */
public class UserDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql = "";

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
        if (!sql.equals("")) {
            sql = "";
        }
    }
    
    public String checkLogin (String username, String password) throws Exception {
        String role = "None";
        try {
            sql = "Select role From tblUser Where username = ? And password = ? And IsAvailable = 1";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if(rs.next()){
                role = rs.getString("role");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return role;
    }
    
    public boolean registerUser (String username, String password, String name, String email) throws Exception {
        boolean check = false;
        try {
            sql = "Insert into tblUser "
                    + "values (?,?,?,?,?,?)";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, "user");
            ps.setBoolean(5, true);
            ps.setString(6, email);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public String getNameByUsername (String username) throws Exception {
        String name = "";
        try {
            sql = "Select name from tblUser Where username = ?";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if(rs.next()){
                name = rs.getString("name");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return name;
    }
}
