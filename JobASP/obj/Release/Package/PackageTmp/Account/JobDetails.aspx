<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="JobASP.JobDetails" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
  
    <table width="100%">
        <tr>
            <td>
                <asp:HyperLink NavigateUrl="navigateurl" runat="server" Text="Back to Results" />
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label Text="" ID="lblJobTitle" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:LinkButton Text="Please Register to Apply" CssClass="button"  PostBackUrl="~/Account/Register.aspx" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="50%">
                <table>
                    <tr>
                        <td>
                            Job ID:
                        </td>
                        <td>
                            <asp:Label Text="" ID="lblJobID" runat="server" />test
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Employer:
                        </td>
                        <td>
                            <asp:Label Text="" ID="lblJobEmpType" runat="server" />test
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Employement Type:
                        </td>
                        <td>
                            <asp:Label Text="" ID="lblJobType" runat="server" />test
                        </td>
                    </tr>
                </table>
            </td>
            <td >
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            Location:
                        </td>
                        <td style="width: 103px">
                            <asp:Label Text="" ID="lblJobLoc" runat="server" />test
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Zip Code:
                        </td>
                        <td style="width: 103px">
                            <asp:Label Text="" ID="lblJobZip" runat="server" />test
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Posted:
                        </td>
                        <td style="width: 103px">
                            <asp:Label Text="" ID="lblJobPosted" runat="server" />test
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h1>Job Description:</h1>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label Text="" ID="lbljobDescription" runat="server" />test
            </td>
        </tr>
        <tr>
            <td colspan="2">
                Salary:
            </td>
        </tr>
        <tr>
            <td>
                Basic Salary:
            </td>
            <td>
                <asp:Label Text="" ID="lblJobSalary" runat="server" />test
            </td>
        </tr>
    </table>
</asp:Content>
