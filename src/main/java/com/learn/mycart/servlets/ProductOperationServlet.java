package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            PrintWriter out = response.getWriter();
            //Fetching Category Data
            String op = request.getParameter("operation");

            if (op.trim().equals("addcategory")) {

                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                // Add Category
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                // save category to database
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);

                //out.println("category saved..");
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Category Added Successfully");
                response.sendRedirect("admin.jsp");
                return;
            } else if (op.trim().equals("addproduct")) {
                // Add Product

                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDescription");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));

                Part part = request.getPart("pPic");

                Product product = new Product();
                product.setPname(pName);
                product.setpDescription(pDesc);
                product.setpPrice(pPrice);
                product.setpDiscount(pDiscount);
                product.setpQuantity(pQuantity);
                product.setpPhoto(part.getSubmittedFileName());

                // Get CategoryById
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                Category category = categoryDao.getCategoryById(catId);
                product.setCategory(category);

                // Save Product
                ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                productDao.saveProduct(product);

                // Upload Picture
                //Find out the path to upload photo
                String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                
                //Uploading Code
                FileOutputStream fos=new FileOutputStream(path);
                InputStream fis=part.getInputStream();
                
                //reading Data
                byte[] data=new byte[fis.available()];
                fis.read(data);
                
                //Writing the data
                fos.write(data);
                fos.close();
                        

                //out.println("Product Save Successfully....");
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Product Added Successfully");
                response.sendRedirect("admin.jsp");
                return;

            }

        } catch (Exception e) {
            e.printStackTrace();
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
