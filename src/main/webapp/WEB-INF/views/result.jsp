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

    <img src="/styles/dist/img/authServiceImg.png" id="authServiceImg" style="display: none;">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body class="hold-transition skin-blue sidebar-mini" >
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
        <section>

            <div>

                <c:if test="${database.numOfDBs > 0 && frontend.numOfApps > 0}">

                    <div id="architectureDiagram" style="overflow-y: scroll; height: 800px">
                        <canvas id="canvas" width="1200" height="800"></canvas>
                        <script>
                          var canvas = new fabric.Canvas('canvas');

                          var lines = [];
                          var groups = [];

                          var dbCircles = [];
                          var msCircles = [];
                          var bffcircles = [];
                          var feCircles = [];

                          var dbTexts = [];
                          var msTexts = [];
                          var bffTexts = [];
                          var feTexts = [];

                          var modelDBNames = [];

                          var clientHeight = document.getElementById('architectureDiagram').clientHeight;
                          var centerLineY =  clientHeight / 2;
                          var parallalLineHeight = 150;
                          var parallalLineUpperCount = 0;
                          var parallalLineLowerCount = 0;

                          <c:forEach items="${database.nameOfDB}" var="dbNames">
                          modelDBNames.push('${dbNames}');
                          </c:forEach>

                          fabric.Object.prototype.originX = fabric.Object.prototype.originY = 'center';

                          // Center line elements created
                          lines.push(getLine([ 100, centerLineY, 400, centerLineY]));
                          lines.push(getLine([ 400, centerLineY, 700, centerLineY]));
                          lines.push(getLine([700, centerLineY, 1000, centerLineY]));

                          dbCircles.push(getCircle());
                          modelDBNames[0] !== '' ? dbTexts.push(getText(modelDBNames[0])) : dbTexts.push(getText("Database-1"));

                          msCircles.push(getCircle());
                          msTexts.push(getText("Microservice-1"));

                          bffcircles.push(getCircle());
                          bffTexts.push(getText("BFF"));

                          feCircles.push(getCircle());
                          feTexts.push(getText("FE"));

                          groups.push(new fabric.Group([ dbCircles[0], dbTexts[0] ], {
                            left: 100,
                            top: centerLineY
                          }));

                          groups.push(new fabric.Group([ msCircles[0], msTexts[0] ], {
                            left: 400,
                            top: centerLineY
                          }));

                          groups.push(new fabric.Group([ bffcircles[0], bffTexts[0] ], {
                            left: 700,
                            top: centerLineY
                          }));

                          groups.push(new fabric.Group([ feCircles[0], feTexts[0] ], {
                            left: 1000,
                            top: centerLineY
                          }));

                          <c:if test="${frontend.socialMediaAppLogin}">
                          var authLine = getLine([ 1000, 100, 1000, centerLineY]);
                          var authServiceImg = document.getElementById('authServiceImg');
                          var authServiceImgInstance = new fabric.Image(authServiceImg, {
                            left: 1000,
                            top: 100
                          });

                          canvas.add(authLine, authServiceImgInstance);
                          </c:if>


                          // Branch elements created
                          for (var index=0; index <${database.numOfDBs-1}; index++) {
                            if ((index+1)%2 !== 0) {
                              parallalLineUpperCount++;
                              // logic to restrict drawing beyond the top boarder of the window diplay
                              if (centerLineY-(parallalLineUpperCount*parallalLineHeight) > 50) {
                                drawUpperDiagram(index);
                              } else {
                                // draw anything going beyond the top boarder in the window withing the lowe pane
                                parallalLineLowerCount++;
                                drawLowerDiagram(index);
                              }
                            }
                            else {
                              parallalLineLowerCount++;
                              drawLowerDiagram(index);
                            }

                          }

                          for (var i=0; i<lines.length; i++){
                            canvas.add(lines[i]);
                          }

                          for (var i=0; i<groups.length; i++){
                            canvas.add(groups[i]);
                          }

                          function drawUpperDiagram(index) {
                              //additional db line
                              lines.push(getLine([100, centerLineY-(parallalLineUpperCount*parallalLineHeight), 400, centerLineY-(parallalLineUpperCount*parallalLineHeight)]));

                              //additional db
                              dbCircles.push(getCircle());
                              modelDBNames[index+1] !== '' ? dbTexts.push(getText(modelDBNames[index+1])) : dbTexts.push(getText("Database-".concat((dbCircles.length).toString())));
                              groups.push(new fabric.Group([ dbCircles[dbCircles.length-1], dbTexts[dbTexts.length-1] ], {
                                left: 100,
                                top: centerLineY-(parallalLineUpperCount*parallalLineHeight)
                              }));

                              //additional ms line
                              lines.push(getLine([400, centerLineY-(parallalLineUpperCount*parallalLineHeight), 700, centerLineY]));

                              //additional ms
                              msCircles.push(getCircle());
                              msTexts.push(getText("Microservice-".concat((msCircles.length).toString())));
                              groups.push(new fabric.Group([ msCircles[msCircles.length-1], msTexts[msTexts.length-1] ], {
                                left: 400,
                                top: centerLineY-(parallalLineUpperCount*parallalLineHeight)
                              }));

                          }

                          function drawLowerDiagram(index) {

                            //additional db line
                            lines.push(getLine([100, centerLineY+(parallalLineLowerCount*parallalLineHeight), 400, centerLineY+(parallalLineLowerCount*parallalLineHeight)]));

                            //additional db
                            dbCircles.push(getCircle());
                            modelDBNames[index+1] !== '' ? dbTexts.push(getText(modelDBNames[index+1])) : dbTexts.push(getText("Database-".concat((dbCircles.length).toString())));
                            groups.push(new fabric.Group([ dbCircles[dbCircles.length-1], dbTexts[dbTexts.length-1] ], {
                              left: 100,
                              top: centerLineY+(parallalLineLowerCount*parallalLineHeight)
                            }));

                            //additional ms line
                            lines.push(getLine([400, centerLineY+(parallalLineLowerCount*parallalLineHeight), 700, centerLineY]));

                            //additional ms
                            msCircles.push(getCircle());
                            msTexts.push(getText("Microservice-".concat((msCircles.length).toString())));
                            groups.push(new fabric.Group([ msCircles[msCircles.length-1], msTexts[msTexts.length-1] ], {
                              left: 400,
                              top: centerLineY+(parallalLineLowerCount*parallalLineHeight)
                            }));

                            canvas.setHeight(centerLineY+(parallalLineLowerCount*parallalLineHeight) + 200);
                          }

                          function getLine(coords) {
                            return new fabric.Line(coords, {
                              fill: 'red',
                              stroke: 'red',
                              strokeWidth: 5,
                              selectable: false
                            });
                          }

                          function getCircle() {
                            var circle = new fabric.Circle({
                              radius: 50,
                              fill: '#fff',
                              strokeWidth: 5,
                              stroke: '#666',
                              originX: 'center',
                              originY: 'center'
                            });
                            circle.hasControls = circle.hasBorders = false;
                            return circle;
                          }

                          function getText(title) {
                            var text = new fabric.Text(title, {
                              fontSize: 10,
                              originX: 'center',
                              originY: 'center'
                            });

                            return text;
                          }

                        </script>

                    </div>

                </c:if>

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
