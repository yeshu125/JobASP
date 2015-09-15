<%@ Page Title="Log in" Language="C#" MasterPageFile="~/JobMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JobASP.Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <%-- <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UpdPnlLogin">
        <ProgressTemplate>
            <div class="divProWait">
                <b style="color: black">Loading...</b>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
    <asp:UpdatePanel runat="server" ID="UpdPnlLogin">
        <ContentTemplate>
          <p align="left">  <asp:Label style="font-size:xx-large;font-weight:bolder;" Text="Sign In"   runat="server" /></p>
            <table width="90%" align="left" class="col-xs-pull-9 table-condensed" >
                <tr>
                    <td colspan="6">
                        <asp:Label style="font-size:large;" Text="Please log in to place a new posting. If you do not have an account, please Register." runat="server" /> 
                    </td>
                </tr>
                <%-- <tr>
                <td width="20%">Login Type 
                </td>
                <td width="40%" colspan="2">
                    <asp:DropDownList class="formclass" runat="server" ID="ddlLogType">
                        <asp:ListItem Text="Seeker" Enabled="true" />
                        <asp:ListItem Text="Employer" />
                    </asp:DropDownList>
                </td>

                <td width="40%"></td>
            </tr>--%>
                <tr>
                    
                    <td width="30%" align="right"><b>Email ID :</b>
                    </td>
                    <td colspan="2" width="30%">
                        <asp:TextBox runat="server" class="formclass" ValidationGroup="LoginGroup" ID="txtLogEmailID" Width="100%" TextMode="Email" EnableViewState="false" />
                    </td>
                    <td colspan="2" width="40%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="LoginGroup" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter your Registered EmailID" ControlToValidate="txtLogEmailID" runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="LoginGroup" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter a valid EmailID" ControlToValidate="txtLogEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                    </td>
                </tr>
                <tr>
                    
                    <td width="30%" align="right"><b>Password :</b>
                    </td>
                    <td colspan="2" width="30%">
                        <asp:TextBox runat="server" class="formclass" ValidationGroup="LoginGroup" TextMode="Password" Width="100%" ID="txtLogPassword" />
                    </td>
                    <td colspan="2" width="40%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="LoginGroup" ForeColor="Red" ErrorMessage="Please enter your Password" ControlToValidate="txtLogPassword" runat="server" />
                    </td>
                </tr>
                <tr>
                    
                    <td></td>
                    <td cellpadding="0" align="center">
                        <asp:Button Text="Login" OnClick="btnLogSubmit_Click" CssClass="btn btn-primary btn-sm" ValidationGroup="LoginGroup" ID="btnLogSubmit" runat="server" />
                    </td>
                    <td cellpadding="0" align="center">
                         <input type="reset" onclick="Page_ValidationSummariesReset();" value="Cancel" class="btn btn-secondary btn-sm"/>
                        <%--<asp:Button runat="server" ID="btnLogCancel" Text="Cancel" ValidationGroup="LoginGroup" OnClientClick="this.form.reset();return true;" CausesValidation="false" />--%>
                        <%--<asp:button text="Cancel"  OnClientClick="this.form.reset();return true;" CausesValidation="false" ID="btnLogCancel" runat="server" />--%>
            
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label Text="hello" ID="lblErrorMsg" ForeColor="Red" runat="server" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function Clear() {
            document.getElementById("<%=lblErrorMsg.ClientID %>").innerHTML = "";
        }
    </script>
</asp:Content>

