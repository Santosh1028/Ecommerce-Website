<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
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
                            <form action="LoginServlet" method="POST">

                                <h3 class="text-center">Login User</h3>


                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter Email">

                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" aria-describedby="emailHelp" placeholder="Enter Password">

                                </div>

                                <a href="register.jsp"class="text-center d-block mb-2">If not Register? Register Here.</a>


                                <div class="container text-center">

                                    <button class="btn btn-outline-success">Login Here</button>
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
