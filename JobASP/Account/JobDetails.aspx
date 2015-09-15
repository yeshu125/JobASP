<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="JobASP.JobDetails" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
        <asp:Repeater runat="server" ID="rptJobDetails">
        <ItemTemplate>
            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h3><strong>
                                <asp:Label Text='<%#Eval("JobPosition") %>' ID="lblJobTitle" runat="server" /></strong></h3>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="control-label">Job ID: </label>
                                    <asp:Label ID="Label3" CssClass="control-label" Text='<%#Eval("JobID") %>' runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">Employer: </label>
                                    <asp:Label Text="Contract" ID="lblJobEmpType" runat="server" />

                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">Employement Type: </label>
                                    <asp:Label Text="" ID="lblJobType" runat="server" />
                                </div>
                            </div>
                            <%--/col-md-6--%>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="control-label">Location: </label>
                                    <asp:Label Text='<%#Eval("City") %>' ID="lblJobLoc" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">Posted Date: </label>
                                    <asp:Label Text='<%#Eval("PostedDate", "{0:M/d/yyyy}") %>' ID="lblJobPosted" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">Last Date: </label>
                                    <asp:Label Text='<%#Eval("LastDate", "{0:M/d/yyyy}") %>' ID="Label4" runat="server" />
                                </div>
                            </div>
                            <%--/col-md-6--%>
                        </div>
                        <%--/col-md-12--%>
                    </div>
                    <%--/row--%>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="form-inline">
                                   <h4><strong>Job Description: </strong></h4>

                                    <asp:Label Text='<%#Eval("JobDescription") %>' ID="lbljobDescription" runat="server" />

                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="control-label">Salary: </label>
                                    <asp:Label ID="Label2" Text='<%#Eval("Salary") %>' runat="server" />
                                    6 Lakhs/Annum
                                </div>
                            </div>
                            <%--/col-md-6--%>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="control-label">Experience: </label>
                                    <asp:Label ID="Label1" Text='<%#Eval("Experience") %>' runat="server" />
                                    5 Years
                                </div>
                            </div>
                            <%--/col-md-6--%>
                        </div>
                        <%--/col-md-12--%>
                    </div>
                    <%--/row--%>
                </div>
                <%--/container--%>
            </section>
        </ItemTemplate>
    </asp:Repeater>
</body>
</html>

