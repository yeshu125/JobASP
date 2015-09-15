<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="UploadResume.aspx.cs" Inherits="JobASP.Account.UploadResume" %>



<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    
        <fieldset style="min-height:500px">
            <br />
            <br />
            <table width="100%" >
            <tr>
                <td width="35%">To view your Previous Resume
                </td>
                <td width="15%">
                    <asp:Button ID="btnView" Text="View" OnClick="btnView_Click"    runat="server" />
                </td>
                <td width="40%">
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7"  Display="Dynamic" ErrorMessage="Please Upload a File" ControlToValidate="fuSeekerResume" runat="server" />--%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" ValidationGroup="UploadGroup" Display="Dynamic" ErrorMessage="Please upload only PDF Files" ValidationExpression="[a-zA-Z\\].*(.pdf|.PDF)$" ControlToValidate="fuSeekerResume" runat="server" />
                </td>
            </tr>
        </table>

        <table width="100%" >
            <tr>
                <td width="15%">Resume
                </td>
                <td width="20%">
                    <asp:FileUpload ID="fuSeekerResume" runat="server"  ValidationGroup="UploadGroup" />
                </td>
                <td width="15%">
                    <asp:Button ID="btnUpload" Text="Upload" OnClick="btnUpload_Click" CausesValidation="true" ValidationGroup="UploadGroup"  runat="server" />
                </td>
                <td width="40%">
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7"  Display="Dynamic" ErrorMessage="Please Upload a File" ControlToValidate="fuSeekerResume" runat="server" />--%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ValidationGroup="UploadGroup" Display="Dynamic" ErrorMessage="Please upload only PDF Files" ValidationExpression="[a-zA-Z\\].*(.pdf|.PDF)$" ControlToValidate="fuSeekerResume" runat="server" />
                </td>
            </tr>
        </table>
                   <asp:Label Text="" ID="lblErr" runat="server" ForeColor="Red"/>
            </fieldset>
</asp:Content>
