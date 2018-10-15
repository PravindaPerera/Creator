<%--
  Created by IntelliJ IDEA.
  User: pravindaperera
  Date: 8/26/18
  Time: 10:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Creator</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/styles/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/styles/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/styles/bower_components/Ionicons/css/ionicons.min.css">


    <!-- Theme style -->
    <link rel="stylesheet" href="/styles/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/styles/dist/css/skins/_all-skins.min.css">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>C</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>C</b>reator</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/styles/dist/img/user.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">Pravinda Perera</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="/styles/dist/img/user.jpg" class="img-circle" alt="User Image">

                                <p>
                                    Pravinda Perera - Web Developer
                                    <small>University of Moratuwa</small>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="/styles/dist/img/user.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Pravinda Perera</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- search form -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">

                <li class="header">MAIN NAVIGATION</li>

                <li class="active treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>Workspace</span>
                    </a>
                </li>

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Workspace
                <small>- provide the use cases and related information</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div>

                <!-- Tab panes -->
                <form role="form" action="/process/useCases" method="POST">

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">List of use cases</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">

                                    <div class="panel panel-primary">
                                        <div class="panel-heading">Use Case Overview
                                            <button type="button" class="btn btn-info btn-lg pull-right"
                                                    onclick="addUseCaseDetails()"
                                                    style="border-radius: 15px; width: 30px; height: 30px; line-height: 1.428571429;
                                                                text-align: center; padding: 6px 0; font-size: 12px">
                                                <i class="glyphicon glyphicon-plus"></i>
                                            </button>
                                        </div>
                                        <div class="panel-body">

                                            <div class="row">
                                                <div class="col-md-3 pull-left">
                                                    <label>Use case Name:</label>
                                                    <input type="text" id="useCaseName1" class="form-control"
                                                           style="width: 300px" name="useCaseName1">
                                                </div><!-- /.col-lg-6 -->

                                                <div class="col-md-3">
                                                    <label>Feature category:</label>

                                                    <select class="form-control" id="featureCategory1" name="featureCategory1">
                                                        <c:forEach items="${featureCategories}" var="featureCategory">
                                                            <option value="${featureCategory}">${featureCategory}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div><!-- /.col-lg-3 -->

                                                <div class="col-md-3">
                                                    <label><input type="checkbox" name="useCaseInd1"
                                                                  value="useCaseDB1">DB</label>
                                                </div><!-- /.col-lg-3 -->

                                                <div class="col-md-3">
                                                    <label><input type="checkbox" name="useCaseAPIs1"
                                                                  value="useCaseAPIs1">External API's</label>
                                                </div><!-- /.col-lg-3 -->

                                            </div>

                                            <div id="AdditionalUseCaseDetails"></div>

                                        </div>

                                    </div>

                                    <input type="submit" name="submit" id="submit" value="Save Use Cases"
                                           class="btn btn-info pull-right">

                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>

                </form>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2017-onwards <a href="https://www.linkedin.com/in/pravinda/">Pravinda
            Perera</a>.</strong> All rights
        reserved.
    </footer>

    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<script>
  var useCaseCount = 2;

  function addUseCaseDetails() {
    var html = '<div class="row">';
    html += '<div class="col-md-3 pull-left">';
    html += '<label>Use case Name:</label>';
    html += '<input type="text" id="useCaseName' + useCaseCount + '" class="form-control" style="width: 300px" name="useCaseName' + useCaseCount + '">';
    html += '</div>';

    html += '<div class="col-md-3">';
    html +=  '<label>Feature category:</label>';

    html +=  '<select class="form-control" name="featureCategory' + useCaseCount + '" id="featureCategory' + useCaseCount + '">';
    html +=  '<c:forEach items="${featureCategories}" var="featureCategory">';
    html +=  '<option value="${featureCategory}">${featureCategory}</option>';
    html +=  '</c:forEach>';
    html +=  '</select>';
    html +=  '</div>';

    html += '<div class="col-md-3">';
    html += '<label><input type="checkbox" name="useCaseDB' + useCaseCount + '" value="useCaseDB' + useCaseCount + '">DB</label>';
    html += '</div>';

    html += '<div class="col-md-3">';
    html += '<label><input type="checkbox" name="useCaseAPIs' + useCaseCount + '" value="useCaseAPIs' + useCaseCount + '">External API\'s</label>';
    html += '</div>';

    html += '</div>';

    useCaseCount++;
    $('#AdditionalUseCaseDetails').append(html);
  }
</script>

<!-- jQuery 3 -->
<script src="/styles/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/styles/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="/styles/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- AdminLTE App -->
<script src="/styles/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/styles/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/styles/dist/js/demo.js"></script>
</body>
</html>
