/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnlt.controllers.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import longnlt.daos.CateDAO;
import longnlt.daos.ProductDAO;
import longnlt.dtos.ProductDTO;

@WebServlet("/upload")
@MultipartConfig
public class AddProductController extends HttpServlet {

    private static final String SUCCESS = "AdminLogProductController";
    private static final String FAIL = "admin/admin-addproduct.jsp";

    public String randomString() {

        int leftLimit = 97; // letter 'a'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 10;
        Random random = new Random();
        StringBuilder buffer = new StringBuilder(targetStringLength);
        for (int i = 0; i < targetStringLength; i++) {
            int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
            buffer.append((char) randomLimitedInt);
        }
        String generatedString = buffer.toString();

        return generatedString;
    }

    protected String getImageFolder() {
        String rootPath = getServletContext().getRealPath("/index.jsp");
        File filePath = new File(rootPath);

        String workingDirectory = filePath.getParent();
        for (int i = 0; i < 3; i++) {
            workingDirectory = filePath.getParent();
            filePath = new File(workingDirectory);
        }
        return rootPath + "/web/images/product/";
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        String url = FAIL;
        try {
            //        processRequest(request, response);
            String id = request.getParameter("txtID");
            String name = request.getParameter("txtName");
            String desc = request.getParameter("txtDescription");
            int stock = Integer.parseInt(request.getParameter("txtStock"));
            String size = request.getParameter("txtSize");
            String shipping = request.getParameter("txtShipping");
            String delivery = request.getParameter("txtDelivery");
            float price = Float.parseFloat(request.getParameter("txtPrice"));
            String deliveryTime = request.getParameter("txtDeliveryTime");
            String categoryName = request.getParameter("cbbCategory");
            
            Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
            String submitedFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            InputStream fileContent = filePart.getInputStream();
            BufferedImage image = ImageIO.read(fileContent);
            
            String[] splitedSubmitName = submitedFileName.split("\\.");
            
            String extension = splitedSubmitName[splitedSubmitName.length - 1];
            
            String storeImageName = randomString() + "." + extension; //Into database
            ImageIO.write(image, extension, new File("D:\\Courses Slides\\LAB231\\J3.L.P0013\\web\\images\\product\\" + storeImageName));
            
            CateDAO cateDAO = new CateDAO();
            ProductDAO proDAO = new ProductDAO();
            ProductDTO proDTO = new ProductDTO(id, name, desc, size, shipping, delivery, deliveryTime, cateDAO.getCateIDByName(categoryName), storeImageName, stock, 1, price);
            if (proDAO.addNewProduct(proDTO)) {
                request.setAttribute("MSG", "Add product successfully.");
                url = SUCCESS;
            } else {
                request.setAttribute("MSG", "Add product failed.");
                url = FAIL;
            }
            
        } catch (Exception ex) {
            log("Error at AddProductController: " + ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
