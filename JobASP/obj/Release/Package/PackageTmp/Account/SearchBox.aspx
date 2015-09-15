<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMaster.Master" AutoEventWireup="true" CodeBehind="SearchBox.aspx.cs" Inherits="JobASP.Account.SearchBox" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ProHeadContent" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.0.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui.js"></script>
    <link href="../Content/main.css" rel="stylesheet" />
    <link href="../Content/normalize.css" rel="stylesheet" />
    <link href="../Content/sumoselect.css" rel="stylesheet" />
    <link href="../Content/ui-lightness/jquery-ui-1.10.4.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="../Scripts/modernizr-2.6.2.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.autocomplete.multiselect.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.sumoselect.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ProMainContent" runat="server">
    <script type="text/javascript">
        var SelectedTags = [];
        
        function start() {
            try {
                //PageMethods.AutoCompleteData(SuccessTestService);
                $.ajax({
                    type: "POST",
                    url: "SearchBox.aspx/getAutoCompleteData",
                    contentType: "application/json; charset=utf-8",
                    success: SuccessTestService,
                    dataType: "json",
                    failure: ajaxCallFailed
                });
            }
            catch (e) {
                alert('failed to call web service. Error: ' + e);
            }

        }
        function SuccessTestService(responce) {
            console.log(JSON.stringify(responce.d));
            $("#tags")
            // don't navigate away from the field on tab when selecting an item
            .bind("keydown", function (event) {
                if (event.keyCode === $.ui.keyCode.TAB &&
                    $(this).autocomplete("instance").menu.active) {
                    event.preventDefault();
                }
            })
            .autocomplete({
                minLength: 0,
                source: function (request, response) {
                    // delegate back to autocomplete, but extract the last term
                    response($.ui.autocomplete.filter(
                      responce.d, extractLast(request.term)));
                },
                focus: function () {
                    // prevent value inserted on focus
                    return false;
                },
                select: function (event, ui) {
                    var terms = split(this.value);
                    // remove the current input
                    debugger
                    SelectedTags[SelectedTags.length] = ui.item;
                    terms.pop();
                    // add the selected item
                    terms.push(ui.item.value);
                    // add placeholder to get the comma-and-space at the end
                    terms.push("");
                    this.value = terms.join(", ");
                    return false;
                }
            });
        }
        function ajaxCallFailed(error) {
            alert('error: ' + error);
        }
        start();
        function split(val) {
            return val.split(/,\s*/);
        }
        function extractLast(term) {
            return split(term).pop();
        }
    </script>
     <script type="text/javascript">
         var Data;
         $(document).ready(function () {
             Data = $('#'+'<%=ddlAll1.ClientID%>').SumoSelect({
                 csvDispCount: 3
             });
             //window.test = $('.testsel').SumoSelect({ okCancelInMulti: true });
         });

         function show() {
             try {
                 var msgdata = $('#' + '<%=ddlAll1.ClientID%>').val();

                 for (var i = 0; i < $('#' + '<%=ddlAll1.ClientID%>').val().length; i++) {
                     var test = $('#' + '<%=ddlAll1.ClientID%>').val()[i];
                 showModalDialog(msgdata[i]);
             }
                 return true;
             } catch (e) {
                 return false;
             }
             
            
         }
    </script>
    <br />
    <table width="90%" align="center" style="text-align: center" class="table-condensed">
        <tr>
            <td colspan="5">
                 <select multiple="true" id="ddlAll1" runat="server" placeholder="Please select appropriate options" class="SlectBox">
            </select>
            </td>
        </tr>

        <tr>
            <td colspan="5">

                <b>
                    <asp:Label ID="Label1" runat="server" Style="font-weight: bolder;">
                                Please enter appropriate Search Keywords
                    </asp:Label>
                </b>
            </td>
        </tr>
        <tr>
            <td>
                <%--<select runat="server" multiple="true" ID="ddlAll1" class="ddlclass"/>--%>
            </td>
        </tr>                                                                                      
        <tr>
            <td width="90%">
                <input id="tags" size="50">
            </td>
            <td width="10%">
                <asp:Button Text="Search" ID="btnSearch" runat="server" Style="color: black" OnClientClick="return show();" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td width="60%" align="center">
                <asp:Label Text="" ID="lblGrid" runat="server" />
                <asp:GridView runat="server" ID="gvListSeeker" BorderWidth="0" BorderStyle="None" EnableTheming="true" Width="90%" AllowPaging="true" EnableSortingAndPagingCallbacks="true" PageSize="3" Height="40%" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Seeker ID" DataField="SeekerID" />
                        <asp:BoundField HeaderText="Name" DataField="SeekerName" />
                        <asp:BoundField HeaderText="SillSet" DataField="Skill" />
                        <asp:BoundField HeaderText="Country" DataField="Country" />
                        <asp:BoundField HeaderText="State" DataField="State" />
                        <asp:BoundField HeaderText="City" DataField="City" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
