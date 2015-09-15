<%@ Page Title="" Language="C#" MasterPageFile="~/EmpMaster.master" AutoEventWireup="true" CodeBehind="SearchCV.aspx.cs" Inherits="JobASP.Account.SearchCV" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="uc" TagName="Search" Src="~/Account/UCSearch.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function alertError() {
            //$('#' + '<%=ddlSearchJobID.ClientID%>').popover('show');
            var obj = $('#' + '<%=lblgvSeeker.ClientID%>');
        }
    </script>
    <%-- <asp:SiteMapDataSource ID="SiteMapDataSource2" runat="server" />
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>--%>
    <ol class="breadcrumb">
        <li><a href="ProfileEmployer.aspx">Home</a></li>
        <li class="active">Search Seekers</li>
    </ol>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <h3>Search Seekers </h3>
            <asp:Label Text="" ID="lblGrid" runat="server" />
            <uc:Search runat="server" ID="UCSearch" Width="99%" />
            <%--<div class="container">
                <div class="fade in">
                    Hello How the Work
                     <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                         <span aria-hidden="true">&times;</span>
                     </button>
                </div>
            </div>--%>


            <table width="100%">
                <tr>
                    <td>
                        <h3>Find Seekers according jobs</h3>
                        <table width="100%" align="center">
                            <tr>
                                <td colspan="3">Please Select the Job Position
                                </td>
                            </tr>
                            <tr>
                                <td width="25%"></td>
                                <td width="10%" align="right">Job Position :
                                </td>
                                <td width="35%" align="left">
                                    <asp:DropDownList runat="server" CssClass="btn btn-default" ID="ddlSearchJobID" Width="52%" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchJobID_SelectedIndexChanged" data-delay="10" data-placement="top" data-toggle="popover" data-trigger="focus" title="Grid Info" data-content="No Data Found for your Selected Option.">
                                        <asp:ListItem Text="Select" />
                                    </asp:DropDownList>
                                </td>
                                <td width="30%" align="left">
                                    <asp:Label Text="" runat="server" CssClass="alert-dismissible" data-dismiss="alert" ID="lblgvSeeker" />
                                </td>
                            </tr>
                        </table>
                        <table width="100%" height="40%" border="0" style="margin-top: 10px;">
                            <tr>
                                <td colspan="3" width="100%">
                                    <asp:GridView runat="server" CssClass="table table-condensed" ID="gvSeekerListByJobID" BorderWidth="0" BorderStyle="None" EnableTheming="true" Width="100%" AllowPaging="true" EnableSortingAndPagingCallbacks="true" OnPageIndexChanging="gvSeekerListByJobID_PageIndexChanging" PageSize="3" Height="40%" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField HeaderText="Seeker ID" DataField="SeekerID" />
                                            <asp:BoundField HeaderText="Name" DataField="SeekerName" />
                                            <asp:TemplateField HeaderText="Skill">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" Text='<%#Eval("Skills.Skill") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Country">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" Text='<%#Eval("Countries.CountryName") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="State">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" Text='<%#Eval("States.StateName") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="City">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" Text='<%#Eval("Cities.CityName") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
