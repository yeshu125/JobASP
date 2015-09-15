<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="CompanyProfileS.aspx.cs" Inherits="JobASP.Account.CompanyProfileS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    <fieldset style="min-height: 100%">

        <div class="container">
            <div class="row">
                <br />
                <br />
                Search Companies
            <asp:TextBox runat="server" Width="60%" ID="txtSearch" />
                <asp:Button Text="Search" runat="server" OnClick="btnCompanySearch_Click" ID="btnCompanySearch" />
            </div>
        </div>
        <br />
        <br />
        <div class="container">
            <div class="row">
                Company Search Result
                <%--  <asp:ListView ID="LVCompany" runat="server" DataKeyNames="CompanyID" Class="table-condensed" OnPagePropertiesChanging="LVCompany_PagePropertiesChanging">
               <LayoutTemplate >
                   <ul class="table-condensed">
                       <li></li>
                   </ul>
               </LayoutTemplate>
                       <AlternatingItemTemplate>
                    <tr align="center">
                        <td>
                            <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DomainLabel" runat="server" Text='<%# Eval("Domain") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BranchesLabel" runat="server" Text='<%# Eval("Branches") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CompanyIDLabel" runat="server" Text='<%# Eval("CompanyID") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>

                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DomainLabel" runat="server" Text='<%# Eval("Domain") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BranchesLabel" runat="server" Text='<%# Eval("Branches") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CompanyIDLabel" runat="server" Text='<%# Eval("CompanyID") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">CompanyName</th>
                                        <th runat="server">Domain</th>
                                        <th runat="server">Branches</th>
                                        <th runat="server">CompanyID</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DomainLabel" runat="server" Text='<%# Eval("Domain") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BranchesLabel" runat="server" Text='<%# Eval("Branches") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CompanyIDLabel" runat="server" Text='<%# Eval("CompanyID") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>--%>
                <table class="table-condensed table" border="1" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <asp:Repeater ID="RepeaterActive" runat="server" >
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
               Jobs by Company Search Result
             
                <table class="table-condensed table" border="1" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <asp:Repeater ID="rptCompanyJobList" runat="server" >
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
                                        <asp:Label ID="lblSkill" runat="server" Text='<%# Eval("Skill") %>' />
                                    </td>
                                  
                                    <td>
                                        <asp:Label ID="lblLastDate" runat="server" Text='<%# Eval("LastDate") %>' />
                                    </td>
                                     <td>
                                         <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>' />
                                     </td>
                                    <td>
                                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tr>
                </table>
            </div>
        </div>
    </fieldset>
</asp:Content>
