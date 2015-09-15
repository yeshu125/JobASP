<%@ Page Title="" Language="C#" MasterPageFile="~/JobMaster.master" AutoEventWireup="true" CodeBehind="AddCompany.aspx.cs" Inherits="JobASP.Account.AddCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <script>
          $(function () {
              $('#AddVenueDiv').on('shown.bs.modal', function () {
              });
              $('#AddJobDiv').on('shown.bs.modal', function () {
              });
              $(function () {
                  $('[data-toggle="tooltip"]').tooltip()
              })
          });
    </script>
    <div class="container">
        <div class="wrapper cf">
            <table>
                <tr>
                    <td>
                        <asp:TextBox runat="server" placeholder="Company Name" ID="txtCompanyName" data-toggle="tooltip" data-placement="top" title="Company Name" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" placeholder="Domain" ID="txtCompanyDomain" data-toggle="tooltip" data-placement="top" title="Domain" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" placeholder="Company Address" ID="txtCompanyAddress" data-toggle="tooltip" data-placement="top" title="Company Address" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" Placeholder="About Company" ID="txtAboutCompany" data-toggle="tooltip" data-placement="top" title="About Company" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" placeholder="Please Paste Company Url" data-toggle="tooltip" data-placement="top" title="Paste Company Url" />
                    </td>
                    <td>
                        <asp:FileUpload runat="server" ID="fuCompanyImageUrl" placeholder="Upload Company Logo" data-toggle="tooltip" data-placement="top" title="Upload Company Logo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" placeholder="Organisation Started Year" data-toggle="tooltip" data-placement="top" title="Organisation Started Year" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtCompanyPhNum" Width="100%" runat="server" placeholder="Phone Number" data-toggle="tooltip" data-placement="top" title="Phone Number" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompanyEmailID" Width="100%" runat="server" placeholder="Company EmailID" data-toggle="tooltip" data-placement="top" title="Company EmailID" />
                    </td>
                </tr>
               
            </table>
        </div>
    </div>
    <%--container--%>
</asp:Content>
