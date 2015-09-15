<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="ProfileSeeker.aspx.cs" Inherits="JobASP.ProfileSeeker" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#UploadDiv').on('shown.bs.modal', function () {
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
    <div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <fieldset style="min-height: 325px; min-width: 99%; padding: 0px">
                    <div class="container">
                        <div class="row f-r">
                            <br />
                            <asp:Label ID="Label1" Text="To Upload CV " runat="server" />
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#UploadDiv">Upload Resume</button>
                        </div>
                    </div>
                    <b>
                        <asp:Label Text="To find Job please Select the following DropDownLists" runat="server" /></b>
                    <br />
                    <br />
                    <table width="100%" class="table-condensed">
                        <tr>
                            <td colspan="5" width="100%" style="padding: 0">
                                <legend>Search</legend>
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
                                <select runat="server" multiple="true" id="ddlCountrySel" />
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
                                <asp:Button Text="Search" runat="server" ID="btnProSSearch" CssClass="btn-primary btn-sm" OnClick="btnProSSearch_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <p class="">
                        <asp:Label Text="" ID="lblProSeeker" runat="server" />
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
                </fieldset>
                <fieldset style="min-width: 99%; padding: 0px; min-height: 300px">
                    <table width="100%" style="min-height: 40%">
                        <tr class="" align="center">
                            <td>
                                <h3>Your Applied Job Details 
                                </h3>
                            </td>
                        </tr>
                        <tr class="">
                            <td width="100%" align="center" class="">
                                <asp:GridView runat="server" ID="gvAppliedJobs" AllowPaging="true" PageSize="5" CssClass="table-condensed table" AutoGenerateColumns="False" OnPageIndexChanging="gvAppliedJobs_PageIndexChanging" EmptyDataText="No Data Found" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:BoundField HeaderText="JobID" DataField="JobID" />
                                        <asp:BoundField HeaderText="Job Position" DataField="JobPosition" />
                                        <asp:BoundField HeaderText="Skill" DataField="Skill" />
                                        <asp:BoundField HeaderText="Company" DataField="CompanyName" />
                                        <asp:BoundField HeaderText="Job Applied On" DataField="AppliedDate" DataFormatString="{0:d}" />
                                        <asp:BoundField HeaderText="Last Date" DataField="LastDate" DataFormatString="{0:d}" />
                                        <asp:BoundField HeaderText="State" DataField="State" />
                                        <asp:BoundField HeaderText="City" DataField="City" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>

                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="modal fade" id="UploadDiv">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Add Company Details</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="wrapper cf">

                                <br />
                                <br />
                                <table width="100%">
                                    <tr>
                                        <td width="35%">To view your Previous Resume
                                        </td>
                                        <td width="15%">
                                            <asp:Button ID="btnView" Text="View" CssClass="btn-primary btn-sm" OnClick="btnView_Click" runat="server" />
                                        </td>
                                        <td width="40%"></td>
                                    </tr>
                                </table>
                                <br />
                                <table width="100%" class="table table-condensed">
                                    <tr>
                                        <td width="15%">Resume
                                        </td>
                                        <td width="20%">
                                            <asp:FileUpload ID="fuSeekerResume" runat="server" />
                                        </td>
                                        <td width="15%">
                                            <asp:Button ID="btnUpload" Text="Upload" CssClass="btn-primary btn-sm" OnClick="btnUpload_Click" CausesValidation="true" ValidationGroup="UploadGroup" runat="server" OnClientClick="return ValidateUpload()" />
                                        </td>
                                        <td width="40%">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  Display="Dynamic" ErrorMessage="Please Upload a File" ControlToValidate="fuSeekerResume" runat="server" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ValidationGroup="UploadGroup" Display="Dynamic" ErrorMessage="Please upload only PDF Files" ValidationExpression="[a-zA-Z\\].*(.pdf|.PDF)$" ControlToValidate="fuSeekerResume" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:Label Text="" ID="lblErr" runat="server" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <%--<asp:Button Text="Add"  CssClass="btn btn-primary" ValidationGroup="AddCompanyGroup" ID="AddCompany" runat="server" />--%>
                        <asp:Button Text="Cancel" runat="server" class="btn btn-secondary" CausesValidation="false" data-dismiss="modal" ID="Button2" ValidationGroup="AddCompanyGroup" OnClientClick="Page_ValidationSummariesReset();" />
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->


    </div>
    <script type="text/javascript">
        function ValidateUpload() {

            var file = document.getElementById("<%=fuSeekerResume.ClientID%>").value;
            if (file == null || file == '') {
                document.getElementById("<%=lblErr.ClientID%>").innerHTML = "Please Select a File";
                return false;
            }
            var Extension = file.substring(file.lastIndexOf('.') + 1).toLowerCase();
            if (Extension != "pdf") {
                document.getElementById("<%=lblErr.ClientID%>").innerHTML = "Please Select a PDF File";
                return false;
            }
            else {
                document.getElementById("<%=lblErr.ClientID%>").innerHTML = "";
                return true;
            }

        }
    </script>
</asp:Content>
