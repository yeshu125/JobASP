<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickEnquiryControl.ascx.cs" Inherits="JobASP.Account.QuickEnquiryControl" %>
<table width="100%" class="col-xs-pull-9 table">
    <tr>
        <td width="100%">
            <asp:TextBox ID="txtName" runat="server" placeholder="Name" />
        </td>
    </tr>
    <tr>
        <td width="100%">
            <asp:TextBox ID="txtEmailID" runat="server" placeholder="Email" />
        </td>
    </tr>
    <tr>
        <td width="100%">
            <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject" /></td>
    </tr>
    <tr>
        <td width="100%">
            <asp:TextBox ID="txtMessage" runat="server" placeholder="Message" height="50px"/></td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" OnClientClick="javascript:return validate();"/>
        </td>
    </tr>
</table>

<%---<div class="row">

    <div class="col-xs-12">

        <div class="form-group">
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Email" />
        </div>

        <div class="form-group">
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Subject" />
        </div>

        <div class="form-group">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Message" height="30px"/>
        </div>

        <asp:Button ID="Button1" Text="Submit" runat="server" OnClick="btnSubmit_Click" OnClientClick="javascript:return validate();"/>

    </div>--%><%--/col-xs-12--%>
  
<%--</div>--%>


<script type="text/javascript">
    function validate() {
        var name = document.getElementById("<%=txtName.ClientID%>").value;
        var emailid = document.getElementById("<%=txtEmailID.ClientID%>").value;
        var subject = document.getElementById("<%=txtSubject.ClientID%>").value;
        var message = document.getElementById("<%=txtMessage.ClientID%>").value;
        var regemail = /^(?:\w+\.?)*\w+@(?:\w+\.)+\w+$/;
        if (name == "")
        {
            alert("Please enter Name");
            document.getElementById("<%=txtName.ClientID%>").focus();
            return false;
        }
        if (emailid == "") {
            alert("Please enter Email");
            document.getElementById("<%=txtEmailID.ClientID%>").focus();
            return false;
        }
        if (!regemail.test(emailid))
        {
            alert("Please enter valid email");
            document.getElementById("<%=txtEmailID.ClientID%>").focus();
            return false;
        }
        if (subject == "") {
            alert("Please enter Subject");
            document.getElementById("<%=txtSubject.ClientID%>").focus();
            return false;
        }
        if (message == "") {
            alert("Please enter Message");
            document.getElementById("<%=txtMessage.ClientID%>").focus();
            return false;
        }
        return true;

    }
</script>
