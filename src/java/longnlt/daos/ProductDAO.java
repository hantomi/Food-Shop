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
import longnlt.dtos.ProductDTO;

/**
 *
 * @author redra
 */
public class ProductDAO {

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

    public List<ProductDTO> getFirstEightProduct() throws Exception {
        List<ProductDTO> listProduct = null;
        String id, name, cateID, img;
        try {
            sql = "SELECT TOP 8 [ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[categoryID]\n"
                    + "      ,[Image]\n"
                    + "  FROM [dbo].[tblProduct]";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            listProduct = new ArrayList<>();
            while (rs.next()) {
                id = rs.getString("ProductID");
                name = rs.getString("ProductName");
                cateID = rs.getString("CategoryID");
                img = rs.getString("Image");
                ProductDTO dto = new ProductDTO(id, name, cateID, img);
                listProduct.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return listProduct;
    }

    public boolean addNewProduct(ProductDTO dto) throws Exception {
        boolean check = false;
        try {
            sql = "insert into tblProduct\n"
                    + "  values (?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getId());
            ps.setString(2, dto.getName());
            ps.setString(3, dto.getDesc());
            ps.setInt(4, dto.getStock());
            ps.setString(5, dto.getSize());
            ps.setString(6, dto.getShipping());
            ps.setString(7, dto.getDelivery());
            ps.setFloat(8, dto.getPrice());
            ps.setString(9, dto.getDeliveryTime());
            ps.setString(10, dto.getCateID());
            ps.setString(11, dto.getImg());
            ps.setInt(12, 1);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean deleteProduct(String id) throws Exception {
        boolean check = false;
        try {
            sql = "Delete From tblProduct Where ProductID = ?";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public List<ProductDTO> searchProductByCateID(String cateID) throws Exception {
        List<ProductDTO> listPro = null;
        String id, name, desc, size, shipping, delivery, deliveryTime, img;
        int stock;
        float price;
        try {
            sql = "Select [ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[description]\n"
                    + "      ,[stock]\n"
                    + "      ,[size]\n"
                    + "      ,[shipping]\n"
                    + "      ,[delivery]\n"
                    + "      ,[price]\n"
                    + "      ,[deliveryTime]\n"
                    + "      ,[Image]\n"
                    + " FROM [dbo].[tblProduct] WHERE CategoryID = ?";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, cateID);
            rs = ps.executeQuery();
            listPro = new ArrayList<>();
            while(rs.next()){
                id = rs.getString("ProductID");
                name = rs.getString("ProductName");
                img = rs.getString("Image");
                ProductDTO dto = new ProductDTO(id, name, cateID, img);
                listPro.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return listPro;
    }
    
    public boolean updateProduct (ProductDTO dto) throws Exception {
        boolean check = false;
        try {
            sql = "Update tblProduct "
                    + "Set ProductName=?, description=?, size=?, shipping=?, "
                    + "delivery=?, deliveryTime=?, CategoryID=?, "
                    + "Image=?, stock=?, price=? Where ProductID = ?";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getName());
            ps.setString(2, dto.getDesc());
            ps.setString(3, dto.getSize());
            ps.setString(4, dto.getShipping());
            ps.setString(5, dto.getDelivery());
            ps.setString(6, dto.getDeliveryTime());
            ps.setString(7, dto.getCateID());
            ps.setString(8, dto.getImg());
            ps.setInt(9, dto.getStock());
            ps.setFloat(10, dto.getPrice());
            ps.setString(11, dto.getId());
            check = ps.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public ProductDTO searchProductById (String id) throws Exception {
        ProductDTO dto = null;
        String name, desc, size, shipping, delivery, deliveryTime, cateID, img;
        int stock, quantity;
        float price;
        try {
            sql = "SELECT [ProductName]\n"
                    + "      ,[description]\n"
                    + "      ,[stock]\n"
                    + "      ,[size]\n"
                    + "      ,[shipping]\n"
                    + "      ,[delivery]\n"
                    + "      ,[price]\n"
                    + "      ,[deliveryTime]\n"
                    + "      ,[categoryID]\n"
                    + "      ,[Image]\n "
                    + "      ,[quantity]\n"
                    + "  FROM [dbo].[tblProduct] WHERE [ProductID] = ?";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                name = rs.getString("ProductName");
                desc = rs.getString("description");
                size = rs.getString("size");
                shipping = rs.getString("shipping");
                delivery = rs.getString("delivery");
                deliveryTime = rs.getString("deliveryTime");
                cateID = rs.getString("CategoryID");
                img = rs.getString("Image");
                stock = rs.getInt("stock");
                price = rs.getFloat("price");
                quantity = rs.getInt("quantity");
                dto = new ProductDTO(id, name, desc, size, shipping, delivery, deliveryTime, cateID, img, stock, quantity, price);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public List<ProductDTO> searchProdutLikeName(String name) throws  Exception {
        List<ProductDTO> listPro = null;
        String id, proName, cateID, img;
        try {
            sql = "Select ProductID, ProductName, CategoryID, Image From tblProduct Where ProductName Like ?";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+ name +"%");
            rs = ps.executeQuery();
            listPro = new ArrayList<>();
            while(rs.next()){
                id = rs.getString("ProductID");
                cateID = rs.getString("CategoryID");
                img = rs.getString("Image");
                proName = rs.getString("ProductName");
                ProductDTO dto = new ProductDTO(id, proName, cateID, img);
                listPro.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return listPro;
    }
    
    public List<ProductDTO> searchProductBetweenPrice (float startPrice, float endPrice) throws Exception {
        List<ProductDTO> listPro = null;
        String id, name, cateID, img;
        try {
            sql = "Select ProductID, ProductName, CategoryID, Image From tblProduct Where price Between ? And ?";
            conn = DBUtils.getMyConnection();
            ps = conn.prepareStatement(sql);
            ps.setFloat(1, startPrice);
            ps.setFloat(2, endPrice);
            rs = ps.executeQuery();
            listPro = new ArrayList<>();
            while(rs.next()){
                id = rs.getString("ProductID");
                name = rs.getString("ProductName");
                cateID = rs.getString("CategoryID");
                img = rs.getString("Image");
                ProductDTO dto = new ProductDTO(id, name, cateID, img);
                listPro.add(dto);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return listPro;
    }
}
