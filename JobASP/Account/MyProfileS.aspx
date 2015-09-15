<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyProfileS.aspx.cs" Inherits="JobASP.Account.MyProfileS" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function funcAlert() {
            document.getElementById("alertSucc").style.display = 'block';
        }
        function funcAlertDanger() {
            document.getElementById("alertDanger").style.display = 'block';
        }
        function funcAlertWrong() {
            document.getElementById("alertWrong").style.display = 'block';
        }
        $(document).ready(function () {
            $('#changePassword').on('shown.bs.modal', function () {
            });

            //  Wizard
            $('#wizardView').smartWizard({ transitionEffect: 'slideLeft', enableFinishButton: true, labelFinish: 'Edit', onFinish: onEditCallback });
            $('#wizard').smartWizard({ transitionEffect: 'slideLeft', onLeaveStep: leaveAStepCallback, onFinish: onFinishCallback });

            var prm = Sys.WebForms.PageRequestManager.getInstance();

            prm.add_endRequest(function () {
                $('#changePassword').on('shown.bs.modal', function () {
                });
                //  Wizard
                $('#wizardView').smartWizard({ transitionEffect: 'slideLeft', enableFinishButton: true, labelFinish: 'Edit', onFinish: onEditCallback });
                $('#wizard').smartWizard({ transitionEffect: 'slideLeft', onLeaveStep: leaveAStepCallback, onFinish: onFinishCallback });
            });

            function leaveAStepCallback(obj, context) {
                if (context.fromStep > context.toStep) {
                    return true;
                }
                return validateSteps(context.fromStep); // return false to stay on step and true to continue navigation 
            }
            function validateSteps(stepnumber) {
                var isStepValid = true;
                // validate step 1
                if (stepnumber == 1) {
                    var val = Page_ClientValidate('RegGroup1');
                    if (!val) {
                        //setError(stepnumber);
                        return false;
                    }
                    return true;
                }
                if (stepnumber == 2) {
                    var val = Page_ClientValidate('RegGroup2');
                    if (!val) {

                        return false;
                    }
                    return true;
                }
                if (stepnumber == 3) {
                    var val = Page_ClientValidate('RegGroup3');
                    if (!val) {

                        return false;
                    }
                    return true;
                }
                if (stepnumber == 4) {
                    var val = Page_ClientValidate('RegGroup3');
                    if (!val) {

                        return false;
                    }
                    return true;
                }

                // ...      
            }
            function onEditCallback()
            {
                document.getElementById("<%= btnEdit.ClientID%>").click();
                return true;
            }
            function onFinishCallback()
            {
                var val1 = Page_ClientValidate("RegGroup1");
                var val2 = Page_ClientValidate("RegGroup2");
                var val3 = Page_ClientValidate("RegGroup3");
                var val4 = Page_ClientValidate("RegGroup4");
                if (!val1 || !val2 || !val3 || !val4) {
                    return false;
                }
                else {
                    document.getElementById("<%= btnFinish.ClientID%>").click();
                    return true;
                }
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="ProfileSeeker.aspx">Home</a></li>
        <li class="active">My Profile</li>
    </ol>
    <div class="alert alert-success" style="display: none" id="alertSucc">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>Success!</strong> Your details has been Updated successfully.
    </div>
     <div class="alert alert-danger" style="display: none" id="alertDanger">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>Warning!</strong> Invalid Password.
    </div>
    <div class="alert alert-info" style="display: none" id="alertWrong">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>Info!</strong> Something went Wrong.
    </div>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <asp:Repeater runat="server" ID="rptProfileS">
                <ItemTemplate>
                    <div id="wizard" class="swMain">
                        <!-- Navigation Buttons -->
                        <ul>
                            <li><a href="#Personal">
                                <label class="stepNumber">1</label>
                                <span class="stepDesc">Personal<br />
                                    <small>Personal Information</small>
                                </span>
                            </a></li>
                            <li><a href="#Professional">
                                <label class="stepNumber">2</label>
                                <span class="stepDesc">Professional<br />
                                    <small>Professional Details</small>
                                </span>
                            </a></li>
                            <li><a href="#Educational">
                                <label class="stepNumber">3</label>
                                <span class="stepDesc">Educational<br />
                                    <small>Educational Details</small>
                                </span>
                            </a></li>
                            <li><a href="#General">
                                <label class="stepNumber">4</label>
                                <span class="stepDesc">General<br />
                                    <small>General Information</small>
                                </span>
                            </a></li>
                        </ul>

                        <div id="Personal">
                            <br />
                            <div class="row no-pl no-pr col-md-12">
                                <div class="form-horizontal  no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-2 control-label">Name :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline  form-group">
                                            <asp:TextBox runat="server" Text='<%#Eval("SeekerName") %>' CssClass="form-control" ID="txtName" Width="90%" ValidationGroup="RegGroup1" /><sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ValidationGroup="RegGroup1" ForeColor="red" ID="RequiredFieldValidator17" ErrorMessage="Name  is Required " ControlToValidate="txtName" runat="server" />
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12 no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-2 control-label">Last Name :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" Text='<%#Eval("SeekerLName") %>' CssClass="form-control" ID="txtLName" Width="90%" ValidationGroup="RegGroup1" /><sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup1" ID="RequiredFieldValidator2" ErrorMessage="Last Name is Required" ControlToValidate="txtLName" runat="server" />
                                    </div>
                                </div>


                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-2 control-label">Date Of Birth :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" CssClass="form-control" Text='<%#Eval("DOB","{0:MM/dd/yyyy}") %>' ReadOnly="false" onkeypress="return false;" onpaste="return false;" ViewStateMode="Enabled" ID="txtDOB" ValidationGroup="RegGroup1" AutoCompleteType="None" Width="70%" /><sup style="color: red">*</sup>
                                            <ajax:CalendarExtender ID="AjaxCalDOB" DefaultView="Years" runat="server" PopupButtonID="txtDOB" TargetControlID="txtDOB" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator3" ValidationGroup="RegGroup1" ForeColor="Red" ErrorMessage="Please Select Your Date of Birth" ControlToValidate="txtDOB" runat="server" />
                                        <asp:RangeValidator SetFocusOnError="true" Display="Dynamic" ValidationGroup="RegGroup1" ErrorMessage="Age should be Greaterthan 14 and Lessthan 60" ControlToValidate="txtDOB" runat="server" ForeColor="Red" Type="Date" ID="rngValDOB" />
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12 no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-2 control-label">Country :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group" style="padding-top: 5px">
                                            <%--<asp:Label Text='<%#Bind("Countries.CountryName") %>' CssClass="control-label" ID="lblrptCountry" runat="server" />--%>
                                            <asp:DropDownList ID="ddlCountry" CssClass="form-control" ValidationGroup="RegGroup1" Width="90%" runat="server" /><sup style="color: red">*</sup>
                                            <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator4" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12 no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-2 control-label">State :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group" style="padding-top: 5px">
                                            <%--<asp:Label Text='<%#Bind("States.StateName") %>' CssClass="control-label" ID="lblrptState" runat="server" />--%>
                                            <asp:DropDownList ID="ddlState" CssClass="form-control" Style="text-align: center" Width="90%" runat="server" ValidationGroup="RegGroup1" /><sup style="color: red">*</sup>
                                            <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator5" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select State" ControlToValidate="ddlState" runat="server" />
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12 no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-2 control-label">City :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group" style="padding-top: 5px">
                                            <%--<asp:Label Text='<%#Bind("Cities.CityName") %>' CssClass="control-label" ID="lblrptCity" runat="server" />--%>
                                            <asp:DropDownList ID="ddlCity" CssClass="form-control" Style="text-align: center" Width="90%" runat="server" ValidationGroup="RegGroup1" /><sup style="color: red">*</sup>
                                            <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator6" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select City" ControlToValidate="ddlCity" runat="server" />
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div id="Professional">
                            <br />
                            <div class="row col-md-12">
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-3 control-label">Industry :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" Text='<%#Eval("Industry") %>' CssClass="form-control" ID="txtIndustry" Width="92%" />
                                        </div>
                                    </div>
                                    <div class="col-md-4"></div>
                                </div>

                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-3 control-label">Primary Skill :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group" style="padding-top: 5px">
                                            <%--<asp:Label Text='<%#Bind("Skills.Skill") %>' CssClass="control-label" ID="Label1" runat="server" />--%>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSkillSet" Width="92%" ValidationGroup="RegGroup2" /><sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator7" Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup2" ErrorMessage="Please Select your Primary Skill" InitialValue="Select" ControlToValidate="ddlSkillSet" runat="server" />
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-3 control-label">Other Skills :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" Text='<%#Eval("SkillSet") %>' CssClass="form-control" onkeypress="return lettersWithCommaOnly(event);" Width="92%" ID="txtSkillList" /><br />
                                            Enter your other Skills Seperated by a comma(,)
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label Text="" ID="lblSkillSetErr" runat="server" />
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-3 control-label">Total Experience :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" ID="txtTotalExperience" ReadOnly="true" Text='<%#Eval("Experience") %>' CssClass="form-control" MaxLength="2" Width="75%" onkeypress="return blockNonNumbers(this,event)" ValidationGroup="RegGroup2" />
                                            Years<sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <%--<asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup2" ErrorMessage="Please enter your Total Experience" ID="rfvTotalExperience" ControlToValidate="txtTotalExperience" runat="server" />--%>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div id="Educational">
                            <br />
                            <div class="row col-md-12">
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-3 control-label">10<sup>th</sup> Percentage :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" MaxLength="3" Text='<%#Eval("TenthPercent") %>' CssClass="form-control" ValidationGroup="RegGroup3" onkeypress="return blockNonNumbers(this,event)" Width="80%" ID="txt10thPercent" />%<sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator8" ValidationGroup="RegGroup3" ErrorMessage="Please enter your 10th Percentage" ControlToValidate="txt10thPercent" runat="server" ForeColor="Red" />
                                        <asp:RangeValidator SetFocusOnError="true" Display="Dynamic" ID="RangeValidator1" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txt10thPercent" runat="server" MinimumValue="1" MaximumValue="100" Type="Integer" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-3 control-label">Inter Percentage :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" MaxLength="3" Text='<%#Eval("InterPercent") %>' CssClass="form-control" onkeypress="return blockNonNumbers(this,event)" Width="80%" ID="txtInterPercent" />%<sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator9" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Inter marks" ControlToValidate="txtInterPercent" runat="server" ForeColor="Red" />
                                        <asp:RangeValidator SetFocusOnError="true" Display="Dynamic" ID="RangeValidator2" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtInterPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                    </div>
                                </div>

                                <%--   <div class="form-horizontal col-md-12">
                            <div class="col-md-3"></div>
                            <div class="col-md-2 control-label">Graduation :</div>
                            <div class="col-md-4">
                                <div class="form-inline form-group">
                                    <asp:RadioButtonList runat="server" CssClass="table-condensed" Style="float: left" ID="rdoLstSelect" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Degree" Value="Degree" Selected="False" />
                                        <asp:ListItem Text="B.Tech" Value="B.Tech" />
                                    </asp:RadioButtonList>
                                    <span style="float: left; color: red;">*</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator10" ErrorMessage="Please select one option" ValidationGroup="RegGroup3" ForeColor="Red" ControlToValidate="rdoLstSelect" runat="server" />
                            </div>
                        </div>--%>
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-3 control-label">Grad Percentage :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" MaxLength="3" Text='<%#Eval("GraduationPercent") %>' CssClass="form-control" onkeypress="return blockNonNumbers(this,event)" ID="txtGradPercent" ValidationGroup="RegGroup3" Width="80%" />%<sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator11" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Graduation marks" ControlToValidate="txtGradPercent" runat="server" ForeColor="Red" />
                                        <asp:RangeValidator SetFocusOnError="true" Display="Dynamic" ID="RangeValidator3" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtGradPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-3 control-label">P.G. Percentage :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" CssClass="form-control" Text='<%#Eval("PGPercent") %>' onkeypress="return blockNonNumbers(this,event)" MaxLength="3" ID="txtPGPercent" Width="80%" ValidationGroup="RegGroup3" />%<sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator12" Display="Dynamic" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Graduation marks" ControlToValidate="txtPGPercent" runat="server" ForeColor="Red" />
                                        <asp:RangeValidator SetFocusOnError="true" ID="RangeValidator4" Display="Dynamic" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtPGPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="General">
                            <br />
                            <div class="row col-md-12">
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-2 control-label">Mobile :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" ID="txtPhone" Text='<%#Eval("Phone") %>' Width="95%" CssClass="form-control" ValidationGroup="RegGroup4" TextMode="Phone" onkeypress="return blockNonNumbers(this,event)" MaxLength="10" /><sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup4" ID="RequiredFieldValidator13" ErrorMessage="Please Enter Phone Number" ControlToValidate="txtPhone" runat="server" />
                                    </div>
                                </div>
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-2 control-label">Email ID :</div>
                                    <div class="col-md-4">
                                        <div class="form-inline form-group">
                                            <asp:TextBox runat="server" TextMode="Email" ReadOnly="true" Text='<%#Eval("EmailId") %>' Width="95%" CssClass="form-control" ValidationGroup="RegGroup4" ID="txtEmailID" AutoCompleteType="None" autocomplete="off" /><sup style="color: red">*</sup>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <%-- <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup4" ID="RequiredFieldValidator14" ErrorMessage="Please Enter Email ID" ControlToValidate="txtEmailID" runat="server" />
                                <asp:RegularExpressionValidator SetFocusOnError="true" Display="Dynamic" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="RegGroup4" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />--%>
                                    </div>
                                </div>
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-4 control-label">To Change Password :</div>
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#changePassword">Click Here</button>
                                    </div>
                                    <div class="col-md-3"></div>
                                </div>
                            </div>
                        </div>
                        <%-- </div>--%>
                        <%--</div>--%>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <div class="f-r">
                        <div class="col-md-9 swMain">
                            <asp:Button ID="btnrptCancel" Text="Cancel" OnClick="btnrptCancel_Click" CssClass="buttonFinish" runat="server" />
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
            <asp:Repeater runat="server" ID="rptViewDetails">
                <ItemTemplate>
                    <div id="wizardView" class="swMain">
                        <!-- Navigation Buttons -->
                        <ul>
                            <li><a href="#Personal">
                                <label class="stepNumber">1</label>
                                <span class="stepDesc">Personal<br />
                                    <small>Personal Information</small>
                                </span>
                            </a></li>
                            <li><a href="#Professional">
                                <label class="stepNumber">2</label>
                                <span class="stepDesc">Professional<br />
                                    <small>Professional Details</small>
                                </span>
                            </a></li>
                            <li><a href="#Educational">
                                <label class="stepNumber">3</label>
                                <span class="stepDesc">Educational<br />
                                    <small>Educational Details</small>
                                </span>
                            </a></li>
                            <li><a href="#General">
                                <label class="stepNumber">4</label>
                                <span class="stepDesc">General<br />
                                    <small>General Information</small>
                                </span>
                            </a></li>
                        </ul>
                        <!-- Content -->
                        <div id="Personal">
                            <br />
                            <div class="row no-pl no-pr col-md-12">
                                <div class="form-horizontal  no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Name :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline  form-group">
                                            <asp:Label ID="Label4" runat="server" Text='<%#Eval("SeekerName") %>' CssClass="control-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12 no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Last Name :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label5" Text='<%#Eval("SeekerLName") %>' runat="server" CssClass="control-label" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>
                                <div class="form-horizontal col-md-12 no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Country :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group" style="padding-top: 5px">
                                            <asp:Label Text='<%#Bind("Countries.CountryName") %>' CssClass="control-label" ID="lblrptCountry" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12 no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">State :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group" style="padding-top: 5px">
                                            <asp:Label Text='<%#Bind("States.StateName") %>' CssClass="control-label" ID="lblrptState" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12 no-pl no-pr">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">City :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group" style="padding-top: 5px">
                                            <asp:Label Text='<%#Bind("Cities.CityName") %>' CssClass="control-label" ID="lblrptCity" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div id="Professional">
                            <br />
                            <div class="row col-md-12">
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Industry :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label6" Text='<%#Eval("Industry") %>' CssClass="control-label" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3"></div>
                                </div>

                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Primary Skill :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group" style="padding-top: 5px">
                                            <asp:Label Text='<%#Bind("Skills.Skill") %>' CssClass="control-label" ID="Label1" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Other Skills :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label7" Text='<%#Eval("SkillSet") %>' CssClass="control-label" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Total Experience :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label8" Text='<%#Eval("Experience") %>' CssClass="control-label" runat="server" />
                                            Years
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div id="Educational">
                            <br />
                            <div class="row col-md-12">
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">10<sup>th</sup> Percentage :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label9" Text='<%#Eval("TenthPercent") %>' CssClass="control-label" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Inter Percentage :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label10" Text='<%#Eval("InterPercent") %>' CssClass="control-label" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>

                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Grad Percentage :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label11" Text='<%#Eval("GraduationPercent") %>' CssClass="control-label" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">P.G. Percentage :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label12" Text='<%#Eval("PGPercent") %>' CssClass="control-label" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div id="General">
                            <br />
                            <div class="row col-md-12">
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Mobile :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label13" Text='<%#Eval("Phone") %>' CssClass="control-label" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>
                                <div class="form-horizontal col-md-12">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 control-label">Email ID :</div>
                                    <div class="col-md-3">
                                        <div class="form-inline form-group">
                                            <asp:Label ID="Label14" Text='<%#Eval("EmailId") %>' runat="server" CssClass="control-label" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>
                                <%-- <div class="form-horizontal col-md-12">
                            <div class="col-md-1"></div>
                            <div class="col-md-4 control-label">To Change Password :</div>
                            <div class="col-md-4">
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#changePassword">Click Here</button>
                            </div>
                            <div class="col-md-3"></div>
                        </div>--%>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
             <div class="modal fade" id="changePassword">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Change Password</h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12 form-group">
                            <div class="col-md-4">
                                <asp:Label ID="Label2" Text="Current Password :" CssClass="control-label" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtChngCurrPwd" />
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ErrorMessage="Enter Current Password" ControlToValidate="txtChngCurrPwd" ForeColor="Red" ValidationGroup="ChngPwdGroup" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-4">
                                <asp:Label ID="Label3" Text="New Password :" CssClass="control-label" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtChngNewPwd" />
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" SetFocusOnError="true" ErrorMessage="Enter New Password" ControlToValidate="txtChngNewPwd" ForeColor="Red" runat="server" ValidationGroup="ChngPwdGroup" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-4">
                                <asp:Label ID="Label15" Text="Re-enter new Password :" CssClass="control-label" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtChngreNewPwd" />
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator14" Display="Dynamic" ErrorMessage="Enter New Password" ControlToValidate="txtChngreNewPwd" ForeColor="Red" runat="server" ValidationGroup="ChngPwdGroup" />
                                <asp:CompareValidator SetFocusOnError="true" ID="CompareValidator1" ErrorMessage="Password Mis-match" ForeColor="Red" ValidationGroup="ChngPwdGroup" ControlToValidate="txtChngreNewPwd" Display="Dynamic" ControlToCompare="txtChngNewPwd" runat="server" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button Text="Ok" CssClass="btn btn-primary" ValidationGroup="ChngPwdGroup" ID="btnSeekerChngPwd" OnClick="btnSeekerChngPwd_Click" runat="server" />
                    <asp:Button Text="Cancel" runat="server" class="btn btn-secondary" CausesValidation="false" data-dismiss="modal" ID="Button2" ValidationGroup="ChngPwdGroup" OnClientClick="Page_ValidationSummariesReset();" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
            <div class="hidden">
                <asp:Button Text="" Style="display: none" ID="btnEdit" OnClick="btnEdit_Click" runat="server" />
                <asp:Button Text="" Style="display: none" ID="btnFinish" OnClick="btnFinish_Click" runat="server" />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

   


    <!-- End SmartWizard Content -->


</asp:Content>
