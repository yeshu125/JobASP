<%@ Page Title="Register" Language="C#" MasterPageFile="~/ProfileMaster.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="JobASP.Register" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ProMainContent">
    <%--<asp:SiteMapDataSource ID="SiteMapDataSource2" runat="server" />
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>--%>
     <ol class="breadcrumb">
         <li> <a href="Default.aspx">Home</a></li>
        <li class="active">Employeer Registration</li>
    </ol>
    <table>
        <tr>
            <td width="75%">
                <hgroup class="title">
                    <h2><%: Title %>.</h2>
                </hgroup>
            </td>
        </tr>
    </table>

    <div class="text-justify">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
             
                <div class="container">
                    <div class="col-md-10">
                        <h2>Use the form below to create a new account.</h2>
                        <div class="col-md-1"></div>
                        <div class="col-md-11">

                            <table width="100%" align="center" class="col-xs-pull-9 table-condensed">
                                <tr>
                                    <td colspan="3">
                                        <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="RegGroup" DisplayMode="List" ForeColor="Red" ShowSummary="true" />--%>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="25%">Name</td>
                                    <td width="35%">
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="First Name" Width="90%" onkeypress="return lettersWithSpaceOnly(event);" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td width="40%">
                                        <asp:RequiredFieldValidator ValidationGroup="RegGroup" Display="Dynamic" ForeColor="red" ID="RequiredFieldValidator1" ErrorMessage="Name  is Required " ControlToValidate="txtName" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Last Name</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" ID="txtLName" CssClass="form-control" placeholder="Last Name" onkeypress="return lettersOnly(event);" Width="90%" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ID="RequiredFieldValidator2" ErrorMessage="Last Name is Required" ControlToValidate="txtLName" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:DropDownList runat="server" ID="ddlGender" Width="90%" CssClass="form-control" align="center">
                                                <asp:ListItem Text="Male" Enabled="true" Value="0" />
                                                <asp:ListItem Text="Female" Value="1" />
                                            </asp:DropDownList><sup style="color: red">*</sup>
                                        </div>
                                    </td>

                                    <td></td>
                                </tr>
                                <tr>
                                    <td>SkillSet
                                    </td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:DropDownList runat="server" ID="ddlSkillSet" CssClass="form-control" Width="90%" ValidationGroup="RegGroup" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Designation</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtDesignation" Width="90%" placeholder="Designation" ValidationGroup="RegGroup" onkeypress="return lettersWithSpaceDot(event);" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ValidationGroup="RegGroup" ID="RequiredFieldValidator3" ErrorMessage=" Designation to be entered" ControlToValidate="txtDesignation" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Company</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtCompany" Width="90%" placeholder="Company" ValidationGroup="RegGroup" onkeypress="return lettersWithSpaceOnly(event);" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ErrorMessage="Please enter your Company Name" ID="rfvCompanyName" ControlToValidate="txtCompany" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Contact Title</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" Width="90%" ID="txtContactTitle" CssClass="form-control" placeholder="Contact Title" onkeypress="return lettersOnly(event);" />
                                        </div>

                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" Rows="4" Placeholder="Current location" Width="90%" TextMode="MultiLine" />
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>


                                <tr>
                                    <td>Country</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:DropDownList ID="ddlCountry" ValidationGroup="RegGroup" CssClass="form-control" Width="90%" runat="server" /><sup style="color: red">*</sup>
                                            <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>State</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:DropDownList ID="ddlState" Style="text-align: center" Width="90%" CssClass="form-control" runat="server" ValidationGroup="RegGroup" /><sup style="color: red">*</sup>
                                            <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ErrorMessage="Please Select State" ControlToValidate="ddlState" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>City</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:DropDownList ID="ddlCity" Style="text-align: center" CssClass="form-control" Width="90%" runat="server" ValidationGroup="RegGroup" /><sup style="color: red">*</sup>
                                            <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ErrorMessage="Please Select City" ControlToValidate="ddlCity" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Postal Code</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" placeholder="Postal code" CssClass="form-control" ID="txtPostalCode" Width="90%" ValidationGroup="RegGroup" onkeypress="return blockNonNumbers(this,event)" MaxLength="6" TextMode="Phone" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ID="RequiredFieldValidator7" ErrorMessage="Please Enter Postal Code" ControlToValidate="txtPostalCode" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mobile</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" ID="txtPhNum" placeholder="Mobile Number" CssClass="form-control" Width="90%" ValidationGroup="RegGroup" TextMode="Phone" onkeypress="return blockNonNumbers(this,event)" MaxLength="10" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ID="RequiredFieldValidator8" ErrorMessage="Please Enter Phone Number" ControlToValidate="txtPhNum" runat="server" />
                                        <%--<asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="txtPhNum" ValidationGroup="RegGroup" ErrorMessage="Please Enter 10 Digits Only" MaximumValue="9999999999" MinimumValue="7000000000" Type="Integer" Display="Dynamic"></asp:RangeValidator>--%>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Email ID</td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" TextMode="Email" placeholder="EmailID" CssClass="form-control" Width="90%" ValidationGroup="RegGroup" ID="txtEmailID" AutoCompleteType="None" autocomplete="off" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup" ID="RequiredFieldValidator9" ErrorMessage="Please Enter Email ID" ControlToValidate="txtEmailID" runat="server" />
                                        <asp:RegularExpressionValidator Display="Dynamic" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="RegGroup" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Password
                                    </td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" Width="90%" ValidationGroup="RegGroup" AutoCompleteType="None" ID="txtPassword" autocomplete="return false" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="red" ValidationGroup="RegGroup" Display="Dynamic" ErrorMessage="Please enter a Password" ControlToValidate="txtPassword" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Confirm Password
                                    </td>
                                    <td>
                                        <div class="form-inline">
                                            <asp:TextBox runat="server" TextMode="Password" Width="90%" CssClass="form-control" placeholder="Confirm Password" ValidationGroup="RegGroup" AutoCompleteType="None" ID="txtConfirmPassword" /><sup style="color: red">*</sup>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="red" ValidationGroup="RegGroup" ErrorMessage="Please enter your Password" Display="Dynamic" ControlToValidate="txtConfirmPassword" runat="server" />
                                        <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Password MisMatch" ForeColor="Red" ValidationGroup="RegGroup" ControlToValidate="txtConfirmPassword" Display="Dynamic" ControlToCompare="txtPassword" runat="server" />

                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td width="20%" align="right">
                                        <table width="100%">
                                            <tr>
                                                <td align="center" width="40%">
                                                    <asp:Button Text="Submit" ID="btnSubmit" ValidationGroup="RegGroup" CssClass="btn btn-primary btn-md" OnClick="btnSubmit_Click" runat="server" />
                                                </td>
                                                <td align="center">
                                                    <%--<asp:Button runat="server" ID="btnASPClear" ValidationGroup="RegGroup" Text="Reset" OnClientClick="this.form.reset();return true;" CausesValidation="false" />--%>
                                                    <input type="reset" onclick="Page_ValidationSummariesReset();" class="btn btn-default btn-md" value="Reset" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                            <p>
                                <asp:Label Text="" ID="lblRegError" runat="server" />
                            </p>
                        </div>
                    </div>

                    <div class="col-md-2">
                        <div class="imgL" style="text-align: center; min-width: 100%">
                            <h2 class="f16"></h2>

                            <table border="0" cellpadding="0" cellspacing="14">
                                <tbody>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/ti-panel-120x45.gif" border="0"></a></td>

                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/eric-120X45-3.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/techm-120x45-07012015.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/lnt-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/novartis-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/ibm-120X45-12.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/deloittepanel-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/ltinfotech-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/wipro-pk-120x45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/utc-120X45-31122014.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/xerox-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/cisco1-sk-120x45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/aricent-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/broadcom-120X45.gif" border="0"></a></td>
                                    </tr>
                                                                       <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/airtel-120X45.gif" border="0"></a></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/mphasis-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/meil-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/msnlabs120x45-080612-01.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="../images/Company/dtdc-120x45.gif" border="0"></a></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <%--  <script type="text/javascript">

        function ChangeValidation() {

            var e = document.getElementById("<%=ddlType.ClientID %>");
            var text = e.options[e.selectedIndex].text;
            if (text == "Employer") {

                document.getElementById("<%=rfvCompanyName.ClientID%>").enabled = true;

            }
            else {

                ValidatorEnable(document.getElementById("<%=rfvCompanyName.ClientID%>"), false);

            }
        }
      

    </script>--%>
</asp:Content>
