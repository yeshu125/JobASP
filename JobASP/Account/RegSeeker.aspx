<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="RegSeeker.aspx.cs" Inherits="JobASP.RegSeeker" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ProHeadContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            //  Wizard
            $('#wizard').smartWizard({ transitionEffect: 'slide', onLeaveStep: leaveAStepCallback, onFinish: onFinishCallback });


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
            //function setError(stepnumber) {
            //    $('#wizard').smartWizard('setError', { stepnum: stepnumber, iserror: true });
            //}

            function onFinishCallback() {
                var val = Page_ClientValidate();
                if (!val) {
                    return false;
                }
                else {
                    //$('form').submit();
                    document.getElementById('<%=btnSeekerSubmit.ClientID%>').click();
                    return true;
                }

                var dataobj = [];
                dataobj[0] = $('#' + '<%=txtName.ClientID%>').val();
                dataobj[1] = $('#' + '<%=txtLName.ClientID%>').val();
                dataobj[2] = $('#' + '<%=ddlGender.ClientID%> option:selected').text();
                dataobj[3] = $('#' + '<%=txtDOB.ClientID%>').val();
                dataobj[4] = $('#' + '<%=ddlCountry.ClientID%> option:selected').val();
                dataobj[5] = $('#' + '<%=ddlState.ClientID%> option:selected').val();
                dataobj[6] = $('#' + '<%=ddlCity.ClientID%> option:selected').val();
                dataobj[7] = $('#' + '<%=txtIndustry.ClientID%>').val();
                dataobj[8] = $('#' + '<%=ddlSkillSet.ClientID%> option:selected').val();
                dataobj[9] = $('#' + '<%=txtSkillList.ClientID%>').val();
                dataobj[10] = $('#' + '<%=txtTotalExperience.ClientID%>').val();
                dataobj[11] = $('#' + '<%=txt10thPercent.ClientID%>').val();
                dataobj[12] = $('#' + '<%=txtInterPercent.ClientID%>').val();
                dataobj[13] = $('#' + '<%=rdoLstSelect.ClientID%> input:checked').val();
                dataobj[14] = $('#' + '<%=txtGradPercent.ClientID%>').val();
                dataobj[15] = $('#' + '<%=txtPGPercent.ClientID%>').val();
                dataobj[16] = $('#' + '<%=txtPhNum.ClientID%>').val();
                dataobj[17] = $('#' + '<%=txtEmailID.ClientID%>').val();
                dataobj[18] = $('#' + '<%=txtPassword.ClientID%>').val();

                //$.ajax({
                //    type: "POST",
                //    url: "RegSeeker.aspx/CollectData",
                //    contentType: "application/json; charset=utf-8",
                //    data: JSON.stringify({ 'obj': dataobj }),
                //    success: SuccessTestService,
                //    dataType: "json",
                //    failure: ajaxCallFailed
                //});
                //return true;

            }
            function SuccessTestService(responce) {
                alert("Success");
            }
            function ajaxCallFailed(error) {
                alert('error: ' + error);
            }
        });
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProMainContent" runat="server">
   <%-- <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
    <asp:SiteMapPath ID="SiteMap1" runat="server"></asp:SiteMapPath>--%>
     <ol class="breadcrumb">
         <li> <a href="Default.aspx">Home</a></li>
        <li class="active">Seeker Registration</li>
    </ol>
    <div class="container">
        <div class="row">
            <table align="center" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>&nbsp;
                       <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server"  DisplayMode="BulletList" ForeColor="Red" ShowSummary="true" />--%>
                        <asp:Label Text="" ID="lblRegErr" runat="server" />
                        <h3>Seeker Registration</h3>

                        <!-- Smart Wizard wizard2-->
                        <div id="wizard" class="swMain">
                            <ul>
                                <li><a href="#step-1">
                                    <label class="stepNumber">1</label>
                                    <span class="stepDesc">Personal<br />
                                        <small>Personal Information</small>
                                    </span>
                                </a></li>
                                <li><a href="#step-2">
                                    <label class="stepNumber">2</label>
                                    <span class="stepDesc">Professional<br />
                                        <small>Professional Details</small>
                                    </span>
                                </a></li>
                                <li><a href="#step-3">
                                    <label class="stepNumber">3</label>
                                    <span class="stepDesc">Educational<br />
                                        <small>Educational Details</small>
                                    </span>
                                </a></li>
                                <li><a href="#step-4">
                                    <label class="stepNumber">4</label>
                                    <span class="stepDesc">General<br />
                                        <small>General Information</small>
                                    </span>
                                </a></li>
                            </ul>
                            <div id="step-1">
                                <h2 class="StepTitle">Personal Information</h2>
                                <br />
                                <div class="row">
                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Name :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtName" Width="90%" ValidationGroup="RegGroup1" /><sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ValidationGroup="RegGroup1" ForeColor="red" ID="RequiredFieldValidator17" ErrorMessage="Name  is Required " ControlToValidate="txtName" runat="server" />
                                        </div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Last Name :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtLName" Width="90%" ValidationGroup="RegGroup1" /><sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup1" ID="RequiredFieldValidator2" ErrorMessage="Last Name is Required" ControlToValidate="txtLName" runat="server" />
                                        </div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Gender :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlGender" Width="90%" align="center" ValidationGroup="RegGroup1">
                                                    <asp:ListItem Text="Male" Enabled="true" Value="0" />
                                                    <asp:ListItem Text="Female" Value="1" />
                                                </asp:DropDownList><sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Date Of Birth :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" CssClass="form-control" ReadOnly="false" onkeypress="return false;" onpaste="return false;" ViewStateMode="Enabled" ID="txtDOB" ValidationGroup="RegGroup1" AutoCompleteType="None" Width="90%" /><sup style="color: red">*</sup>
                                                <ajax:CalendarExtender ID="AjaxCalDOB" DefaultView="Years" runat="server" PopupButtonID="txtDOB" TargetControlID="txtDOB" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator3" ValidationGroup="RegGroup1" ForeColor="Red" ErrorMessage="Please Select Your Date of Birth" ControlToValidate="txtDOB" runat="server" />
                                            <asp:RangeValidator SetFocusOnError="true" Display="Dynamic" ValidationGroup="RegGroup1" ErrorMessage="Age should be Greaterthan 14 and Lessthan 60" ControlToValidate="txtDOB" runat="server" ForeColor="Red" Type="Date" ID="rngValDOB" />
                                        </div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Country :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:DropDownList ID="ddlCountry" CssClass="form-control" ValidationGroup="RegGroup1" Width="90%" runat="server" /><sup style="color: red">*</sup>
                                                <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator4" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                        </div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">State :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:DropDownList ID="ddlState" CssClass="form-control" Style="text-align: center" Width="90%" runat="server" ValidationGroup="RegGroup1" /><sup style="color: red">*</sup>
                                                <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator5" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select State" ControlToValidate="ddlState" runat="server" />
                                        </div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">City :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
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
                            <div id="step-2">
                                <h2 class="StepTitle">Professional Details</h2>
                                <br />
                                <div class="row">
                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Industry :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtIndustry" Width="92%" />
                                            </div>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Primary Skill :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSkillSet" Width="92%" ValidationGroup="RegGroup2" /><sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator7" Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup2" ErrorMessage="Please Select your Primary Skill" InitialValue="Select" ControlToValidate="ddlSkillSet" runat="server" />
                                        </div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Other Skills :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" CssClass="form-control" onkeypress="return lettersWithCommaOnly(event);" Width="92%" ID="txtSkillList" /><br />
                                                Enter your other Skills Seperated by a comma(,)
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Label Text="" ID="lblSkillSetErr" runat="server" />
                                        </div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Total Experience :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" ID="txtTotalExperience" CssClass="form-control" MaxLength="2" Width="75%" onkeypress="return blockNonNumbers(this,event)" ValidationGroup="RegGroup2" />
                                                Years<sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup2" ErrorMessage="Please enter your Total Experience" ID="rfvTotalExperience" ControlToValidate="txtTotalExperience" runat="server" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div id="step-3">
                                <h2 class="StepTitle">Educational Details</h2>
                                <br />
                                <div class="row">

                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">10<sup>th</sup> Percentage :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" MaxLength="3" CssClass="form-control" ValidationGroup="RegGroup3" onkeypress="return blockNonNumbers(this,event)" Width="80%" ID="txt10thPercent" />%<sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator8" ValidationGroup="RegGroup3" ErrorMessage="Please enter your 10th Percentage" ControlToValidate="txt10thPercent" runat="server" ForeColor="Red" />
                                            <asp:RangeValidator SetFocusOnError="true" Display="Dynamic" ID="RangeValidator1" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txt10thPercent" runat="server" MinimumValue="1" MaximumValue="100" Type="Integer" ForeColor="Red" />
                                        </div>
                                    </div>
                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Inter Percentage :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" MaxLength="3" CssClass="form-control" onkeypress="return blockNonNumbers(this,event)" Width="80%" ID="txtInterPercent" />%<sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator9" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Inter marks" ControlToValidate="txtInterPercent" runat="server" ForeColor="Red" />
                                            <asp:RangeValidator SetFocusOnError="true" Display="Dynamic" ID="RangeValidator2" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtInterPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                        </div>
                                    </div>

                                    <div class="form-horizontal col-md-12">
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
                                    </div>
                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Graduation Percentage :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" MaxLength="3" CssClass="form-control" onkeypress="return blockNonNumbers(this,event)" ID="txtGradPercent" ValidationGroup="RegGroup3" Width="80%" />%<sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ID="RequiredFieldValidator11" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Graduation marks" ControlToValidate="txtGradPercent" runat="server" ForeColor="Red" />
                                            <asp:RangeValidator SetFocusOnError="true" Display="Dynamic" ID="RangeValidator3" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtGradPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                        </div>
                                    </div>
                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">P.G. Percentage :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" CssClass="form-control" onkeypress="return blockNonNumbers(this,event)" MaxLength="3" ID="txtPGPercent" Width="80%" ValidationGroup="RegGroup3" />%<sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator12" Display="Dynamic" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Graduation marks" ControlToValidate="txtPGPercent" runat="server" ForeColor="Red" />
                                            <asp:RangeValidator SetFocusOnError="true" ID="RangeValidator4" Display="Dynamic" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtPGPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div id="step-4">
                                <h2 class="StepTitle">General Information</h2>
                                <br />
                                <div class="row">
                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Mobile :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" ID="txtPhNum" CssClass="form-control" ValidationGroup="RegGroup4" TextMode="Phone" onkeypress="return blockNonNumbers(this,event)" MaxLength="10" /><sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup4" ID="RequiredFieldValidator13" ErrorMessage="Please Enter Phone Number" ControlToValidate="txtPhNum" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Email ID :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ValidationGroup="RegGroup4" ID="txtEmailID" AutoCompleteType="None" autocomplete="off" /><sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup4" ID="RequiredFieldValidator14" ErrorMessage="Please Enter Email ID" ControlToValidate="txtEmailID" runat="server" />
                                            <asp:RegularExpressionValidator SetFocusOnError="true" Display="Dynamic" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="RegGroup4" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Password :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ValidationGroup="RegGroup4" AutoCompleteType="None" ID="txtPassword" autocomplete="return false" /><sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator15" ForeColor="red" ValidationGroup="RegGroup4" Display="Dynamic" ErrorMessage="Please enter a Password" ControlToValidate="txtPassword" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-horizontal col-md-12">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-2 control-label">Confirm Password :</div>
                                        <div class="col-md-4">
                                            <div class="form-inline form-group">
                                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ValidationGroup="RegGroup4" AutoCompleteType="None" ID="txtConfirmPassword" /><sup style="color: red">*</sup>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator16" ForeColor="red" ValidationGroup="RegGroup4" ErrorMessage="Please enter your Password" Display="Dynamic" ControlToValidate="txtConfirmPassword" runat="server" />
                                            <asp:CompareValidator SetFocusOnError="true" ID="CompareValidator1" ErrorMessage="Password MisMatch" ForeColor="Red" ValidationGroup="RegGroup4" ControlToValidate="txtConfirmPassword" Display="Dynamic" ControlToCompare="txtPassword" runat="server" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- End SmartWizard Content 2 -->
                        <asp:Button runat="server" ID="btnSeekerSubmit" UseSubmitBehavior="true" OnClick="btnSeekerSubmit_Click" Style="display: none;" Visible="true" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
