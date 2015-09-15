<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCSearch.ascx.cs" Inherits="JobASP.UCSearch" %>
<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<div class="container">
    <div class="row">
        <div>
            <h4>Search</h4>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <div>
                    <label>SkillSet</label>
                </div>
                <div>
                    <select runat="server" multiple="true" id="ddlSkillSetSel">
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div>
                    <label>Country</label>
                </div>
                <div>
                    <select runat="server" multiple="true" id="ddlCountrySel">
                    </select>
                </div>
            </div>
        </div>
        <%--/col-lg-6--%>

        <div class="col-md-6">
            <div class="form-group">
                <div>
                    <label>State</label>
                </div>
                <div>
                    <select runat="server" multiple="true" id="ddlStateSel">
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div>
                    <label>City</label>
                </div>
                <div>
                    <select runat="server" multiple="true" id="ddlCitySel">
                    </select>
                </div>
            </div>

        </div>
        <%--/col-lg-6--%>
        <div class="f-r">
            <asp:Button Text="Search" runat="server" ID="btnSearch" CssClass="btn btn-primary btn-sm" OnClick="btnSearch_Click" />
        </div>

        <%--<table width="100%" class="table-condensed">
            
            
            <tr class="" width="100%" align="center">
               
                <td width="20%">
                   
                </td>
            </tr>
        </table>--%>
    </div><%--/row--%>
</div><%--/container--%>

<div class="container">
    <div class="row">
        <section style="margin-top:10px;">
            <asp:Label Text="" ID="lblGrid" runat="server" />
            <asp:GridView runat="server" ID="gvListSeeker" CssClass="table table-striped" BorderWidth="0" BorderStyle="None" OnPageIndexChanging="gvListSeeker_PageIndexChanging" EnableTheming="true" Width="100%" AllowPaging="true" EnableSortingAndPagingCallbacks="true" PageSize="3" Height="40%" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="Seeker ID" DataField="SeekerID" />
                    <asp:BoundField HeaderText="Name" DataField="SeekerName" />
                    <asp:BoundField HeaderText="SkillSet" DataField="PrimarySkill" />
                    <asp:BoundField HeaderText="Country" DataField="Country" />
                    <asp:BoundField HeaderText="State" DataField="State" />
                    <asp:BoundField HeaderText="City" DataField="City" />
                </Columns>
                <PagerStyle  CssClass="pagination-pro cf" BorderStyle="None"/>
            </asp:GridView>
        </section>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {

        $('#' + '<%=ddlSkillSetSel.ClientID%>').multiselect({
            includeSelectAllOption: true,
            multiple: true,
            selectedList: 3
        });
        $('#' + '<%=ddlCountrySel.ClientID%>').multiselect({
            includeSelectAllOption: true,
            multiple: true,
            selectedList: 3
        });
        $('#' + '<%=ddlStateSel.ClientID%>').multiselect({
            includeSelectAllOption: true,
            multiple: true,
            selectedList: 3
        });
        $('#' + '<%=ddlCitySel.ClientID%>').multiselect({
            includeSelectAllOption: true,
            multiple: true,
            selectedList: 3
        });
    });
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function () {
        $('.ui-multiselect-menu').each(function () {
            $(this).remove();
        });
        $('#' + '<%=ddlSkillSetSel.ClientID%>').multiselect({
            includeSelectAllOption: true,
            multiple: true,
            selectedList: 3
        });
        $('#' + '<%=ddlCountrySel.ClientID%>').multiselect({
            includeSelectAllOption: true,
            multiple: true,
            selectedList: 3
        });
        $('#' + '<%=ddlStateSel.ClientID%>').multiselect({
            includeSelectAllOption: true,
            multiple: true,
            selectedList: 3
        });
        $('#' + '<%=ddlCitySel.ClientID%>').multiselect({
            includeSelectAllOption: true,
            multiple: true,
            selectedList: 3
        });
    });
</script>
