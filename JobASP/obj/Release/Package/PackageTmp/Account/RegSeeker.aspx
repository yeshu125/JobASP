<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="RegSeeker.aspx.cs" Inherits="JobASP.RegSeeker" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ProHeadContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            //  Wizard
            $('#wizard').smartWizard({ transitionEffect: 'slide', onFinish: onFinishCallback });
            function onFinishCallback() {
                var val = Page_ClientValidate();
                if (!val) {
                    return false;
                }
                var dataobj = [];
                dataobj[0] = $('#' + '<%=txtName.ClientID%>').val();
                dataobj[1] = $('#' + '<%=txtLName.ClientID%>').val();
                dataobj[2] = $('#' + '<%=ddlGender.ClientID%> option:selected').text();
                dataobj[3] = $('#' + '<%=txtDOB.ClientID%>').val();
                dataobj[4] = $('#' + '<%=ddlCountry.ClientID%> option:selected').text();
                dataobj[5] = $('#' + '<%=ddlState.ClientID%> option:selected').text();
                dataobj[6] = $('#' + '<%=ddlCity.ClientID%> option:selected').text();
                dataobj[7] = $('#' + '<%=txtIndustry.ClientID%>').val();
                dataobj[8] = $('#' + '<%=ddlSkillSet.ClientID%> option:selected').text();
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

                $.ajax({
                    type: "POST",
                    url: "RegSeeker.aspx/CollectData",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ 'obj': dataobj }),
                    success: SuccessTestService,
                    dataType: "json",
                    failure: ajaxCallFailed
                });
                return true;
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
    <div class="demoHead">
    </div>
    <div class="container">
        <div class="row">
            <table align="center" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>&nbsp;
                       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="RegGroup1" DisplayMode="BulletList" ForeColor="Red" ShowSummary="true" />
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
                                <table width="100%" cellpadding="2" class="table-hover table" cellspacing="10" border="0">
                                    <tr>
                                        <td width="15%"></td>
                                        <td width="20%">Name</td>
                                        <td width="30%">
                                            <asp:TextBox runat="server" ID="txtName" Width="90%" /><sup style="color:red">*</sup></td>
                                        <td width="35%">
                                            <asp:RequiredFieldValidator Display="None" ValidationGroup="RegGroup1" ForeColor="red" ID="RequiredFieldValidator1" ErrorMessage="Name  is Required " ControlToValidate="txtName" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>Last Name</td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtLName" Width="90%" /><sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ForeColor="red" ValidationGroup="RegGroup1" ID="RequiredFieldValidator2" ErrorMessage="Last Name is Required" ControlToValidate="txtLName" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>Gender</td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="ddlGender" Width="91%" CssClass="CssDDL" align="center">
                                                <asp:ListItem Text="Male" Enabled="true" Value="0" />
                                                <asp:ListItem Text="Female" Value="1" />
                                            </asp:DropDownList></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>Date Of Birth
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ReadOnly="false" onkeypress="return false;" onpaste="return false;" ViewStateMode="Enabled" ID="txtDOB" ValidationGroup="RegGroup1" AutoCompleteType="None" Width="90%" /><sup style="color:red">*</sup>
                                            <ajax:CalendarExtender ID="AjaxCalDOB" DefaultView="Years" runat="server" PopupButtonID="txtDOB" TargetControlID="txtDOB" />
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" ValidationGroup="RegGroup1" ForeColor="Red" ErrorMessage="Please Select Your Date of Birth" ControlToValidate="txtDOB" runat="server" />
                                            <asp:RangeValidator Display="None" ErrorMessage="Age should be Greaterthan 14 and Lessthan 60" ControlToValidate="txtDOB" runat="server" ForeColor="Red" Type="Date" ID="rngValDOB" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>Country</td>
                                        <td>
                                            <asp:DropDownList ID="ddlCountry" ValidationGroup="RegGroup1" CssClass="CssDDL" Width="92%" runat="server" /><sup style="color:red">*</sup>
                                            <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>State</td>
                                        <td>
                                            <asp:DropDownList ID="ddlState" Style="text-align: center" Width="92%" CssClass="CssDDL" runat="server" ValidationGroup="RegGroup1" /><sup style="color:red">*</sup>
                                            <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select State" ControlToValidate="ddlState" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>City</td>
                                        <td>
                                            <asp:DropDownList ID="ddlCity" Style="text-align: center" CssClass="CssDDL" Width="92%" runat="server" ValidationGroup="RegGroup1" /><sup style="color:red">*</sup>
                                            <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select City" ControlToValidate="ddlCity" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="step-2">
                                <h2 class="StepTitle">Professional Details</h2>
                                <table width="100%" align="center" cellpadding="0" class="table table-striped" style="text-align: left;" cellspacing="10" border="0">
                                    <tr align="center">
                                        <td></td>
                                        <td>Industry
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtIndustry" Width="92%" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr align="center">
                                        <td width="15%"></td>
                                        <td width="20%">Primary Skill
                                        </td>
                                        <td width="35%">
                                            <asp:DropDownList runat="server" ID="ddlSkillSet" Width="92%" ValidationGroup="RegGroup2" /><sup style="color:red">*</sup>
                                        </td>
                                        <td width="30%">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="None" ForeColor="red" ValidationGroup="RegGroup2" ErrorMessage="Please Select your Primary Skill" InitialValue="Select" ControlToValidate="ddlSkillSet" runat="server" />
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td width="15%"></td>
                                        <td width="20%">Other Skills
                                        </td>
                                        <td width="35%">
                                            <asp:TextBox runat="server" onkeypress="return lettersWithCommaOnly(event);" Width="92%" ID="txtSkillList" /><br />
                                            Enter your other Skills Seperated by a comma(,)
                                        </td>
                                        <td width="30%">
                                            <asp:Label Text="" ID="lblSkillSetErr" runat="server" />
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td></td>
                                        <td>Total Experience
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtTotalExperience" MaxLength="2" Width="90%" onkeypress="return blockNonNumbers(this,event)" ValidationGroup="RegGroup2" />
                                            Months<sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ForeColor="red" ValidationGroup="RegGroup2" ErrorMessage="Please enter your Total Experience" ID="rfvTotalExperience" ControlToValidate="txtTotalExperience" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="step-3">
                                <h2 class="StepTitle">Educational Details</h2>
                                <table width="100%" align="center" cellpadding="0" class="table table-striped" cellspacing="10" border="0">
                                    <tr>
                                        <td width="15%"></td>
                                        <td width="30%">10<sup>th</sup> Percentage:</td>
                                        <td width="25%">
                                            <asp:TextBox runat="server" MaxLength="3" onkeypress="return blockNonNumbers(this,event)" Width="80%" ID="txt10thPercent" />%<sup style="color:red">*</sup>
                                        </td>
                                        <td width="30%">
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" ValidationGroup="RegGroup3" ErrorMessage="Please enter your 10th Percentage" ControlToValidate="txt10thPercent" runat="server" ForeColor="Red" />
                                            <asp:RangeValidator Display="None" ID="RangeValidator1" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txt10thPercent" runat="server" MinimumValue="1" MaximumValue="100" Type="Integer" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>Inter Percentage:</td>
                                        <td>
                                            <asp:TextBox runat="server" MaxLength="3" onkeypress="return blockNonNumbers(this,event)" Width="80%" ID="txtInterPercent" />%<sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator9" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Inter marks" ControlToValidate="txtInterPercent" runat="server" ForeColor="Red" />
                                            <asp:RangeValidator Display="None" ID="RangeValidator2" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtInterPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>Graduation :</td>
                                        <td>
                                            <asp:RadioButtonList runat="server" ID="rdoLstSelect" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="Degree" Value="Degree" Selected="False" />
                                                <asp:ListItem Text="B.Tech" Value="B.Tech" />
                                            </asp:RadioButtonList><sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator10" ErrorMessage="Please select one option" ValidationGroup="RegGroup3" ForeColor="Red" ControlToValidate="rdoLstSelect" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>Graduation Percentage :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" MaxLength="3" onkeypress="return blockNonNumbers(this,event)" ID="txtGradPercent" ValidationGroup="RegGroup3" Width="80%" />%<sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator11" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Graduation marks" ControlToValidate="txtGradPercent" runat="server" ForeColor="Red" />
                                            <asp:RangeValidator Display="None" ID="RangeValidator3" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtGradPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>P.G. Percentage :
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" onkeypress="return blockNonNumbers(this,event)" MaxLength="3" ID="txtPGPercent" Width="80%" ValidationGroup="RegGroup3" />%<sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" Display="none" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Graduation marks" ControlToValidate="txtPGPercent" runat="server" ForeColor="Red" />
                                            <asp:RangeValidator ID="RangeValidator4" Display="none" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtPGPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                        </td>
                                    </tr>

                                </table>
                            </div>
                            <div id="step-4">
                                <h2 class="StepTitle">General Information</h2>
                                <table width="100%" align="center" cellpadding="0" class="table table-striped" style="text-align: left;" cellspacing="10" border="0">
                                    <tr align="center">
                                        <td></td>
                                        <td>Mobile</td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtPhNum" ValidationGroup="RegGroup" TextMode="Phone" onkeypress="return blockNonNumbers(this,event)" MaxLength="10" /><sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ForeColor="red" Display="None" ValidationGroup="RegGroup" ID="RequiredFieldValidator13" ErrorMessage="Please Enter Phone Number" ControlToValidate="txtPhNum" runat="server" />
                                            <%--<asp:RangeValidator ID="RangeValidator5"  runat="server" ControlToValidate="txtPhNum" ValidationGroup="RegGroup" ErrorMessage="Please Enter 10 Digits Only" MaximumValue="9999999999" MinimumValue="7000000000" Type="Integer"  Display="None"></asp:RangeValidator>--%>
                                        </td>
                                    </tr>

                                    <tr align="center">
                                        <td></td>
                                        <td>Email ID</td>
                                        <td>
                                            <asp:TextBox runat="server" TextMode="Email" ValidationGroup="RegGroup" ID="txtEmailID" AutoCompleteType="None" autocomplete="off" /><sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator Display="None" ForeColor="red" ValidationGroup="RegGroup" ID="RequiredFieldValidator14" ErrorMessage="Please Enter Email ID" ControlToValidate="txtEmailID" runat="server" />
                                            <asp:RegularExpressionValidator Display="None" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="RegGroup" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td></td>
                                        <td>Password
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" TextMode="Password" ValidationGroup="RegGroup" AutoCompleteType="None" ID="txtPassword" autocomplete="return false" /><sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ForeColor="red" ValidationGroup="RegGroup" Display="None" ErrorMessage="Please enter a Password" ControlToValidate="txtPassword" runat="server" />
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td></td>
                                        <td>Confirm Password
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" TextMode="Password" ValidationGroup="RegGroup" AutoCompleteType="None" ID="txtConfirmPassword" /><sup style="color:red">*</sup>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ForeColor="red" ValidationGroup="RegGroup" ErrorMessage="Please enter your Password" Display="None" ControlToValidate="txtConfirmPassword" runat="server" />
                                            <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Password MisMatch" ForeColor="Red" ValidationGroup="RegGroup" ControlToValidate="txtConfirmPassword" Display="None" ControlToCompare="txtPassword" runat="server" />

                                        </td>
                                    </tr>
                                    <%-- <tr align="center">
                                    <td></td>
                                    <td>Resume
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="fuSeekerResume" runat="server" ValidationGroup="UploadGroup" />
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ValidationGroup="UploadGroup" Display="none" ErrorMessage="Please upload only PDF Files" ValidationExpression="[a-zA-Z\\].*(.pdf|.PDF)$" ControlToValidate="fuSeekerResume" runat="server" />
                                    </td>
                                </tr>--%>
                                </table>
                            </div>
                        </div>
                        <!-- End SmartWizard Content 2 -->

                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
