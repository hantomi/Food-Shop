/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import longnlt.daos.ProductDAO;
import longnlt.dtos.ProductDTO;

/**
 *
 * @author redra
 */
public class DeleteAndUpdateController extends HttpServlet {
    
    private static final String UPDATE_SUCCESS = "admin/product-view.jsp";
    private static final String UPDATE_FAIL = "admin/product-view.jsp";
    private static final String DELETE_SUCCESS = "AdminLogProductController";
    private static final String DELETE_FAIL = "admin/product-view.jsp";
    private static final String ERROR = "admin/product-view.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "ERROR";
        try {
            String action = request.getParameter("action");
            if (action.equals("Update")) {
                String id = request.getParameter("txtID");
                String name = request.getParameter("txtName");
                String desc = request.getParameter("txtDescription");
                int stock = Integer.parseInt(request.getParameter("txtStock"));
                String size = request.getParameter("txtSize");
                String shipping = request.getParameter("txtShipping");
                String delivery = request.getParameter("txtDelivery");
                float price = Float.parseFloat(request.getParameter("txtPrice"));
                String deliveryTime = request.getParameter("txtDeliveryTime");

                ProductDAO proDAO = new ProductDAO();
                ProductDTO currDTO = proDAO.searchProductById(id);

                String cateID = currDTO.getCateID();
                String image = currDTO.getImg();
                int quantity = 1;
                
                ProductDTO dto = new ProductDTO(id, name, desc, size, shipping, delivery, deliveryTime, cateID, image, stock, quantity, price);
                if (proDAO.updateProduct(dto)) {
                    request.setAttribute("MSG", "Update Product Successfully.");
                    request.setAttribute("SelectedProduct", dto);
                    url = UPDATE_SUCCESS;
                } else {
                    request.setAttribute("MSG", "Update Product Failed.");
                    url = UPDATE_FAIL;
                }
            } else if (action.equals("Delete")) {
                String proID = request.getParameter("txtID");
                ProductDAO proDAO = new ProductDAO();
                ProductDTO currDTO = proDAO.searchProductById(proID);
                File currPicture = new File("D:\\Courses Slides\\LAB231\\J3.L.P0013\\web\\images\\product\\" + currDTO.getImg());
                if (currPicture.delete() && proDAO.deleteProduct(proID)) {
                    request.setAttribute("MSG", "Product Delete Successfully.");
                    url = DELETE_SUCCESS;
                } else {
                    request.setAttribute("MSG", "Product Delete Failed.");
                    url = DELETE_FAIL;
                }
            }
        } catch (Exception e) {
            log("Error at DeleteAndUpdateController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
