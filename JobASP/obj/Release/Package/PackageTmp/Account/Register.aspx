<%@ Page Title="Register" Language="C#" MasterPageFile="~/ProfileMaster.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="JobASP.Register" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ProMainContent">
    <table >
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
                          <div class="col-md-2"></div>
                    <div class="col-md-10">
                        
                        <table width="90%" align="center" class="col-xs-pull-9 table-condensed">
                            <tr>
                                <td colspan="3">
                                    <asp:ValidationSummary ID="ValidationSummary1"  runat="server" ValidationGroup="RegGroup" DisplayMode="List" ForeColor="Red" ShowSummary="true" />
                                </td>
                            </tr>

                            <tr>
                                <td width="40%">Name</td>
                        <td width="50%">
                            <asp:TextBox runat="server" ID="txtName" CssClass="re-field" placeholder="First Name" Width="90%" onkeypress="return lettersOnly(event);" /><sup style="color:red">*</sup> </td>
                                    <td>
                                        <asp:RequiredFieldValidator ValidationGroup="RegGroup" Display="None" ForeColor="red" ID="RequiredFieldValidator1" ErrorMessage="Name  is Required " ControlToValidate="txtName" runat="server" />
                                    </td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtLName" placeholder="Last Name" onkeypress="return lettersOnly(event);" Width="90%" /><sup style="color:red">*</sup>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ForeColor="red" Display="None" ValidationGroup="RegGroup" ID="RequiredFieldValidator2" ErrorMessage="Last Name is Required" ControlToValidate="txtLName" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>Gender</td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlGender" Width="90%" CssClass="CssDDL" align="center">
                                        <asp:ListItem Text="Male" Enabled="true" Value="0" />
                                        <asp:ListItem Text="Female" Value="1" />
                                    </asp:DropDownList><sup style="color:red">*</sup></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>SkillSet
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlSkillSet" CssClass="CssDDL" Width="90%" ValidationGroup="RegGroup" /><sup style="color:red">*</sup>
                                </td>
                                <td>
                                    <asp:Label Text="" ID="lblSkillErr" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Designation</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtDesignation" Width="90%" placeholder="Designation" ValidationGroup="RegGroup" onkeypress="return lettersOnly(event);" /><sup style="color:red">*</sup></td>
                                <td>
                                    <asp:RequiredFieldValidator ForeColor="Red" Display="None" ValidationGroup="RegGroup" ID="RequiredFieldValidator3" ErrorMessage=" Designation to be entered" ControlToValidate="txtDesignation" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>Company</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtCompany" Width="90%" placeholder="Company" ValidationGroup="RegGroup" onkeypress="return lettersOnly(event);" /><sup style="color:red">*</sup>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ForeColor="red" Display="None" ValidationGroup="RegGroup" ErrorMessage="Please enter your Company Name" ID="rfvCompanyName" ControlToValidate="txtCompany" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Contact Title</td>
                                <td>
                                    <asp:TextBox runat="server" Width="90%" ID="txtContactTitle" placeholder="Contact Title" onkeypress="return lettersOnly(event);" /></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtAddress" Rows="4" Placeholder="Current location" Width="90%" TextMode="MultiLine" />
                                </td>
                                <td></td>
                            </tr>


                            <tr>
                                <td>Country</td>
                                <td>
                                    <asp:DropDownList ID="ddlCountry" ValidationGroup="RegGroup" CssClass="CssDDL" Width="90%" runat="server" /><sup style="color:red">*</sup>
                                    <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="red" Display="None" ValidationGroup="RegGroup" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td>
                                    <asp:DropDownList ID="ddlState" Style="text-align: center" Width="90%" CssClass="CssDDL" runat="server" ValidationGroup="RegGroup" /><sup style="color:red">*</sup>
                                    <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="red" Display="None" ValidationGroup="RegGroup" ErrorMessage="Please Select State" ControlToValidate="ddlState" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>City</td>
                                <td>
                                    <asp:DropDownList ID="ddlCity" Style="text-align: center" CssClass="CssDDL" Width="90%" runat="server" ValidationGroup="RegGroup" /><sup style="color:red">*</sup>
                                    <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="red" Display="None" ValidationGroup="RegGroup" ErrorMessage="Please Select City" ControlToValidate="ddlCity" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Postal Code</td>
                                <td>
                                    <asp:TextBox runat="server" placeholder="Postal code" ID="txtPostalCode" Width="90%" ValidationGroup="RegGroup" onkeypress="return blockNonNumbers(this,event)" MaxLength="6" TextMode="Phone" /><sup style="color:red">*</sup></td>
                                <td>
                                    <asp:RequiredFieldValidator ForeColor="red" Display="None" ValidationGroup="RegGroup" ID="RequiredFieldValidator7" ErrorMessage="Please Enter Postal Code" ControlToValidate="txtPostalCode" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Mobile</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtPhNum" placeholder="Mobile Number" Width="90%" ValidationGroup="RegGroup" TextMode="Phone" onkeypress="return blockNonNumbers(this,event)" MaxLength="10" /><sup style="color:red">*</sup>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ForeColor="red" Display="None" ValidationGroup="RegGroup" ID="RequiredFieldValidator8" ErrorMessage="Please Enter Phone Number" ControlToValidate="txtPhNum" runat="server" />
                                    <%--<asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="txtPhNum" ValidationGroup="RegGroup" ErrorMessage="Please Enter 10 Digits Only" MaximumValue="9999999999" MinimumValue="7000000000" Type="Integer" Display="None"></asp:RangeValidator>--%>
                                </td>
                            </tr>

                            <tr>
                                <td>Email ID</td>
                                <td>
                                    <asp:TextBox runat="server" TextMode="Email" placeholder="EmailID" Width="90%" ValidationGroup="RegGroup" ID="txtEmailID" AutoCompleteType="None" autocomplete="off" /><sup style="color:red">*</sup>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator Display="None" ForeColor="red" ValidationGroup="RegGroup" ID="RequiredFieldValidator9" ErrorMessage="Please Enter Email ID" ControlToValidate="txtEmailID" runat="server" />
                                    <asp:RegularExpressionValidator Display="None" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="RegGroup" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Password
                                </td>
                                <td>
                                    <asp:TextBox runat="server" TextMode="Password" placeholder="Password" Width="90%" ValidationGroup="RegGroup" AutoCompleteType="None" ID="txtPassword" autocomplete="return false" /><sup style="color:red">*</sup>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="red" ValidationGroup="RegGroup" Display="None" ErrorMessage="Please enter a Password" ControlToValidate="txtPassword" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm Password
                                </td>
                                <td>
                                    <asp:TextBox runat="server" TextMode="Password" Width="90%" placeholder="Confirm Password" ValidationGroup="RegGroup" AutoCompleteType="None" ID="txtConfirmPassword" /><sup style="color:red">*</sup>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="red" ValidationGroup="RegGroup" ErrorMessage="Please enter your Password" Display="None" ControlToValidate="txtConfirmPassword" runat="server" />
                                    <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Password MisMatch" ForeColor="Red" ValidationGroup="RegGroup" ControlToValidate="txtConfirmPassword" Display="None" ControlToCompare="txtPassword" runat="server" />

                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td width="20%" align="right">
                                    <table width="100%">
                                        <tr>
                                            <td align="center" width="40%">
                                                <asp:Button Text="Submit" ID="btnSubmit" ValidationGroup="RegGroup" OnClick="btnSubmit_Click" runat="server" />
                                            </td>
                                            <td align="center">
                                                <%--<asp:Button runat="server" ID="btnASPClear" ValidationGroup="RegGroup" Text="Reset" OnClientClick="this.form.reset();return true;" CausesValidation="false" />--%>
                                                <input type="reset" onclick="Page_ValidationSummariesReset();" value="Reset" />
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
                        <div class="imgL" style="text-align:center;min-width:100%">
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
                                    <%--                                    <tr>
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
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/oracle-india-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/escort-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/virtusa-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/xchangingX120X45.gif" border="0"></a></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/idc-sk-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/amazon-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/prokarma-120X45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/bartronics_120x45.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEL/sierra-panel-120x45-1.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/lifestyle-120X45-30122014.gif" border="0"></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" target="_blank">
                                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/indus-towers-120X45.gif" border="0"></a></td>
                                    </tr>--%>
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
