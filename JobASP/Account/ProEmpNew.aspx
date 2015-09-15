<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="ProEmpNew.aspx.cs" Inherits="JobASP.ProEmpNew" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Latest compiled and minified CSS -->
    <link href="../Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/sb-admin.css" rel="stylesheet" />
    <link href="../Content/font-awesome.css" rel="stylesheet" />

    <script src="../Scripts/jquery-2.1.3.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap-multiselect.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ddlSkillSetSel').multiselect({
                includeSelectAllOption: true,
                multiple: true,
            });
            $('#ddlCountrySel').multiselect({
                includeSelectAllOption: true,
                multiple: true,
            });
            $('#ddlStateSel').multiselect({
                includeSelectAllOption: true,
                multiple: true,
            });
            $('#ddlCitySel').multiselect({
                includeSelectAllOption: true,
                multiple: true,
            });

        });
    </script>

</head>
<body>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->

            <a class="navbar-brand" href="/ProfileEmployer.aspx">
                <img src="../images/job_p-logo-w(30).png" alt="" /></a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>


            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Guest <b class="caret"></b></a>
                    <ul class="dropdown-menu " style="padding: 0px;">
                        <li>
                            <a href="/Account/Regseeker.aspx"><i class="fa fa-fw fa-user"></i>Register</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="/Account/Login.aspx"><i class="fa fa-fw fa-sign-in"></i>Login</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse nav navbar-nav side-nav">

                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" class="btn-xs btn" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">SkillSet </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <ul style="list-style: none">
                                    <li>
                                        <input type="checkbox" value="Java" />
                                        Java  </li>
                                    <li>
                                        <input type="checkbox" value=".Net" />
                                        .Net </li>
                                    <li>
                                        <input type="checkbox" value="Javascript" />
                                        JavaScript</li>
                                    <li>
                                        <input type="checkbox" value="Sql" />
                                        SQL</li>
                                </ul>
                                 <div class="f-l">
                                        <input type="button" value="Search" class="btn btn-xs btn-primary" />
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" class="btn btn-xs" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">Country </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <ul style="list-style: none">
                                    <li>
                                        <input type="checkbox" value="India" />
                                        India  </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="btn-xs btn" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">State </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <ul style="list-style: none">
                                    <li>
                                        <input type="checkbox" value="Andhrapradesh" />
                                        Andhrapradesh  </li>
                                    <li>
                                        <input type="checkbox" value="Telangana" />
                                        Telangana</li>
                                    <li>
                                        <input type="checkbox" value="TamilNadu" />
                                        TamilNadu</li>
                                    <li>
                                        <input type="checkbox" value="Karnataka" />
                                        Karnataka</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">


                        <div class="panel-heading" role="tab" id="headingFour">
                            <h4 class="panel-title">
                                <a class="btn-xs btn" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">City   </a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body">
                                <ul style="list-style: none">
                                    <li>
                                        <input type="checkbox" value="Vijayawada" />
                                        Vijayawada</li>
                                    <li>
                                        <input type="checkbox" value="Visakhapatnam" />
                                        Visakhapatnam</li>
                                    <li>
                                        <input type="checkbox" value="Tirupathi" />
                                        Tirupathi</li>
                                    <li>
                                        <input type="checkbox" value="Hyderabad" />
                                        Hyderabad</li>
                                    <li>
                                        <input type="checkbox" value="Chennai" />
                                        Chennai</li>
                                    <li>
                                        <input type="checkbox" value="Bangulur" />
                                        Bangulur</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Job Search Result 
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row" style="display: none;">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i><strong>Like  Job Portal?</strong>

                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">26</div>
                                        <div>New Comments!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">12</div>
                                        <div>New Tasks!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">124</div>
                                        <div>New Orders!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">13</div>
                                        <div>Support Tickets!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i>Area Chart</h3>
                            </div>
                            <div class="panel-body">
                                <div id=""></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i>Donut Chart</h3>
                            </div>
                            <div class="panel-body">
                                <div id=""></div>
                                <div class="text-right">
                                    <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i>Tasks Panel</h3>
                            </div>
                            <div class="panel-body">
                                <div class="list-group">
                                </div>
                                <div class="text-right">
                                    <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i>Transactions Panel</h3>
                            </div>
                            <div class="panel-body">
                                <div class="text-right">
                                    <a href="#">View All Transactions <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>
</html>


