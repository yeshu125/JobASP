<%@ Page Title="" Language="C#" MasterPageFile="~/EmpMaster.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="JobASP.Account.MyProfile" %>

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
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="ProfileEmployer.aspx">Home</a></li>
        <li class="active">My Profile</li>
    </ol>
    <h2>My Profile</h2>
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
    <div class="f-r">
        <div class="col-md-12 form-inline form-group">
          To Change Password :  <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#changePassword">Click Here</button>
        </div>
    </div>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Repeater runat="server" ID="rptProfileEdit" OnItemCommand="rptProfileEdit_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label1" Text="Name :" runat="server" /><sup style="color: red">*</sup>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" Text='<%#Eval("EmpName") %>' ID="txtName" CssClass="form-control" placeholder="First Name" onkeypress="return lettersWithSpaceOnly(event);" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator ValidationGroup="RegGroup" Display="Dynamic" ForeColor="red" ID="RequiredFieldValidator1" ErrorMessage="Name  is Required " ControlToValidate="txtName" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label2" Text="Last Name :" runat="server" /><sup style="color: red">*</sup>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" Text='<%#Eval("EmpLName") %>' ID="txtLName" CssClass="form-control" placeholder="Last Name" onkeypress="return lettersOnly(event);" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ID="RequiredFieldValidator2" ErrorMessage="Last Name is Required" ControlToValidate="txtLName" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label3" Text="Company Name :" runat="server" /><sup style="color: red">*</sup>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtCompanyName" CssClass="form-control" Text='<%#Eval("CompanyName") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ErrorMessage="Please enter your Company Name" ID="rfvCompanyName" ControlToValidate="txtCompanyName" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label4" Text="Designation :" runat="server" /><sup style="color: red">*</sup>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtDesignation" CssClass="form-control" Text='<%#Eval("Designation") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ValidationGroup="RegGroup" ID="RequiredFieldValidator3" ErrorMessage=" Designation to be entered" ControlToValidate="txtDesignation" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label5" Text="Address :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox TextMode="MultiLine" ID="txtAddress" Style="padding-right: 28px;" CssClass="form-control" Text='<%#Eval("Address") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label6" Text="Country :" runat="server" /><sup style="color: red">*</sup>
                                        </div>
                                        <div class="col-md-6">
                                            <%--<asp:Label Text='<%#Eval("Countries.CountryName") %>' runat="server" />--%>
                                            <asp:DropDownList ID="ddlCountry" Width="89%" ValidationGroup="RegGroup" CssClass="form-control" runat="server" />
                                            <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label7" Text="State :" runat="server" /><sup style="color: red">*</sup>
                                        </div>
                                        <div class="col-md-6">
                                            <%--<asp:Label Text='<%#Eval("States.StateName") %>' runat="server" />--%>
                                            <asp:DropDownList ID="ddlState" Style="text-align: center" Width="89%" CssClass="form-control" runat="server" ValidationGroup="RegGroup" />
                                            <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ErrorMessage="Please Select State" ControlToValidate="ddlState" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                    <asp:Label ID="Label8" Text="City :" runat="server" /><sup style="color: red">*</sup>
                                </div>
                                <div class="col-md-6">
                                    <%--<asp:Label Text='<%#Eval("Cities.CityName") %>' runat="server" />--%>
                                    <asp:DropDownList ID="ddlCity" Style="text-align: center" Width="89%" CssClass="form-control" runat="server" ValidationGroup="RegGroup" />
                                    <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ErrorMessage="Please Select City" ControlToValidate="ddlCity" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label9" Text="Postal Code :" runat="server" /><sup style="color: red">*</sup>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" placeholder="Postal code" Text='<%#Eval("PostalCode") %>' CssClass="form-control" ID="txtPostalCode" ValidationGroup="RegGroup" onkeypress="return blockNonNumbers(this,event)" MaxLength="6" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ID="RequiredFieldValidator7" ErrorMessage="Please Enter Postal Code" ControlToValidate="txtPostalCode" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label10" Text="Mobile :" runat="server" /><sup style="color: red">*</sup>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" ID="txtPhone" Text='<%#Eval("Phone") %>' placeholder="Mobile Number" CssClass="form-control" ValidationGroup="RegGroup" TextMode="Phone" onkeypress="return blockNonNumbers(this,event)" MaxLength="10" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator ForeColor="red" Display="Dynamic" ValidationGroup="RegGroup" ID="RequiredFieldValidator8" ErrorMessage="Please Enter Phone Number" ControlToValidate="txtPhone" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="margin-top: 10px; text-align: right;">
                                            <asp:Label ID="Label11" Text="Email ID :" runat="server" /><sup style="color: red">*</sup>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" Text='<%#Eval("EmailID") %>' TextMode="Email" placeholder="EmailID" CssClass="form-control" ValidationGroup="RegGroup" ID="txtEmailID" AutoCompleteType="None" ReadOnly="true" autocomplete="off" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <asp:RequiredFieldValidator Display="Dynamic" ForeColor="red" ValidationGroup="RegGroup" ID="RequiredFieldValidator9" ErrorMessage="Please Enter Email ID" ControlToValidate="txtEmailID" runat="server" />
                                        <asp:RegularExpressionValidator Display="Dynamic" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="RegGroup" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cf form-group" style="width: 200px; margin: 0 auto;">
                        <asp:Button Text="Update" runat="server" CssClass="btn-primary btn btn-sm" ID="btnEmpProfileUpdate" CommandName="Update" ValidationGroup="RegGroup" />
                        <asp:Button Text="Cancel" runat="server" CssClass="btn-info btn btn-sm" ID="btnEmpProfileCancel" CausesValidation="false" CommandName="Cancel" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater runat="server" ID="rptViewProfile" OnItemCommand="rptViewProfile_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label1" Text="Name :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label12" Text='<%#Eval("EmpName") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label2" Text="Last Name :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label13" Text='<%#Eval("EmpLName") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label3" Text="Company Name :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label14" Text='<%#Eval("CompanyName") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label4" Text="Designation :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label15" Text='<%#Eval("Designation") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label5" Text="Address :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label16" Text='<%#Eval("Address") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label6" Text="Country :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label17" Text='<%#Eval("Countries.CountryName") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label7" Text="State :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label18" Text='<%#Eval("States.StateName") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="col-md-6" style="text-align: right;">
                                    <asp:Label ID="Label8" Text="City :" runat="server" />
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="Label19" Text='<%#Eval("Cities.CityName") %>' runat="server" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label9" Text="Postal Code :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label20" Text='<%#Eval("PostalCode") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label10" Text="Mobile :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label21" Text='<%#Eval("Phone") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="col-md-6" style="text-align: right;">
                                            <asp:Label ID="Label11" Text="Email ID :" runat="server" />
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Label ID="Label22" Text='<%#Eval("EmailID") %>' runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="form-inline">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cf form-group" style="width: 100px; margin: 0 auto;">
                        <asp:Button Text="Edit" runat="server" CssClass="btn-primary btn btn-sm" ID="btnEmpProfileEdite" CommandName="Edit" />
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
                                <asp:Label ID="Label23" Text="Current Password :" CssClass="control-label" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtChngCurrPwd" />
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" SetFocusOnError="true" ErrorMessage="Enter Current Password" ControlToValidate="txtChngCurrPwd" ForeColor="Red" ValidationGroup="ChngPwdGroup" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-4">
                                <asp:Label ID="Label2" Text="New Password :" CssClass="control-label" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtChngNewPwd" />
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" SetFocusOnError="true" ErrorMessage="Enter New Password" ControlToValidate="txtChngNewPwd" ForeColor="Red" runat="server" ValidationGroup="ChngPwdGroup" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-4">
                                <asp:Label ID="Label3" Text="Re-enter new Password :" CssClass="control-label" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtChngreNewPwd" />
                            </div>
                            <div class="col-md-4">
                                <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Enter New Password" ControlToValidate="txtChngreNewPwd" ForeColor="Red" runat="server" ValidationGroup="ChngPwdGroup" />
                                <asp:CompareValidator SetFocusOnError="true" ID="CompareValidator1" ErrorMessage="Password Mis-match" ForeColor="Red" ValidationGroup="ChngPwdGroup" ControlToValidate="txtChngreNewPwd" Display="Dynamic" ControlToCompare="txtChngNewPwd" runat="server" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button Text="Ok" CssClass="btn btn-primary" ValidationGroup="ChngPwdGroup" ID="btnEmpPwdOk" OnClick="btnEmpPwdOk_Click" runat="server"  />
                    <asp:Button Text="Cancel" runat="server" class="btn btn-secondary" CausesValidation="false" data-dismiss="modal" ID="Button2" ValidationGroup="ChngPwdGroup" OnClientClick="Page_ValidationSummariesReset();" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
  
    <br />
</asp:Content>
