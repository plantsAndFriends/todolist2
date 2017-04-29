<%-- 
    Document   : app
    Created on : 24-abr-2017, 19:11:15
    Author     : Adria Viñas
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.bd.DAOTask"%>
<%@ page import="model.pojo.BeanTask"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css" />

        <title>Todolist App</title>
    </head>
    <body>
        <div id="nav-container">
            <nav class="navbar navbar-toggleable-md navbar-light bg-faded">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"  aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand ml-5" href="index.html">Todolist</a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav float-right">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <%
                                    String us = (String) request.getSession().getAttribute("sessuser");
                                    out.print(us);
                                %>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="logout.jsp">Logout</a>
                            </div>
                        </div>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="container justify-content-center">
            <h1 class="text-center">Tasks</h1>

            <form class="form-inline mt-5" action="ControlTask?action=addTask" method="post">
                <div class="input-group col-md-6 offset-3">    

                    <input type="text" class="form-control" name="task" placeholder="Create a task" />

                    <span class="input-group-btn">
                        <button class="btn btn-secondary" type="submit">+</button><
                    </span>
                </div>
            </form>
                        
        </div>        
        
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-8 offset-2">                    
                    <div id="accordion">
                        <%
                            DAOTask task = new DAOTask();
                            ArrayList<BeanTask> beanTask = task.getTasks();
                            Collections.reverse(beanTask);

                            if (task != null) {
                                out.println("<ul class='list-group text-center'></ul>");
                                Iterator<BeanTask> it = beanTask.iterator();
                                while (it.hasNext()) {
                                    out.println("<li class='list-group-item' ><span class='mx-auto'>" + it.next().getTask() + "</span><span class='pr-3'><i class='fa fa-pencil' aria-hidden='true'></i></span><span class='pr-3'><i class='fa fa-check' aria-hidden='true'></i></span><span><i class='fa fa-trash' aria-hidden='true'></i></span>"+
                                                    "<a data-toggle='collapse' data-parent='#accordion' href='#collapseOne' aria-expand></a>"
                                            + "</li>");
                                    out.println("div id='collapseOne'"+
                                            "<div class='card>"+
                                                    "<div class='card-block'>This is play pause</div>"
                                              + "</div>");
                                }
                                out.println("</ul>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
    </body>
</html>
