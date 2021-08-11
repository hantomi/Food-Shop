/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.daos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import longnlt.db.DBUtils;
import longnlt.dtos.CateDTO;
/**
 *
 * @author redra
 */
public class CateDAO {
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

    public List<CateDTO> getAllCate () throws Exception {
        List<CateDTO> listCate = null;
        String id, name, desc;
        try {
            sql = "Select CategoryID, CategoryName, description From tblCategory";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            listCate = new ArrayList<>();
            while(rs.next()){
                id = rs.getString("categoryID");
                name = rs.getString("categoryName");
                desc = rs.getString("description");
                CateDTO dto = new CateDTO(id, name, desc);
                listCate.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return listCate;
    }
    
    public String getCateIDByName (String name) throws Exception {
        String id = "";
        try {
            sql = "Select CategoryID from tblCategory Where CategoryName = ?";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            if(rs.next()){
                id = rs.getString("CategoryID");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return id;
    }
    
    public String getCateNameByID (String id) throws Exception {
        String name = "";
        try {
            sql = "Select CategoryName From tblCategory Where CategoryID=?";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                name = rs.getString("CategoryName");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return name;
    }
 }
