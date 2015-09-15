<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLog.ascx.cs" Inherits="JobASP.UCLog" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
            <fieldset style="margin: 0px; padding: 0px;">
                <h3>
                    <center> <b>
                    <asp:Label Text="Login" runat="server" /></b></center>
                </h3>
                <table width="100%" align="center" cellpadding="5" cellspacing="0">
                    <tr>
                        <td colspan="3">
                            <legend>EmailID</legend>
                            <asp:TextBox runat="server" class="formclass" ID="txtLogEmailID" Width="87%" TextMode="Email" EnableViewState="false" />
                        </td>
                    </tr>
                    <tr>

                        <td colspan="3">
                            <legend>Password</legend>
                            <asp:TextBox runat="server" class="formclass" TextMode="Password" Width="87%" ID="txtLogPassword" />
                        </td>
                    </tr>
                    <tr>
                        <td width="30%"></td>
                        <td width="40%">
                            <asp:Button Text="Submit" OnClick="btnLogSubmit_Click" ID="btnLogSubmit" runat="server" />
                        </td>
                        <td width="30%"></td>
                    </tr>
                </table>
            </fieldset>
    </ContentTemplate>
</asp:UpdatePanel>


