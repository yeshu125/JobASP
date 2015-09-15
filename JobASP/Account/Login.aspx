<%@ Page Title="Log in" Language="C#" MasterPageFile="~/JobMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JobASP.Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <%-- <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
    <asp:SiteMapPath ID="SiteMap1" runat="server"></asp:SiteMapPath>--%>
     <ol class="breadcrumb">
         <li> <a href="Default.aspx">Home</a></li>
        <li class="active">Login</li>
    </ol>
    <asp:UpdatePanel runat="server" ID="UpdPnlLogin">
        <ContentTemplate>
            <div class="form-signin row">
                <h2 class="form-signin-heading">Please sign in</h2>
                <div class="form-horizontal col-md-12">

                    <h4>Please log in to place a new posting. If you do not have an account, please Register.</h4>
                    <br />
                    <div class="form-group">
                        <label for="txtLogEmailID" class="col-md-4 control-label" style="text-align: right">Email ID :</label>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" class="form-control" ValidationGroup="LoginGroup" ID="txtLogEmailID" Width="100%" TextMode="Email" EnableViewState="false" />
                        </div>
                        <div class="col-md-4">
                            <asp:RequiredFieldValidator Style="text-align: right" ID="RequiredFieldValidator1" ValidationGroup="LoginGroup" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter your Registered EmailID" ControlToValidate="txtLogEmailID" runat="server" />
                            <asp:RegularExpressionValidator Style="text-align: right" ID="RegularExpressionValidator1" ValidationGroup="LoginGroup" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter a valid EmailID" ControlToValidate="txtLogEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                        </div>
                    </div>
                    <%--/form-group--%>
                    <div class="form-group">
                        <label for="txtLogPassword" class="col-md-4 control-label" style="text-align: right">Password :</label>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" class="form-control" ValidationGroup="LoginGroup" TextMode="Password" Width="100%" ID="txtLogPassword" />
                        </div>
                        <div class="col-md-4">
                            <asp:RequiredFieldValidator Style="text-align: right" ID="RequiredFieldValidator2" ValidationGroup="LoginGroup" ForeColor="Red" ErrorMessage="Enter your Password" ControlToValidate="txtLogPassword" runat="server" />
                        </div>
                    </div>
                    <%--/form-group--%>

                    <div class="cf form-group" style="width: 120px; margin: 0 auto;">
                        <asp:Button Text="Login" OnClick="btnLogSubmit_Click" CssClass="btn btn-primary btn-sm" ValidationGroup="LoginGroup" ID="btnLogSubmit" runat="server" />
                        <input type="reset" onclick="Page_ValidationSummariesReset();" value="Cancel" class="btn btn-default btn-sm" />
                    </div>
                    <br />
                    <div class="cf form-group" style="width: 120px; margin: 0 auto;">
                        <a href="#" class="btn-link" data-toggle="modal" data-target="#ForgetPassDiv">Forget Password</a>
                    </div>

                    <div style="padding: 10px 0">
                        <asp:Label Text="hello" ID="lblErrorMsg" ForeColor="Red" runat="server" />
                    </div>
                 </div>
                <%--/col-lg-12--%>
            </div>
            <%--/row--%>
         </ContentTemplate>
    </asp:UpdatePanel>
     <div class="modal fade" id="ForgetPassDiv">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Forget Password</h4>
                </div>
                <div class="modal-body">
                    <p style="font-weight: bold" class="">
                        Please enter the following details to get your password.
                    </p>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 form-horizontal">
                                <div class="form-group">
                                	<div class="form-inline">
                                        <div class="col-md-2 control-label"> EmailID :</div>
                                        <div class="col-md-3 no-pl no-pr"><asp:TextBox ID="txtEmailID" runat="server" AutoCompleteType="None" CssClass="form-control" autocomplete="off"  ValidationGroup="ForgetGroup"/></div>
                                        <div class="col-md-3 no-pl">
                                             <asp:RequiredFieldValidator Display="Dynamic" ForeColor="red" ValidationGroup="ForgetGroup" ID="RequiredFieldValidator9" ErrorMessage="Please Enter Email ID" ControlToValidate="txtEmailID" runat="server" />
                                        <asp:RegularExpressionValidator Display="Dynamic" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="ForgetGroup" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                                        </div>
                                    <div class="col-md-5"></div>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p>
                        <asp:Label Text="" ID="lblAddError" runat="server" />
                    </p>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Ok" CssClass="btn btn-primary" OnClick="btnForgetOk_Click" ValidationGroup="ForgetGroup" ID="btnForgetOk" runat="server" />
                    <asp:Button Text="Cancel" runat="server" class="btn btn-secondary" CausesValidation="false" data-dismiss="modal" ID="btnCancel" ValidationGroup="ForgetGroup" OnClientClick="Page_ValidationSummariesReset();" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <script type="text/javascript">
        $(function () {
            $('#ForgetPassDiv').on('shown.bs.modal', function () {
            });
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            $('#ForgetPassDiv').on('shown.bs.modal', function () {
            });
        });
        function Clear() {
            document.getElementById("<%=lblErrorMsg.ClientID %>").innerHTML = "";
        }
    </script>
</asp:Content>

