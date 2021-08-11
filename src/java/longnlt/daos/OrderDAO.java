/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.daos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import longnlt.db.DBUtils;
import longnlt.dtos.OrderDTO;
/**
 *
 * @author redra
 */
public class OrderDAO {
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
    
    public String getLastOrderIDByUser (String username) throws Exception {
        String id = null;
        try {
            sql = "Select OrderID From tblOrder Where DateOfCreate = (Select MAX(DateOfCreate) From tblOrder Where username=?)";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while(rs.next()){
                id = rs.getString("OrderID");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return id;
    }
    
    public boolean insertOrder (OrderDTO orDTO) throws Exception {
        boolean check = false;
        try {
            sql = "Insert into tblOrder "
                    + "values(?,?,?,?,?)";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, orDTO.getId());
            ps.setString(2, orDTO.getUsername());
            ps.setFloat(3, orDTO.getTotal());
            ps.setTimestamp(4, new Timestamp(orDTO.getDateOfCreate().getTime()));
            ps.setString(5, orDTO.getStatus());
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean createOrderDetail (String orderDetailID, String orderID, int quantity, String productID, float price) throws Exception {
        boolean check = false;
        try {
            sql = "Insert into OrderDetail "
                    + "Values (?,?,?,?,?)";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, orderDetailID);
            ps.setString(2, orderID);
            ps.setInt(3, quantity);
            ps.setString(4, productID);
            ps.setFloat(5, price);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return check;
    }
}
