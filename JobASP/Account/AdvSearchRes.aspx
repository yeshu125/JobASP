<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMaster.master" AutoEventWireup="true" CodeBehind="AdvSearchRes.aspx.cs" Inherits="JobASP.AdvSearchRes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProHeadContent" runat="server">
    <link href="../Content/AdminLTE.css" rel="stylesheet" />
    <link href="../Content/ionicons.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ProMainContent" runat="server">
    <%--  <asp:Repeater runat="server">
        <ItemTemplate>--%>
    <br />
    <div class="row">
        <div class="col-lg-3 col-xs-8">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <asp:Label Text='<%#Eval("JobID") %>' Style="display: none" runat="server" />
                <div class="inner">
                    <h4>
                        <asp:Label runat="server" Text='<%# Eval("JobPosition") %>' />
                    </h4>
                    <p>
                        <asp:Label Text='<%# Eval("Skills.Skill") %>' runat="server" />
                    </p>
                    <p>
                        <asp:Label Text='<%# Eval("JobDescription") %>' runat="server" />
                    </p>

                </div>
                <div class="icon">
                    <img src="#" />
                </div>
                <a href="#" class="small-box-footer"> &#8377;
                   
                    <i class="fa fa-arrow-circle-right">
                        <i class="glyphicon glyphicon-map-marker">
                            <asp:Label Text='<%# Eval("Cities.CityName") %>' runat="server" />
                        </i>
                    </i>
                </a>
                 <i   class="fa-rupee"></i>
            </div>
        </div>
    </div>

    <%--  <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-7 form-group">
            <div class="col-md-3">Key Skills  :</div>
            <div class="col-md-9">Hello </div>
            <div class="col-md-3">Job Description :</div>
            <div class="col-md-9">Hello 2</div>
        </div>
        <div class="col-md-2"></div>
    </div>--%>


    <%--</ItemTemplate>
    </asp:Repeater>--%>
</asp:Content>
