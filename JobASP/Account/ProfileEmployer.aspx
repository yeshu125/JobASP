<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/EmpMaster.master" CodeBehind="ProfileEmployer.aspx.cs" Inherits="JobASP.ProfileEmployer" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content runat="server" ContentPlaceHolderID="HeadContent" ID="cntProEmpHead">
    <link href="../Content/jquery.jqGrid/ui.jqgrid.css" rel="stylesheet" />
    <script src="../Scripts/i18n/grid.locale-en.js"></script>
    <script src="../Scripts/jquery.jqGrid.min.js"></script>
    <script src="../Scripts/VacancyJobDetails.js"></script>
    <link href="../Content/layout-jqgrid.css" rel="stylesheet" />

</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">
        $(function () {
            //$('#AddVenueDiv').on('shown.bs.modal', function () {
            //});
            //$('#AddJobDiv').on('shown.bs.modal', function () {
            //    $(this).find('.modal-dialog').css({
            //        height: 'auto',
            //        'max-height': '100%',
            //        'max-width':'80%'
            //    });
            //});
            $('[data-toggle="tooltip"]').tooltip()

            $("#extruderLeft").buildMbExtruder({
                position: "left",
                width: 250,
                extruderOpacity: .8,
                hidePanelsOnClose: true,
                accordionPanels: true,
                onExtOpen: function () { },
                onExtContentLoad: function () { },
                onExtClose: function () { }
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#' + '<%=txtInterviewDate.ClientID%>').datetimepicker({
                minDate: '+4d',
                //maxDate: '+1m +4d',
                controlType: 'select',
                stepMinute: 30,
                stepHour: 1,
                hourMin: 10,
                hourMax: 18,
                timeFormat: 'hh:mm TT'

            });
        });

        function setId(id) {
            document.getElementById("<%=hdnVenueJobId.ClientID%>").value = id;
        }
        function setDetailsId(jobid) {
        }
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            $('.ui-datetimepicker').each(function () {
                $(this).remove();
            });
            $('#' + '<%=txtInterviewDate.ClientID%>').datetimepicker({

                minDate: '+4d',
                //maxDate: '+1m +4d',
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
    <ol class="breadcrumb">
        <li class="active">Employer's Home</li>
    </ol>
    <br />
    <div class="container clearfix">
        <div class="row clearfix">
            <div class="f-r">
                <%--<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#AddVenueDiv">Add Venue</button>--%>
                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#AddJobDiv">Add Job</button>
                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#AddCompanyDiv">Add Company</button>
            </div>
        </div>
    </div>

    <table align="center" width="100%">
        <tr>
            <td align="center">
                <h2>Jobs Created by You</h2>
            </td>
        </tr>
    </table>
    <section>
        <table id="grid" />
        <div id="pager"></div>
    </section>
    <section>
        <table align="center" width="100%">
            <tr>
                <td align="center">
                    <h2>Company Details</h2>
                </td>
            </tr>
        </table>
        <section>
            <table id="gridCompany" />
            <div id="pagerCompany"></div>
        </section>
    </section>
    <table width="100%" align="center">
        <tr>
            <td align="center">
                <h3>List of Seekers Who Applied to your Job Posts.</h3>
            </td>
        </tr>
        <tr>
            <td width="90%" align="center">
                <asp:GridView runat="server" ID="gvSeekersList" Width="90%" AutoGenerateColumns="false" CssClass="table table-striped" AllowPaging="true" PageSize="4" OnRowCommand="gvSeekersList_RowCommand" CellPadding="4" GridLines="None">
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
    <p>
        <asp:Label Text="" ID="lblProError" runat="server" />
    </p>


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
                            <input type="hidden" name="JobId" value="" id="hdnVenueJobId" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlJobVenue" CssClass="form-control" Style="display: none" Width="40%" onchange="return ShowTable();" />
                        </div>
                    </div>

                    <div class="form-group">
                        <table width="100%" id="tblVenue" runat="server" class="table-condensed">
                            <tr>
                                <td width="20%">Address : </td>
                                <td width="40%">
                                    <asp:TextBox runat="server" Rows="4" TextMode="MultiLine"  CssClass="form-control" ID="txtVenueAddress" ValidationGroup="VenueGroup" />
                                </td>
                                <td width="40%">
                                    <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator4" ForeColor="Red" ErrorMessage="Please enter the address of the Venue" ValidationGroup="VenueGroup" ControlToValidate="txtVenueAddress" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">Date of Interview :  
                                </td>
                                <td width="40%">
                                    <asp:TextBox runat="server" ID="txtInterviewDate" ValidationGroup="VenueGroup"  CssClass="form-control" onkeypress="return false;" onpaste="return false;" />

                                </td>
                                <td width="40%">
                                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator5" ForeColor="Red" Display="Dynamic" ValidationGroup="VenueGroup" ErrorMessage="Please select the Date and Time" ControlToValidate="txtInterviewDate" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                 </div>
                <div class="modal-footer">
                    <asp:Button Text="Confirm" ID="btnVenueConfirm" runat="server" OnClick="btnVenueConfirm_Click" ValidationGroup="VenueGroup" class="btn btn-primary" />
                    <button type="reset" onclick="Page_ValidationSummariesReset();" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="AddJobDiv">
        <div class="modal-dialog-lg" style="max-width: 85%; margin-left: 75px; margin-top: 50px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Job Details</h4>
                </div>
                <div class="modal-body">
                    <p style="font-weight: bold" class="">
                        Please enter the following details to create a New Job.
                    </p>

                    <div class="row">
                        <div class="col-lg-12">
                            <%--<asp:ValidationSummary ID="ValidationSummary1" CssClass="table-condensed" DisplayMode="List" ShowValidationErrors="true" runat="server" ForeColor="red" ValidationGroup="AddJobGroup" ShowSummary="true" />--%>
                            <table width="100%" class="table-condensed">
                                <tr>
                                    <td align="center" width="50%">
                                        <div class="col-md-12">
                                            <table width="100%" align="center" class="table-condensed" cellpadding="2">
                                                <tr>
                                                    <td width="50%">
                                                        <asp:TextBox runat="server" CssClass="form-control" Width="100%" placeholder="JobPosition" ValidationGroup="AddJobGroup" ID="txtJobPosition" onkeypress="return lettersWithSpaceOnly(event);" data-toggle="tooltip" data-placement="top" title="Job Position" />

                                                    </td>
                                                    <td width="50%">
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator1" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please enter the Job Position" ControlToValidate="txtJobPosition" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" Width="100%" CssClass="form-control" placeholder="LastDate" ValidationGroup="AddJobGroup" ID="txtCalender" autocomplete="return false;" onkeypress="return false;" data-toggle="tooltip" data-placement="top" title="Last Date" />
                                                        <ajax:CalendarExtender ID="ajaxCalLastDate" runat="server" PopupButtonID="txtCalender" TargetControlID="txtCalender" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" Display="Dynamic" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please select an End Date" ControlToValidate="txtCalender" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="form-control" Width="100%" placeholder="SkillSet" ValidationGroup="AddJobGroup" ID="ddlSkillSet" data-toggle="tooltip" data-placement="top" title="Primary Skill">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true" Display="Dynamic" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please Select the Skill " ControlToValidate="ddlSkillSet" InitialValue="Select" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtOtherSkills" CssClass="form-control" Width="100%" runat="server" placeholder="Other Skills" data-toggle="tooltip" data-placement="top" title="Other Skills" />
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCompanyName" CssClass="form-control" Width="100%" runat="server" placeholder="Company Name" data-toggle="tooltip" data-placement="top" title="Company Name" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" SetFocusOnError="true" Display="Dynamic" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Enter the Company Name " ControlToValidate="txtCompanyName" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtJobCompanyUrl" CssClass="form-control" Width="100%" runat="server" placeholder="Company Url" data-toggle="tooltip" data-placement="top" title="Company Url" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" SetFocusOnError="true" Display="Dynamic" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Enter the Company Url " ControlToValidate="txtJobCompanyUrl" runat="server" />

                                                        <asp:RegularExpressionValidator ErrorMessage="Url must have http:\\ or https:\\" ControlToValidate="txtJobCompanyUrl" runat="server" SetFocusOnError="true" Display="Dynamic" ValidationGroup="AddJobGroup" ForeColor="Red" ValidationExpression="^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtJobQualification" Width="100%" placeholder="Qualification" data-toggle="tooltip" data-placement="top" title="Qualification" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td align="center" width="50%">
                                        <div class="col-md-12">
                                            <table width="100%" align="center" class="table-condensed" cellpadding="2">
                                                <tr>
                                                    <td width="50%">
                                                        <asp:DropDownList ID="ddlCountry" CssClass="form-control" placeholder="Country" ValidationGroup="RegGroup" Width="100%" runat="server" data-toggle="tooltip" data-placement="top" title="Select Country" />
                                                        <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                                    </td>
                                                    <td width="50%">
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator6" ForeColor="red" ValidationGroup="AddJobGroup" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="form-control" placeholder="State" Width="100%" ValidationGroup="AddJobGroup" ID="ddlState" data-toggle="tooltip" data-placement="top" title="Select State" />
                                                        <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator7" ValidationGroup="AddJobGroup" ForeColor="Red" ErrorMessage="Please select the State" ControlToValidate="ddlState" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="form-control" placeholder="City" Width="100%" ValidationGroup="AddJobGroup" ID="ddlCity" data-toggle="tooltip" data-placement="top" title="Select City" />
                                                        <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator8" ErrorMessage="Please select the City" ForeColor="Red" ValidationGroup="AddJobGroup" ControlToValidate="ddlCity" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <%--<asp:TextBox runat="server" placeholder="Experience"  ValidationGroup="AddJobGroup" Width="100%" ID="txtExperience" data-toggle="tooltip" data-placement="top" title="Experience"/>--%>
                                                        <select runat="server" placeholder="Experience" class="form-control" style="width: 100%;" id="ddlExperienceSel" data-toggle="tooltip" data-placement="top" title="Experience">
                                                            <option value="0">Experience</option>
                                                            <option value="1">Fresher</option>
                                                            <option value="2">1 Year</option>
                                                            <option value="3">2 Years</option>
                                                            <option value="4">3 Years</option>
                                                            <option value="5">4 Years</option>
                                                            <option value="6">5 Years</option>
                                                            <option value="7">6 Years</option>
                                                            <option value="8">7 Years</option>
                                                            <option value="9">8 Years</option>
                                                            <option value="10">9 Years</option>
                                                            <option value="11">10 Years</option>
                                                            <option value="12">>10 Years</option>
                                                        </select>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select runat="server" placeholder="Salary" class="form-control" style="width: 100%;" id="ddlSalarySel" data-toggle="tooltip" data-placement="top" title="Salary">
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
                                                            <option value="11">>10</option>
                                                        </select>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <%--<asp:TextBox runat="server" placeholder="Job Description" Rows="4" ValidationGroup="AddJobGroup" Width="100%" ID="txtJobDescription" data-toggle="tooltip" data-placement="top" title="Job Description"/>--%>
                                                        <textarea runat="server" placeholder="Job Description" class="form-control" rows="3" validationgroup="AddJobGroup" style="width: 100%" id="txtAreaJobDescription" data-toggle="tooltip" data-placement="top" title="Job Description"></textarea>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator9" ErrorMessage="Please enter job Description" ForeColor="Red" ValidationGroup="AddJobGroup" ControlToValidate="txtAreaJobDescription" runat="server" />
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

                    <p>
                        <asp:Label Text="" ID="lblAddError" runat="server" />
                    </p>
                </div>
                <div class="modal-footer">

                    <asp:Button Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-primary" ValidationGroup="AddJobGroup" ID="btnAdd" runat="server" />
                    <asp:Button Text="Cancel" runat="server" class="btn btn-secondary" CausesValidation="false" data-dismiss="modal" ID="btnCancel" ValidationGroup="AddJobGroup" OnClientClick="Page_ValidationSummariesReset();" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="modal fade" id="AddCompanyDiv">
        <div class="modal-dialog-lg" style="max-width: 85%; margin-left: 75px; margin-top: 50px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Company Details</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="Company Name" ID="txtName" data-toggle="tooltip" data-placement="top" title="Company Name" />
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ForeColor="Red" ErrorMessage="Please Enter the Company Name" ControlToValidate="txtName" ValidationGroup="AddCompanyGroup" Display="Dynamic" SetFocusOnError="true" runat="server" />
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="Domain" ID="txtCompanyDomain" data-toggle="tooltip" data-placement="top" title="Domain" />
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ErrorMessage="Please Enter the Company Domain" ValidationGroup="AddCompanyGroup" ControlToValidate="txtCompanyDomain" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <asp:TextBox runat="server" CssClass="form-control" Rows="4" TextMode="MultiLine" placeholder="Company Address" ID="txtCompanyAddress" data-toggle="tooltip" data-placement="top" title="Company Address" />
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ErrorMessage="Please enter Address" ControlToValidate="txtCompanyAddress" ValidationGroup="AddCompanyGroup" runat="server" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" />
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox runat="server" CssClass="form-control" Rows="4" TextMode="MultiLine" Placeholder="About Company" ID="txtAboutCompany" data-toggle="tooltip" data-placement="top" title="About Company" />
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ErrorMessage="Please Enter About Company" ControlToValidate="txtAboutCompany" ValidationGroup="AddCompanyGroup" runat="server" Display="Dynamic" SetFocusOnError="true" ForeColor="red" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <asp:TextBox ID="txtCompanyUrl" CssClass="form-control" runat="server" placeholder="Please Paste Company Url" data-toggle="tooltip" data-placement="top" title="Paste Company Url" />
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ErrorMessage="Please Enter the Company Url" ControlToValidate="txtCompanyUrl" ValidationGroup="AddCompanyGroup" runat="server" Display="Dynamic" SetFocusOnError="true" ForeColor="red" />
                            </div>
                            <div class="col-md-3">
                                <asp:FileUpload runat="server" CssClass="form-control" ID="fuCompanyImageUrl" placeholder="Upload Company Logo" data-toggle="tooltip" data-placement="top" title="Upload Company Logo" />
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ErrorMessage="Please Upload Company Logo" ControlToValidate="fuCompanyImageUrl" ValidationGroup="AddCompanyGroup" runat="server" Display="Dynamic" SetFocusOnError="true" ForeColor="red" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Please Upload a png or JPEG image" ControlToValidate="fuCompanyImageUrl" ValidationGroup="AddCompanyGroup" Display="Dynamic" SetFocusOnError="true" ForeColor="red" runat="server" ValidationExpression="[a-zA-Z\\].*(.jpg|.JPG|.JPEG|.jpeg|.png|.PNG)$" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <asp:TextBox ID="txtNoofEmp" CssClass="form-control" runat="server" placeholder="No.of Employees" onkeypress="return blockNonNumbers(this,event)" data-toggle="tooltip" data-placement="top" title="No.of Employees" />
                            </div>
                            <div class="col-md-3"></div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtBranches" CssClass="form-control" runat="server" placeholder="Branches" data-toggle="tooltip" data-placement="top" title="Branches" />
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <asp:TextBox ID="txtCompanyPhNum" CssClass="form-control" runat="server" placeholder="Phone Number" onkeypress="return blockNonNumbers(this,event)" data-toggle="tooltip" data-placement="top" title="Phone Number" MaxLength="10" />
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ErrorMessage="Please Enter the Phone Number" ControlToValidate="txtCompanyPhNum" ValidationGroup="AddCompanyGroup" runat="server" Display="Dynamic" SetFocusOnError="true" ForeColor="red" />
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtCompanyEmailID" CssClass="form-control" runat="server" placeholder="Company EmailID" data-toggle="tooltip" data-placement="top" title="Company EmailID" />
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ErrorMessage="Please Enter the EmailID" ControlToValidate="txtCompanyEmailID" ValidationGroup="AddCompanyGroup" runat="server" Display="Dynamic" SetFocusOnError="true" ForeColor="red" />
                                <asp:RegularExpressionValidator Display="Dynamic" SetFocusOnError="true" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="AddCompanyGroup" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtCompanyEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                            </div>
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

    <div id="extruderLeft" class="{title:'Job Locations'}" style="padding: 0px;">
        <div class="form-group">
            <div class="form-inline">
                Job Position :
                <asp:DropDownList runat="server" ID="ddlShowVenue" CssClass="form-control" />
            </div>
        </div>
    </div>
</asp:Content>
