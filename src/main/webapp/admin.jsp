<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal_user")) {
            session.setAttribute("message", "Access Denied, Only Admin can Access this page..");
            response.sendRedirect("login.jsp");
            return;

        }
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin User</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container admin mt-3">

            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">

                <!-- First Colum -->
                <div class="col-md-4">
                    <!-- First Box -->
                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="height: 125px; width: 125px;"  class="img-fluid rounded-circle" src="img/user.png">
                            </div>
                            <h1>123</h1>
                            <h1>USERS</h1>
                        </div>
                    </div>
                </div>

                <!-- First Colum -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="height: 125px; width: 125px;"  class="img-fluid rounded-circle" src="img/category.png">
                            </div>
                            <h1>454</h1>
                            <h1>CATEGORIES</h1>
                        </div>
                    </div>
                </div>

                <!-- First Colum -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="height: 125px; width: 125px;"  class="img-fluid rounded-circle" src="img/product.png">
                            </div>
                            <h1>3453</h1>
                            <h1>PRODUCTS</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!-- second row -->
            <div class="row mt-3">
                <!-- first column -->
                <div class="col-md-6">

                    <div class="card" data-toggle="modal"
                         data-target="#add-category-modal">
                        <div class="card-body text-center ">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle"
                                     src="img/keys.png" alt="user.png">
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1>Add Categories</h1>
                        </div>
                    </div>
                </div>

                <!-- second column -->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal"
                         data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle"
                                     src="img/add.png" alt="user.png">
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1>Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Category Modal  -->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required>
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!-- End Category Modal  -->

        <!-- Add Product Modal  -->


        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct">
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Product Name" required>
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" name="pDescription" placeholder="Enter Product Description" required></textarea>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required>
                            </div>

                            <!-- Product Category -->

                            <%                                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = categoryDao.getCategories();
                            %>

                            <div class="form-group">
                                <select class="form-control" name="catId" id="">

                                    <%
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>

                                    <%
                                        }%>
                                </select>
                            </div>

                            <!-- Product File -->

                            <div class="form-group">
                                <label  for="pPic">Select Product Picture</label>
                                <br>
                                <input type="file"name="pPic" id="pPic" required/>
                            </div>


                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!-- End Product Modal  -->
    </body>
</html>
