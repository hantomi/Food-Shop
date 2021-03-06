/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.controllers.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import longnlt.daos.CateDAO;
import longnlt.daos.ProductDAO;
import longnlt.dtos.ProductDTO;

/**
 *
 * @author redra
 */
public class AdminSearchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            ServletContext context = getServletContext();
            String productSearch = request.getParameter("txtProductSearch");
            String categorySearch = request.getParameter("cbbCategory");
            if(productSearch.equals("") || !categorySearch.equals("none")){
                ProductDAO proDAO = new ProductDAO();
                CateDAO cateDAO = new CateDAO();
                List<ProductDTO> listPro = proDAO.searchProductByCateID(cateDAO.getCateIDByName(categorySearch));
                context.setAttribute("listProduct", listPro);
            } else if(!productSearch.equals("") || categorySearch.equals("none")){
                ProductDAO proDAO = new ProductDAO();
                List<ProductDTO> listPro = proDAO.searchProdutLikeName(productSearch);
                context.setAttribute("listProduct", listPro);
            }
        } catch (Exception e) {
            log("Error at AdminSearchController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("admin/admin-index.jsp").forward(request, response);
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
