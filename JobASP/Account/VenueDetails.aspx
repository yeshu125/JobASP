<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="VenueDetails.aspx.cs" Inherits="JobASP.VenueDetails" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
    <title></title>
    <script src="../Scripts/jquery-1.9.0.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.magnific-popup.js" type="text/javascript"></script>
    <link href="../Content/global_styles.css" rel="stylesheet" />
    <link href="../Content/magnific-popup.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
<script type="text/javascript">

    $(document).ready(function () {

        $('#' + '<%=txtInterviewDate.ClientID%>').datetimepicker({
            minDate: '+4d',
            maxDate: '+1m +4d',
            controlType: 'select',
            stepMinute: 30,
            stepHour: 1,
            hourMin: 10,
            hourMax: 18,
            timeFormat: 'hh:mm TT'
        });
    });
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function () {
        $('.ui-datetimepicker').each(function () {
            $(this).remove();
        });
        $('#' + '<%=txtInterviewDate.ClientID%>').datetimepicker({

                stepMinute: 30,
                stepHour: 1,
                hourMin: 10,
                hourMax: 18,
                timeFormat: 'hh:mm TT'
            });
        });
        function HideTable() {
            document.getElementById("<%=tblVenue.ClientID%>").style.display = 'none';
            document.getElementById("<%=txtInterviewDate.ClientID%>").value = "";
            document.getElementById("<%=txtVenueAddress.ClientID%>").value = "";
        }
        function ShowTable() {
            var data = $('#' + '<%=ddlJobVenue.ClientID%>').val();
            if (data != 'Select') {
                document.getElementById("<%=tblVenue.ClientID%>").style.display = 'block';
            }
            else {
                document.getElementById("<%=tblVenue.ClientID%>").style.display = 'none';

            }
        }
</script>
</head>
<body>
    <form runat="server" method="post">
        <ajax:ToolkitScriptManager  runat="server" ></ajax:ToolkitScriptManager>
        <div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Venue</h4>
      </div>
      <div class="modal-body">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td colspan="2" rowspan="1" style="padding: 5px;">
                            <h2>Please select a job to enter the Venue Details</h2>
                        </td>
                    </tr>
                    <tr>
                        <td width="40%" align="right" style="padding-right: 5px;"><b>Job Position :</b></td>
                        <td align="left" width="60%">
                            <asp:DropDownList runat="server" ID="ddlJobVenue" Width="30%" onchange="return ShowTable();" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label Text="" ID="lblError" runat="server" />
                        </td>
                    </tr>
                </table>
                <fieldset style="min-height: 230px; width: 100%; padding: 0px; margin: 0px; text-align: center">
                    <table id="tblVenue" cellspacing="2" runat="server" width="60%" class="VenueTbl" align="left" style="display: none">
                        <%--  <tr>
                        <td width="25%" align="left">Country
                        </td>
                        <td width="30%">
                            <asp:DropDownList ID="ddlCountry" ValidationGroup="VenueGroup" CssClass="CssDDL" Width="80%" runat="server" />
                            <ajax:CascadingDropDown ID="CountryCascading" runat="server"  Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                        </td>
                        <td width="45%">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" ValidationGroup="VenueGroup" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td>
                            <asp:DropDownList ID="ddlState" Style="text-align: center" Width="80%" CssClass="CssDDL" runat="server" ValidationGroup="VenueGroup" />
                            <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State"  TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="red" ValidationGroup="VenueGroup" ErrorMessage="Please Select State" ControlToValidate="ddlState" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>
                            <asp:DropDownList ID="ddlCity" Style="text-align: center" CssClass="CssDDL" Width="80%" runat="server" ValidationGroup="VenueGroup" />
                            <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="red" ValidationGroup="VenueGroup" ErrorMessage="Please Select City" ControlToValidate="ddlCity" runat="server" />
                        </td>
                    </tr>--%>
                        <tr>
                            <td>Address
                            </td>
                            <td valign="bottom">
                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtVenueAddress" Width="78%" Style="margin-top: 2px; margin-bottom: -5px" Height="90%" ValidationGroup="VenueGroup" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ErrorMessage="Please enter the address of the Venue" ValidationGroup="VenueGroup" ControlToValidate="txtVenueAddress" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>Date of Interview
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtInterviewDate" ValidationGroup="VenueGroup" onkeypress="return false;" onpaste="return false;" Width="79%" />
                                <%--<ajax:CalendarExtender ID="ajaxInterviewDate" runat="server" TargetControlID="txtInterviewDate" PopupButtonID="txtInterviewDate" DefaultView="Months" />--%>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" Display="Dynamic" ValidationGroup="VenueGroup" ErrorMessage="Please select the Date and Time" ControlToValidate="txtInterviewDate" runat="server" />
                            </td>
                        </tr>
                        <%--    <tr>
                        <td>Time of Interview
                        </td>
                        <td>

                            <asp:TextBox runat="server" ID="txtInterviewTime" ValidationGroup="VenueGroup" onkeypress="return false;" onpaste="return false;" Width="79%" />
                            <%--<ajax:CalendarExtender ID="ajaxInterivewTime" runat="server" TargetControlID="txtInterviewTime" PopupButtonID="txtInterviewTime" ClearTime="true" ></ajax:CalendarExtender>--%>
                        <%-- </td>
                        <td>
                            <asp:RequiredFieldValidator ID="ReqVenueInterviewTime" Display="Dynamic" ErrorMessage="Please Select the Interview Time" ValidationGroup="VenueGroup" ForeColor="Red" ControlToValidate="txtInterviewTime" runat="server" />
                        </td>
                    </tr>--%>
                    </table>
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
      </div>
      <div class="modal-footer">
             <table align="center" width="100%">
                                    <tr>
                                        <td width="50%" style="margin-left: 4px; text-align: center">
                                            <asp:Button Text="Confirm" ID="btnVenueConfirm" runat="server" OnClick="btnVenueConfirm_Click" ValidationGroup="VenueGroup" class="btn btn-primary"/>
                                        </td>
                                        <td width="50%">
                                            <input type="reset" onclick="Page_ValidationSummariesReset(); HideTable(); return true;" value="Reset" class="btn btn-default" data-dismiss="modal"/>
                                            <%--<asp:Button Text="Clear" runat="server" ID="btnVenueClear" ValidationGroup="VenueGroup" OnClientClick="Page_ValidationSummariesReset();return false;"/>--%>
                                        </td>
                                    </tr>
                                </table>
      <%--  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>--%>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
       
    </form>
</body>
</html>



