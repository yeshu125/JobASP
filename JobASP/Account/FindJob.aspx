<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="FindJob.aspx.cs" Inherits="JobASP.FindJob" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ContentPlaceHolderID="ProHeadContent" runat="server" ID="cntFindJobHead">
    <script type="text/javascript">
        function funcAlertWrong() {
            document.getElementById("alertWrong").style.display = 'block';
        }
        $(document).ready(function () {
            $('.ddlmulti').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });


        });

    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ProMainContent" runat="server">
    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            $('.ui-multiselect-menu').each(function () {
                $(this).remove();
            });
            $('.ddlmulti').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 3
            });
        });
    </script>
    <ol class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li class="active">Find Job</li>
    </ol>

    <div class="alert alert-info" style="display: none" id="alertWrong">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>Info!</strong> Something went Wrong.
    </div>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <h2>Find Job.</h2>
            <fieldset style="min-height: 400px; text-align: center;">
                <br />
                <p style="text-align: left; font-size: larger">
                    <asp:Label Text="Please Select the following dropdownlists to find a job" runat="server" />
                </p>
                <br />
                <table width="100%" class="table-condensed">
                    <tr>
                        <td colspan="5" width="100%" style="padding: 0">
                            <legend style="text-align: left">Search</legend>
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


                            <select runat="server" class="ddlmulti" multiple="true" id="ddlSkillSetSel">
                            </select>
                        </td>
                        <td width="20%">
                            <select runat="server" class="ddlmulti" multiple="true" id="ddlCountrySel">
                            </select>

                        </td>
                        <td width="23%">
                            <select runat="server" class="ddlmulti" multiple="true" id="ddlStateSel">
                            </select>

                        </td>
                        <td width="20%">
                            <select runat="server" class="ddlmulti" multiple="true" id="ddlCitySel">
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
                            <asp:GridView runat="server" AllowPaging="true" ID="gvJobApply" CssClass="table-condensed table pagination-sm" PageSize="1" OnPageIndexChanging="gvJobApply_PageIndexChanging" OnRowCommand="gvJobApply_RowCommand" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField HeaderText="JobID" DataField="JobID" />
                                    <asp:BoundField HeaderText="Job Position" DataField="JobPosition" />
                                    <asp:TemplateField HeaderText="Skill">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" Text='<%#Eval("Skills.Skill") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Company" DataField="CompanyName" />
                                    <asp:BoundField HeaderText="Job Posted On" DataField="PostedDate" DataFormatString="{0:d}" />
                                    <asp:BoundField HeaderText="Last Date" DataField="LastDate" DataFormatString="{0:d}" />
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
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
