<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Register</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-5 offset-4">

                    
                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body px-5">
                            <form action="RegisterServlet" method="POST">

                                <h3 class="text-center">Register Here</h3>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" aria-describedby="emailHelp" placeholder="Enter Username">

                                </div>

                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter Email">

                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" aria-describedby="emailHelp" placeholder="Enter Password">

                                </div>

                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input type="number" class="form-control" id="phone" name="phone" aria-describedby="emailHelp" placeholder="Enter Phone Number">

                                </div>

                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea style="height: 200px" class="form-control" id="address" name="address" aria-describedby="emailHelp" placeholder="Enter Address"></textarea>

                                </div>
                                
                                <a href="login.jsp"class="text-center d-block mb-2">If Registered? Login Here.</a>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register Here</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>


                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
