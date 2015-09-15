<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMaster.master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="JobASP.Account.CompanyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProMainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#' + '<%=txtSearch.ClientID%>').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "CompanyProfile.aspx/GetAutoData",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error......");
                        }
                    });
                }
            });
        });
    </script>


    <div class="container">
        <div class="row">
            <br />
            <br />
            Search Companies
                <div class="col-md-12">
                    <div class="col-md-6">
                        <asp:TextBox runat="server" Width="100%" ID="txtSearch" CssClass="form-control" />
                    </div>
                    <div class="col-md-6">
                        <asp:Button Text="Search" runat="server" OnClick="btnCompanySearch_Click" CssClass="btn btn-primary btn-sm" ID="btnCompanySearch" />
                    </div>
                </div>
        </div>
    </div>
    <br />
    <br />
    <div class="container">
        <div class="row">
            Company Search Result
           <asp:Label ID="lblRepeaterActive" runat="server" />
                <table class="table-condensed table" border="1" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <asp:Repeater ID="RepeaterActive" runat="server">
                            <HeaderTemplate>
                                <th width="10%">Company ID
                                </th>
                                <th width="30%">Company  Name
                                </th>
                                <th width="20%">Domain
                                </th>
                                <th width="40%">Branches
                                </th>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="CompanyIDLabel" runat="server" Text='<%# Eval("CompanyID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="DomainLabel" runat="server" Text='<%# Eval("Domain") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="BranchesLabel" runat="server" Text='<%# Eval("Branches") %>' />
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tr>
                </table>
        </div>
    </div>
    <div class="container">
        <div class="row">
            Jobs by Company Result
              <asp:Label ID="lblrptCompanyJobList" runat="server" />
                <table class="table-condensed table" border="1" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <asp:Repeater ID="rptCompanyJobList" runat="server">
                            <HeaderTemplate>
                                <th width="20%">Job Position
                                </th>
                                <th width="20%">Skill
                                </th>
                                <th width="20%">Last Date
                                </th>
                                <th width="20%">State
                                </th>
                                <th width="20%">City
                                </th>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblJobPositionID" runat="server" Text='<%# Eval("JobPosition") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblSkill" runat="server" Text='<%# Eval("Skills.Skill") %>' />
                                    </td>

                                    <td>
                                        <asp:Label ID="lblLastDate" runat="server" Text='<%#Eval("LastDate", "{0:M/d/yyyy}") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("States.StateName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("Cities.CityName") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tr>
                </table>
        </div>
    </div>
</asp:Content>
