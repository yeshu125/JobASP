<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="ProfileSeeker.aspx.cs" Inherits="JobASP.ProfileSeeker" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content runat="server" ID="cntProSeekerHead" ContentPlaceHolderID="HeadContent">
  
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
         <script type="text/javascript">
             $(document).ready(function () {
                 function Validate(sender, args) {
                     var gridView = document.getElementById("<%=gvJobApply.ClientID %>");
                   var checkBoxes = gridView.getElementsByTagName("input");
                   for (var i = 0; i < checkBoxes.length; i++) {
                       if (checkBoxes[i].type == "checkbox" && checkBoxes[i].checked) {
                           args.IsValid = true;
                           return;
                       }
                   }
                   args.IsValid = false;
               }
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
                selectedList: 2
            });
            $('#' + '<%=ddlCountrySel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 2
            });
            $('#' + '<%=ddlStateSel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 2
            });
            $('#' + '<%=ddlCitySel.ClientID%>').multiselect({
                includeSelectAllOption: true,
                multiple: true,
                selectedList: 2
            });
        });
    </script>
   <%-- <asp:SiteMapDataSource ID="SiteMapDataSource2" runat="server" />
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>--%>

    <ol class="breadcrumb">
        <li class="active">Seeker's Home</li>
    </ol>
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
                    <tr align="center">
                        <td width="17%">SkillSet
                        </td>
                        <td width="20%">Country
                        </td>
                        <td width="23%">State
                        </td>
                        <td width="20%">City
                        </td>
                        <td width="20%">

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
                            <asp:Button Text="Search" runat="server" ID="btnProSSearch" CausesValidation="false" CssClass="btn-primary btn-sm" OnClick="btnProSSearch_Click" />
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
                            <asp:GridView runat="server" AllowPaging="true" ID="gvJobApply" CssClass="table-condensed table" PageSize="15" OnPageIndexChanging="gvJobApply_PageIndexChanging" OnRowCommand="gvJobApply_RowCommand" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Apply">
                                        <ItemTemplate>
                                            <asp:CheckBox Text="" ID="chkgvjobApply" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                    <tr>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="gvJobApplyGroup" runat="server" ForeColor="Red" ShowMessageBox="true" ShowSummary="false" DisplayMode="List" />
                            <asp:CustomValidator EnableClientScript="true" SetFocusOnError="true" Style="color: red;" ID="CustomValidator1" runat="server" Display="None" ErrorMessage="Please select at least one record." ClientValidationFunction="Validate" ForeColor="Red" ValidationGroup="gvJobApplyGroup"></asp:CustomValidator>
                            <asp:Button Text="Apply" ID="btngvApply" OnClick="btngvApply_Click" runat="server" CssClass="btn btn-primary btn-sm" Visible="false" ValidationGroup="gvJobApplyGroup" />
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
                    <h4 class="modal-title">Upload Resume</h4>
                </div>
                <div class="modal-body">
                    <br />
                    <br />
                    <%-- <table width="100%">
                            <tr>
                                <td width="50%">To view your Previous Resume
                                </td>
                                <td width="50%">
                                    <asp:Button ID="btnView" Text="View" CssClass="btn-primary btn-sm" OnClick="btnView_Click" runat="server" />
                                </td>
                            </tr>
                        </table>--%>
                    <br />
                    <div class="row">
                        <div class="col-md-12 form-group form-horizontal">
                            <div class="col-md-3 form-label" style="margin-top: 10px;">Resume :</div>
                            <div class="col-md-5">
                                <asp:FileUpload ID="fuSeekerResume" CssClass="form-control-static" runat="server" ValidationGroup="UploadGroup" />
                            </div>
                            <%-- <div class="col-md-2">
                                </div>--%>
                            <div class="col-md-4 no-pl no-pr">
                                <asp:Label Text="" ID="lblErr" runat="server" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnUpload" Text="Upload" CssClass="btn-primary btn-sm" OnClick="btnUpload_Click" CausesValidation="true" ValidationGroup="UploadGroup" runat="server" OnClientClick="return ValidateUpload()" />
                    <%--<asp:Button Text="Add"  CssClass="btn btn-primary" ValidationGroup="AddCompanyGroup" ID="AddCompany" runat="server" />--%>
                    <button value="Cancel" type="reset" class="btn btn-secondary" data-dismiss="modal" id="Button2" onclick="Page_ValidationSummariesReset();">Cancel</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

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
                //BootstrapDialog.show({
                //    Message: "Please Select a PDF File"
                //});
                return false;
            }
            else {
                document.getElementById("<%=lblErr.ClientID%>").innerHTML = "";
                return true;
            }

        }
    </script>
</asp:Content>
