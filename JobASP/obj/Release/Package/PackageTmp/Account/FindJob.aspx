<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="FindJob.aspx.cs" Inherits="JobASP.FindJob" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ProMainContent" runat="server">
      <script type="text/javascript">
          $(document).ready(function () {
              $('#' + '<%=ddlSkillSetSel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });
            $('#' + '<%=ddlCountrySel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });
            $('#' + '<%=ddlStateSel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });
            $('#' + '<%=ddlCitySel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            $('.ui-multiselect-menu').each(function () {
                $(this).remove();
            });
            $('#' + '<%=ddlSkillSetSel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });
            $('#' + '<%=ddlCountrySel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });
            $('#' + '<%=ddlStateSel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });
            $('#' + '<%=ddlCitySel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });
        });
    </script>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
             <h2>Find Job.</h2>
            <fieldset style="min-height:400px;text-align:center;">
                <br />
                <p style="text-align:left;font-size:larger">
                <asp:Label Text="Please Select the following dropdownlists to find a job" runat="server" /></p>
                <br />
                 <table width="100%" class="table-condensed">
                        <tr>
                            <td colspan="5" width="100%" style="padding: 0">
                                <legend style="text-align:left">Search</legend>
                            </td>
                        </tr>
                        <tr>
                            <td>SkillSet
                            </td>
                            <td>Country
                            </td>
                            <td>State
                            </td>
                            <td>City
                            </td>
                        </tr>
                        <tr class="" width="100%" align="center">
                            <td width="17%">

                               
                                <select runat="server" multiple="true" id="ddlSkillSetSel">
                                </select>
                            </td>
                            <td width="20%">
                                <select runat="server" multiple="true" id="ddlCountrySel">
                                </select>
                               
                            </td>
                            <td width="23%">
                                <select runat="server" multiple="true" id="ddlStateSel">
                                </select>
                               
                            </td>
                            <td width="20%">
                                <select runat="server" multiple="true" id="ddlCitySel">
                                </select>
                            </td>
                            <td width="20%">
                                <asp:Button Text="Search" runat="server" ID="btnSearch" CssClass="btn btn-primary btn-sm" OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <p class="">
                        <asp:Label Text="" ID="lblErr" runat="server" />
                    </p>
                    <br />
                    <b>
                        <asp:Label Text="" ID="lblNoJob" runat="server" /></b>
                    <br />
                    <table align="center" width="100%" class="table-condensed" style="min-width: 100%">
                        <tr class="">
                            <td width="100%" align="center" class="">
                                <asp:GridView runat="server" AllowPaging="true" ID="gvJobApply" CssClass="table-condensed table" PageSize="5" OnPageIndexChanging="gvJobApply_PageIndexChanging" OnRowCommand="gvJobApply_RowCommand" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField HeaderText="JobID" DataField="JobID" />
                                        <asp:BoundField HeaderText="Job Position" DataField="JobPosition" />
                                        <asp:BoundField HeaderText="Skill" DataField="Skill" />
                                        <asp:BoundField HeaderText="Company" DataField="CompanyName" />
                                        <asp:BoundField HeaderText="Job Posted On" DataField="PostedDate" DataFormatString="{0:d}" />
                                        <asp:BoundField HeaderText="Last Date" DataField="LastDate" DataFormatString="{0:d}" />
                                        <asp:BoundField HeaderText="State" DataField="State" />
                                        <asp:BoundField HeaderText="City" DataField="City" />
                                        <asp:ButtonField ButtonType="Button" CommandName="ApplyJob" HeaderText="Apply" ControlStyle-CssClass="btn btn-primary btn-sm" Text="Apply" />
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="false" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" CssClass="" Font-Bold="false" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:GridView>

                            </td>
                        </tr>
                    </table>
             <%--   <table width="90%">
                    <tr>
                        <td>
                            SkillSet
                        </td>
                        <td>
                            Country
                        </td>
                        <td>
                            State
                        </td>
                        <td>
                            City
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <asp:DropDownList runat="server" ID="ddlSkillSet">
                            </asp:DropDownList>
                        </td>
                        <td width="23%">
                            <asp:DropDownList runat="server" ID="ddlCountry" />
                            <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country"
                                TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country"
                                ServiceMethod="BindCountry" ServicePath="../CCDDLWebService.asmx">
                            </ajax:CascadingDropDown>
                        </td>
                        <td width="22%">
                            <asp:DropDownList runat="server" ID="ddlState" />
                            <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState"
                                ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State"
                                ServiceMethod="BindState" ServicePath="../CCDDLWebService.asmx">
                            </ajax:CascadingDropDown>
                        </td>
                        <td width="20%">
                            <asp:DropDownList runat="server" ID="ddlCity" />
                            <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="City"
                                TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..."
                                PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx">
                            </ajax:CascadingDropDown>
                        </td>
                        <td width="15%">
                            <asp:Button Text="Search" ID="btnSearch" runat="server" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <table width="100%" align="center">
                    <tr>
                        <td colspan="5" width="100%">
                            <asp:GridView runat="server" ID="gvFindJobs" align="center" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvFindJobs_PageIndexChanging" CellPadding="4" CssClass="table table-striped">
                                <Columns>
                                    <asp:BoundField HeaderText="JobID" DataField="JobID" />
                                    <asp:BoundField HeaderText="JobPosition" DataField="JobPosition" />
                                    <asp:BoundField HeaderText="Skill" DataField="Skill" />
                                    <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                                    <asp:BoundField HeaderText="Posted Date" DataField="PostedDate" DataFormatString="{0:d}" />
                                    <asp:BoundField HeaderText="Last Date" DataField="LastDate" DataFormatString="{0:d}" />
                                    <%--<asp:BoundField HeaderText="State" DataField="State" />--%>
             <%--<asp:BoundField HeaderText="City" DataField="City" />
                                </Columns>
                            </asp:GridView>
                            <asp:Label Text="" ID="lblGrid" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label Text="" ID="lblError" runat="server" />
                        </td>
                    </tr>
                </table>--%>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
