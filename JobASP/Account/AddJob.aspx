<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddJob.aspx.cs" Inherits="JobASP.AddJob" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html>
<html style="background-color:white;">
<head runat="server">
    <title></title>
    <style type="text/css">
        .table-striped {
            width: 54%;
        }
    </style>
</head>
<body >
     <%-- <script type="text/javascript">

          $(function () {

              $('#' + '<%=txtCalender.ClientID%>').datepicker({
                changeMonth: true,
                changeYear: true,
                inline: true,
                autoSize: false,
                minDate: 3,
                maxDate: 90
            });
        });

    </script>--%>
    <form method="post" runat="server">
        <ajax:ToolkitScriptManager runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <br />
                <div id="AddJobDiv" class="white-popup-block mfp-hide">
                    <p style="text-align: left; color: black; font-size: larger; font-weight: bold">
                        Please enter the following details to create a New Job.
                    </p>
                    <br />
                    <asp:ValidationSummary runat="server" ForeColor="red" ValidationGroup="AddJobGroup" ShowSummary="true" />
                    <div class="container">
                        <div class="row">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div class="col-md-4">
                                            <table width="100%" align="center" class="table-striped" cellpadding="2">
                                                <tr>
                                                    <td width="100%">
                                                        <asp:TextBox runat="server" Width="100%" placeholder="JobPosition" ValidationGroup="AddJobGroup" ID="txtJobPosition" onkeypress="return lettersOnly(event);" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please enter the Job Position" ControlToValidate="txtJobPosition" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" Width="100%" placeholder="LastDate" ValidationGroup="AddJobGroup" ID="txtCalender" autocomplete="return false;" onkeypress="return false;" />
                                                        <ajax:CalendarExtender ID="ajaxCalLastDate" runat="server" PopupButtonID="txtCalender" TargetControlID="txtCalender" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please select an End Date" ControlToValidate="txtCalender" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList runat="server" Width="100%" placeholder="SkillSet" ValidationGroup="AddJobGroup" ID="ddlSkillSet">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please Select the Skill " ControlToValidate="ddlSkillSet" InitialValue="Select" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtOtherSkills" Width="100%" runat="server" placeholder="Other Skills" />
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-md-4">
                                            <table width="100%" align="center" class="table-striped" cellpadding="2">
                                                <tr>
                                                    <td width="100%">
                                                        <asp:DropDownList ID="ddlCountry" placeholder="Country" ValidationGroup="RegGroup" CssClass="CssDDL" Width="100%" runat="server" />
                                                        <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" ForeColor="red" ValidationGroup="AddJobGroup" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList runat="server" placeholder="State" Width="100%" ValidationGroup="AddJobGroup" ID="ddlState" />
                                                        <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please select the State" ControlToValidate="ddlState" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList runat="server" placeholder="City" Width="100%" ValidationGroup="AddJobGroup" ID="ddlCity" />
                                                        <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" ErrorMessage="Please select the City" ForeColor="Red" ValidationGroup="AddJobGroup" ControlToValidate="ddlCity" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" placeholder="Job Description" Rows="4" ValidationGroup="AddJobGroup" Width="100%" ID="txtJobDescription" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator7" ErrorMessage="Please enter job Description" ForeColor="Red" ValidationGroup="AddJobGroup" ControlToValidate="txtJobDescription" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </table>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-default" ValidationGroup="AddJobGroup" ID="btnAdd" runat="server" />
                                    </td>
                                    <td align="left">
                                        <asp:Button Text="Cancel" runat="server" CssClass="btn btn-default" ID="btnCancel" OnClientClick="return closePopUp();" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <p>
                        <asp:Label Text="" ID="lblAddError" runat="server" />
                    </p>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>



