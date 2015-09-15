<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/EmpMaster.master" CodeBehind="ProfileEmployer.aspx.cs" Inherits="JobASP.ProfileEmployer" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">


    <script type="text/javascript">
        $(function () {
            $('#AddVenueDiv').on('shown.bs.modal', function () {
            });
            $('#AddJobDiv').on('shown.bs.modal', function () {
            });
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        });
    </script>
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


            //$('#' + '<%=txtInterviewDate.ClientID%>').datetimepicker({
            //    minDate: '+4d',
            //    maxDate: '+1m +4d',
            //    controlType: 'select',
            //    stepMinute: 30,
            //    stepHour: 1,
            //    hourMin: 10,
            //    hourMax: 18,
            //    timeFormat: 'hh:mm TT'
            //});
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            $('.ui-datetimepicker').each(function () {
                $(this).remove();
            });
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
    <br />
    <table width="100%">
        <tr>
            <td style="padding: 5px;" align="center">
                <div>
                    To Add Venue Details of Job 
                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#AddVenueDiv">Click Here</button>
                </div>
            </td>

            <td align="center">
                <div>
                    To Create a new Job
                         <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#AddJobDiv">Click Here</button>
                </div>
            </td>
            <%--<td align="center">
                <table width="100%">
                    <tr>--%>
            <td align="center">
                <div>
                    To Add Company Details
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#AddCompanyDiv">Click Here</button>
                </div>
            </td>
            <%-- </tr>
                </table>
            </td>--%>
        </tr>


    </table>
    <asp:UpdatePanel runat="server" ID="UPProfEmp">
        <ContentTemplate>
            <fieldset style="min-width: 99%; min-height: 235px; padding: 0px; margin: 0px">
                <table align="center" width="100%">
                    <tr>
                        <td align="center">
                            <h2>Jobs Created by You</h2>
                        </td>
                    </tr>
                </table>
                <table align="center" width="100%">
                    <tr>
                        <td width="100%">
                            <asp:GridView runat="server" ID="gvJobList" EmptyDataText="No Data Found" Width="100%" OnPageIndexChanging="gvJobList_PageIndexChanging" AllowPaging="true" PageSize="5" AutoGenerateColumns="false" CellPadding="2" CssClass="table table-striped" GridLines="None" OnRowCreated="gvJobList_RowCreated">
                                <Columns>
                                    <asp:TemplateField HeaderText="Job Position" HeaderStyle-Width="20%">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Bind("JobPosition") %>' runat="server" ID="lblJobPosition" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtJobPosition" />
                                            <asp:RequiredFieldValidator ErrorMessage="Please Enter the Job Position" Display="None" runat="server"  ControlToValidate="txtJobPosition" ValidationGroup="gvJobListGroup" data-toggle="tooltip" data-placement="top" title="Primary Skill"/>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CompanyName">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Bind("CompanyName") %>' runat="server" ID="lblCompanyName" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" id="txtJobCompany"/>
                                            <asp:RequiredFieldValidator ErrorMessage="Please Enter the Company Name" ControlToValidate="txtJobCompany" runat="server" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Skill">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Bind("Skill") %>' ID="lblSkill" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PostedDate" DataFormatString="{0:d}" HeaderText="Job Posted On" />
                                    <asp:BoundField DataField="LastDate" DataFormatString="{0:d}" HeaderText="Last Date" ApplyFormatInEditMode="true" />
                                    <%--<asp:TemplateField >
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Bind("LastDate") %>' runat="server" ID="lblLastDate" HtmlEncode="false" DataFormatString="{0:d}" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtLastDate" ReadOnly="true" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Please select an End Date" ControlToValidate="txtLastDate" runat="server" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>--%>
                                    <%-- <asp:TemplateField HeaderText="State">
                                        <ItemTemplate>
                                            <asp:Label Text='<%# Bind("State") %>' runat="server" ID="lblState" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label Text='<%#Bind("City") %>' runat="server" ID="lblCity" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:BoundField HeaderText="State" DataField="State" />
                                    <asp:BoundField HeaderText="City" DataField="City" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset style="min-width: 99%; min-height: 235px; padding: 0px; margin: 0px">
                <table width="100%" align="center">
                    <tr>
                        <td align="center">
                            <h3>List of Seekers Who Applied to your Job Posts.</h3>
                        </td>
                    </tr>
                    <tr>
                        <td width="90%" align="center">
                            <asp:GridView runat="server" ID="gvSeekersList" Width="90%" AutoGenerateColumns="false" OnPageIndexChanging="gvSeekersList_PageIndexChanging" CssClass="table table-striped" AllowPaging="true" PageSize="4" OnRowCommand="gvSeekersList_RowCommand" CellPadding="4" GridLines="None">
                                <Columns>
                                    <asp:BoundField HeaderText="SeekerID" DataField="SeekerID" />
                                    <asp:BoundField HeaderText="Name" DataField="SeekerName" />
                                    <asp:BoundField HeaderText="SkillSet" DataField="PrimarySkill" />
                                    <asp:BoundField HeaderText="State" DataField="State" />
                                    <asp:BoundField HeaderText="City" DataField="City" />

                                    <asp:ButtonField HeaderText="Resume" CommandName="View" Text="View" ControlStyle-CssClass="btn btn-primary btn-xs" ButtonType="Button" />

                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <p>
                <asp:Label Text="" ID="lblProError" runat="server" />
            </p>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade" id="AddVenueDiv">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Venue Details</h4>
                </div>
                <div class="modal-body">
                    <h2>Please select a job to enter the Venue Details</h2>

                    <asp:Label Text="" ID="lblError" runat="server" />
                    <div class="container">
                        <div class="row">
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="VenueGroup" DisplayMode="List" ShowSummary="true" />
                            Job Position : 
                                    <asp:DropDownList runat="server" ID="ddlJobVenue" Width="40%" onchange="return ShowTable();" />
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <table id="tblVenue" cellspacing="2" runat="server" width="60%" class="table-condensed" align="center" style="display: none">
                                <tr>
                                    <td width="100%">
                                        <div class="form-group">
                                            <table width="100%" class="table-condensed">
                                                <tr>
                                                    <td width="50%">Address : </td>
                                                    <td width="50%">
                                                        <asp:TextBox runat="server" Rows="4" TextMode="MultiLine" Style="min-width: inherit; width: auto" CssClass="form-control" ID="txtVenueAddress" ValidationGroup="VenueGroup" />
                                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" ForeColor="Red" ErrorMessage="Please enter the address of the Venue" ValidationGroup="VenueGroup" ControlToValidate="txtVenueAddress" runat="server" />
                                                    </td>
                                                </tr>
                                                <%-- </table>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <table width="100%">--%>
                                                <tr>
                                                    <td width="50%">Date of Interview :  
                                                    </td>
                                                    <td width="50%">
                                                        <asp:TextBox runat="server" ID="txtInterviewDate" ValidationGroup="VenueGroup" CssClass="form-control" onkeypress="return false;" onpaste="return false;" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" Display="None" ValidationGroup="VenueGroup" ErrorMessage="Please select the Date and Time" ControlToValidate="txtInterviewDate" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <%--</div>--%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Confirm" ID="btnVenueConfirm" runat="server" OnClick="btnVenueConfirm_Click" ValidationGroup="VenueGroup" class="btn btn-primary" />
                    <button type="reset" onclick="Page_ValidationSummariesReset(); HideTable(); return true;" class="btn btn-default" data-dismiss="modal">Reset</button>
                    <%--<button type="reset" onclick="Page_ValidationSummariesReset(); HideTable(); return true;" value="Reset" class="btn btn-default" />--%>
                    <%--  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>--%>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="AddJobDiv">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Job Details</h4>
                </div>
                <div class="modal-body">
                    <p style="font-weight: bold" class="">
                        Please enter the following details to create a New Job.
                    </p>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:ValidationSummary ID="ValidationSummary1" CssClass="table-condensed" DisplayMode="List" ShowValidationErrors="true" runat="server" ForeColor="red" ValidationGroup="AddJobGroup" ShowSummary="true" />
                                <table width="60%" class="table-condensed">
                                    <tr>
                                        <td align="center">
                                            <div class="col-md-12">
                                                <table width="100%" align="center" class="table-condensed" cellpadding="2">
                                                    <tr>
                                                        <td width="100%">
                                                            <asp:TextBox runat="server" Width="100%" placeholder="JobPosition" ValidationGroup="AddJobGroup" ID="txtJobPosition" onkeypress="return lettersOnly(event);" data-toggle="tooltip" data-placement="top" title="Job Position" />
                                                            <%--<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Job Position">Job Position</button>--%>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please enter the Job Position" ControlToValidate="txtJobPosition" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox runat="server" Width="100%" placeholder="LastDate" ValidationGroup="AddJobGroup" ID="txtCalender" autocomplete="return false;" onkeypress="return false;" data-toggle="tooltip" data-placement="top" title="Last Date" />
                                                            <ajax:CalendarExtender ID="ajaxCalLastDate" runat="server" PopupButtonID="txtCalender" TargetControlID="txtCalender" />
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please select an End Date" ControlToValidate="txtCalender" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList runat="server" Width="100%" placeholder="SkillSet" ValidationGroup="AddJobGroup" ID="ddlSkillSet" data-toggle="tooltip" data-placement="top" title="Primary Skill">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please Select the Skill " ControlToValidate="ddlSkillSet" InitialValue="Select" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtOtherSkills" Width="100%" runat="server" placeholder="Other Skills" data-toggle="tooltip" data-placement="top" title="Other Skills" />
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtCompanyName" Width="100%" runat="server" placeholder="Company Name" data-toggle="tooltip" data-placement="top" title="Company Name" />
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="None" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Enter the Company Name " ControlToValidate="txtCompanyName" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtJobCompanyUrl" Width="100%" runat="server" placeholder="Company Url" data-toggle="tooltip" data-placement="top" title="Company Url" />
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" Display="None" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Enter the Company Url " ControlToValidate="txtJobCompanyUrl" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox runat="server" ID="txtJobQualification" Width="100%" placeholder="Qualification" data-toggle="tooltip" data-placement="top" title="Qualification" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                        <td align="center">
                                            <div class="col-md-12">
                                                <table width="100%" align="center" class="table-condensed" cellpadding="2">
                                                    <tr>
                                                        <td width="100%">
                                                            <asp:DropDownList ID="ddlCountry" placeholder="Country" ValidationGroup="RegGroup" CssClass="CssDDL" Width="100%" runat="server" data-toggle="tooltip" data-placement="top" title="Select Country" />
                                                            <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" ForeColor="red" ValidationGroup="AddJobGroup" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList runat="server" placeholder="State" Width="100%" ValidationGroup="AddJobGroup" ID="ddlState" data-toggle="tooltip" data-placement="top" title="Select State" />
                                                            <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator7" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please select the State" ControlToValidate="ddlState" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList runat="server" placeholder="City" Width="100%" ValidationGroup="AddJobGroup" ID="ddlCity" data-toggle="tooltip" data-placement="top" title="Select City" />
                                                            <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" ErrorMessage="Please select the City" ForeColor="Red" ValidationGroup="AddJobGroup" ControlToValidate="ddlCity" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <%--<asp:TextBox runat="server" placeholder="Experience"  ValidationGroup="AddJobGroup" Width="100%" ID="txtExperience" data-toggle="tooltip" data-placement="top" title="Experience"/>--%>
                                                            <select runat="server" placeholder="Experience" style="width: 100%;" id="ddlExperienceSel" data-toggle="tooltip" data-placement="top" title="Experience">
                                                                <option value="0">Experience</option>
                                                                <option value="1">Fresher</option>
                                                                <option value="2"><1 Year</option>
                                                                <option value="3">1</option>
                                                                <option value="4">2</option>
                                                                <option value="5">3</option>
                                                                <option value="6">4</option>
                                                                <option value="7">5</option>
                                                                <option value="8">6</option>
                                                                <option value="9">7</option>
                                                                <option value="10">8</option>
                                                                <option value="11">9</option>
                                                                <option value="12">10</option>
                                                                <option value="13">>10 lac</option>
                                                            </select>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select runat="server" placeholder="Salary" style="width: 100%;" id="ddlSalarySel" data-toggle="tooltip" data-placement="top" title="Salary">
                                                                <option value="0">Salary</option>
                                                                <option value="1"><1 lac</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                                <option value="5">5</option>
                                                                <option value="6">6</option>
                                                                <option value="7">7</option>
                                                                <option value="8">8</option>
                                                                <option value="9">9</option>
                                                                <option value="10">10</option>
                                                                <option value="11">>10 lac</option>

                                                            </select>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <%--<asp:TextBox runat="server" placeholder="Job Description" Rows="4" ValidationGroup="AddJobGroup" Width="100%" ID="txtJobDescription" data-toggle="tooltip" data-placement="top" title="Job Description"/>--%>
                                                            <textarea runat="server" placeholder="Job Description" rows="3" validationgroup="AddJobGroup" style="width: 100%" id="txtAreaJobDescription" data-toggle="tooltip" data-placement="top" title="Job Description"></textarea>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator9" ErrorMessage="Please enter job Description" ForeColor="Red" ValidationGroup="AddJobGroup" ControlToValidate="txtAreaJobDescription" runat="server" />
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

                                </table>
                            </div>
                        </div>
                    </div>
                    <p>
                        <asp:Label Text="" ID="lblAddError" runat="server" />
                    </p>
                </div>
                <div class="modal-footer">

                    <asp:Button Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-primary" ValidationGroup="AddJobGroup" ID="btnAdd" runat="server" />
                    <asp:Button Text="Cancel" runat="server" class="btn btn-secondary" CausesValidation="false" data-dismiss="modal" ID="btnCancel" ValidationGroup="AddJobGroup" OnClientClick="Page_ValidationSummariesReset();" />
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>--%>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="modal fade" id="AddCompanyDiv">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Company Details</h4>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="wrapper cf">
                            <asp:ValidationSummary runat="server" ShowSummary="true" ValidationGroup="AddCompanyGroup" ForeColor="Red" DisplayMode="List" />
                            <table class="table-condensed" width="60%">
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" placeholder="Company Name" ID="txtName" data-toggle="tooltip" data-placement="top" title="Company Name" />
                                        <asp:RequiredFieldValidator ErrorMessage="Please Enter the Company Name" ControlToValidate="txtName" ValidationGroup="AddCompanyGroup" Display="None" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" placeholder="Domain" ID="txtCompanyDomain" data-toggle="tooltip" data-placement="top" title="Domain" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ErrorMessage="Please Enter the Company Domain" ValidationGroup="AddCompanyGroup" ControlToValidate="txtCompanyDomain" Display="None" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Rows="4" TextMode="MultiLine" placeholder="Company Address" ID="txtCompanyAddress" data-toggle="tooltip" data-placement="top" title="Company Address" />
                                        <asp:RequiredFieldValidator ErrorMessage="Please enter Address" ControlToValidate="txtCompanyAddress" ValidationGroup="AddCompanyGroup" runat="server" Display="None" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Rows="4" TextMode="MultiLine" Placeholder="About Company" ID="txtAboutCompany" data-toggle="tooltip" data-placement="top" title="About Company" />
                                        <asp:RequiredFieldValidator ErrorMessage="Please Enter About Company" ControlToValidate="txtAboutCompany" ValidationGroup="AddCompanyGroup" runat="server" Display="None" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtCompanyUrl" runat="server" placeholder="Please Paste Company Url" data-toggle="tooltip" data-placement="top" title="Paste Company Url" />
                                        <asp:RequiredFieldValidator ErrorMessage="Please Enter the Company Url" ControlToValidate="txtCompanyUrl" ValidationGroup="AddCompanyGroup" runat="server" Display="None" />
                                    </td>
                                    <td>
                                        <asp:FileUpload runat="server" ID="fuCompanyImageUrl" placeholder="Upload Company Logo" data-toggle="tooltip" data-placement="top" title="Upload Company Logo" />
                                        <%--<ajax:AsyncFileUpload runat="server" ID="fuAjaxCompanyImageUrl" placeholder="Upload Company Logo" data-toggle="tooltip" data-placement="top" title="Upload Company Logo"/>--%>
                                        <asp:RequiredFieldValidator ErrorMessage="Please Upload Company Logo" ControlToValidate="fuCompanyImageUrl" ValidationGroup="AddCompanyGroup" runat="server" Display="None" />
                                        <asp:RegularExpressionValidator ErrorMessage="Please Upload a png or JPEG image" ControlToValidate="fuCompanyImageUrl" ValidationGroup="AddCompanyGroup" Display="None" runat="server" ValidationExpression="[a-zA-Z\\].*(.jpg|.JPG|.JPEG|.jpeg|.png|.PNG)$" />

                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                        <asp:TextBox ID="txtNoofEmp" runat="server" placeholder="No.of Employees" onkeypress="return blockNonNumbers(this,event)" data-toggle="tooltip" data-placement="top" title="No.of Employees" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBranches" runat="server" placeholder="Branches" data-toggle="tooltip" data-placement="top" title="Branches" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtCompanyPhNum" runat="server" placeholder="Phone Number" onkeypress="return blockNonNumbers(this,event)" data-toggle="tooltip" data-placement="top" title="Phone Number" MaxLength="10" />
                                        <asp:RequiredFieldValidator ErrorMessage="Please Enter the Phone Number" ControlToValidate="txtCompanyPhNum" ValidationGroup="AddCompanyGroup" runat="server" Display="None" />
                                        <%--<asp:RangeValidator runat="server" ControlToValidate="txtCompanyPhNum" ValidationGroup="AddCompanyGroup" ErrorMessage="Please Enter 10 Digits Only" MaximumValue="9999999999" MinimumValue="7000000000" Type="Integer" Display="None"></asp:RangeValidator>--%>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCompanyEmailID" runat="server" placeholder="Company EmailID" data-toggle="tooltip" data-placement="top" title="Company EmailID" />
                                        <asp:RequiredFieldValidator ErrorMessage="Please Enter the EmailID" ControlToValidate="txtCompanyEmailID" ValidationGroup="AddCompanyGroup" runat="server" Display="None" />
                                        <asp:RegularExpressionValidator Display="None" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="AddCompanyGroup" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtCompanyEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Add" OnClick="AddCompany_Click" CssClass="btn btn-primary" ValidationGroup="AddCompanyGroup" ID="AddCompany" runat="server" />
                    <asp:Button Text="Cancel" runat="server" class="btn btn-secondary" CausesValidation="false" data-dismiss="modal" ID="Button2" ValidationGroup="AddCompanyGroup" OnClientClick="Page_ValidationSummariesReset();" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <<%--/ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
