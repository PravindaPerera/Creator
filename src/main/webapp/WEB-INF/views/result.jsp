<%--
  Created by IntelliJ IDEA.
  User: pravindap
  Date: 7/23/17
  Time: 6:45 PM
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

    <script src="/styles/dist/js/fabric.js"></script>

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

                <li>
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>Workspace</span>
                    </a>
                </li>

                <li class="active treeview">
                    <a href="result.jsp">
                        <i class="fa fa-th"></i> <span>Architecture</span>
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
                Architecture
                <small>Control panel</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div>
                <canvas id="canvas" width="800" height="450" style="border:1px solid #000000"></canvas>
                <script>
                  var canvas = new fabric.Canvas('canvas');

                  fabric.Object.prototype.originX = fabric.Object.prototype.originY = 'center';
//                  canvas.add(new fabric.Circle({ radius: 30, fill: '#f55', top: 100, left: 100 }));
//
//                  canvas.selectionColor = 'rgba(0,255,0,0.3)';
//                  canvas.selectionBorderColor = 'red';
//                  canvas.selectionLineWidth = 5;

                  var line = makeLine([ 250, 125, 250, 175 ]),
                    line2 = makeLine([ 250, 175, 250, 250 ]),
                    line3 = makeLine([ 250, 250, 300, 350]),
                    line4 = makeLine([ 250, 250, 200, 350]),
                    line5 = makeLine([ 250, 175, 175, 225 ]),
                    line6 = makeLine([ 250, 175, 325, 225 ]);

                  canvas.add(line, line2, line3, line4, line5, line6);

                  canvas.add(
                    makeCircle(line.get('x1'), line.get('y1'), null, line),
                    makeCircle(line.get('x2'), line.get('y2'), line, line2, line5, line6),
                    makeCircle(line2.get('x2'), line2.get('y2'), line2, line3, line4),
                    makeCircle(line3.get('x2'), line3.get('y2'), line3),
                    makeCircle(line4.get('x2'), line4.get('y2'), line4),
                    makeCircle(line5.get('x2'), line5.get('y2'), line5),
                    makeCircle(line6.get('x2'), line6.get('y2'), line6)
                  );

                  canvas.on('object:moving', function(e) {
                    var p = e.target;
                    p.line1 && p.line1.set({ 'x2': p.left, 'y2': p.top });
                    p.line2 && p.line2.set({ 'x1': p.left, 'y1': p.top });
                    p.line3 && p.line3.set({ 'x1': p.left, 'y1': p.top });
                    p.line4 && p.line4.set({ 'x1': p.left, 'y1': p.top });
                    canvas.renderAll();
                  });

                  function makeLine(coords) {
                    return new fabric.Line(coords, {
                      fill: 'red',
                      stroke: 'red',
                      strokeWidth: 5,
                      selectable: false
                    });
                  }

                  function makeCircle(left, top, line1, line2, line3, line4) {
                    var c = new fabric.Circle({
                      left: left,
                      top: top,
                      strokeWidth: 5,
                      radius: 12,
                      fill: '#fff',
                      stroke: '#666'
                    });
                    c.hasControls = c.hasBorders = false;

                    c.line1 = line1;
                    c.line2 = line2;
                    c.line3 = line3;
                    c.line4 = line4;

                    return c;
                  }

                </script>

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
