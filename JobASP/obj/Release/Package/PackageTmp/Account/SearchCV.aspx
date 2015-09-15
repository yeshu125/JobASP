<%@ Page Title="" Language="C#" MasterPageFile="~/EmpMaster.master" AutoEventWireup="true" CodeBehind="SearchCV.aspx.cs" Inherits="JobASP.Account.SearchCV" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="uc" TagName="Search" Src="~/Account/UCSearch.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdateProgress runat="server" >
        <ProgressTemplate>
            <div id="loading">
                <b>Loading...</b>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <h3>Search Seekers </h3>
             <asp:Label Text="" ID="lblGrid" runat="server" />
             <uc:Search runat="server" ID="UCSearch" Width="99%" />


            <table width="100%">
                
                <%--<tr>
                    <td width="100%">
                        <fieldset style="min-width: 99%; min-height: 250px">
                            
                           
                        </fieldset>
                    </td>
                </tr>--%>
                <tr>
                    <td>
                        <h3>Find Seekers according jobs</h3>
                        
                            <table width="100%" align="center">
                                <tr>
                                    <td colspan="3">Please Select the Job Position
                                    </td>
                                </tr>
                                <tr>
                                    <td width="35%"></td>
                                    <td width="30%" align="center">
                                        <legend>Job Position</legend>
                                    </td>
                                    <td width="35%"></td>
                                </tr>
                                <tr>
                                    <td width="35%"></td>
                                    <td width="30%" align="center">
                                        <asp:DropDownList runat="server" CssClass="btn btn-default" ID="ddlSearchJobID" Width="45%" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchJobID_SelectedIndexChanged">
                                            <asp:ListItem Text="Select" />
                                        </asp:DropDownList>
                                    </td>
                                    <td width="35%"></td>
                                </tr>
                            </table>
                            <table width="100%" height="40%" border="0" style="margin-top:10px;">
                                <tr>
                                    <td colspan="3" width="100%">
                                        <asp:GridView runat="server" CssClass="table table-condensed" ID="gvSeekerListByJobID" BorderWidth="0" BorderStyle="None" EmptyDataText="No Data Found for your Search" EnableTheming="true" Width="100%" AllowPaging="true" EnableSortingAndPagingCallbacks="true" OnPageIndexChanging="gvSeekerListByJobID_PageIndexChanging" PageSize="3" Height="40%" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:BoundField HeaderText="Seeker ID" DataField="SeekerID" />
                                                <asp:BoundField HeaderText="Name" DataField="SeekerName" />
                                                <asp:BoundField HeaderText="SillSet" DataField="PrimarySkill" />
                                                <asp:BoundField HeaderText="State" DataField="State" />
                                                <asp:BoundField HeaderText="City" DataField="City" />
                                            </Columns>
                                            <EmptyDataRowStyle BorderStyle="NotSet" BorderWidth="0" Font-Bold="true" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
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
