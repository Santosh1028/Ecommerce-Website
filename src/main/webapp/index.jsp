<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce Website</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>


        <div class="row mt-3 mx-2">

            <%                String cat = request.getParameter("category");

                ProductDao dao = new ProductDao(FactoryProvider.getFactory());

                List<Product> list = null;

                if (cat == null || cat.trim().equals("all")) {
                    list = dao.getAllProducts();
                } else {
                    int cid = Integer.parseInt(cat);
                    list = dao.getAllProductsById(cid);
                }

                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cDao.getCategories();
            %>
            <!-- Show Categories.. -->
            <div class="col-md-2">
                <div class="list-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Categories
                    </a>

                    <%
                        for (Category category : clist) {
                    %>

                    <a href="index.jsp?category=<%= category.getCategoryId()%>" class="list-group-item list-group-item-action"><%= category.getCategoryTitle()%></a>


                    <%
                        }
                    %>
                </div>

            </div>

            <!-- Show Products.. -->
            <div class="col-md-10">
                <!-- Row -->
                <div class="row-mt-4">

                    <!-- Colum -->
                    <div class="col-md-12">
                        <div class="card-columns">
                            <!-- Traversing Products-->
                            <%
                                for (Product p : list) {
                            %>

                            <!-- Product Card -->
                            <div class="card product-card">

                                <div class="container">
                                    <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt=".."/>

                                </div>

                                <div class="card-body">
                                    <h5 class="card-title"><%=p.getPname()%></h5>
                                    <p class="card-text"><%=Helper.get10Words(p.getpDescription())%></p>
                                </div>

                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>, <%=p.getPname()%>, <%= p.getPriceAfterDiscount()%>)">Add to Cart</button>
                                    <button class="btn btn-outline-success">&#8377;<%= p.getPriceAfterDiscount()%> <span class="text-secondary discount-label">&#8377;<%=p.getpPrice()%>,  <%=p.getpDiscount()%>% off</span></button>


                                </div>
                            </div>

                            <%
                                }

                                if (list.size() == 0) {
                                    out.println("<h3>No Items in this Categories.</h3>");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
