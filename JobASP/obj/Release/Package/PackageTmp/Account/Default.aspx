<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/JobMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JobASP._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
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
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            start();
        });
        function SuccessTestService(responce) {
            console.log(JSON.stringify(responce.d));
            var data = responce.d;
            var test = data.Country.concat(responce.d.State);
            test = test.concat(responce.d.Skill);
            test = test.concat(responce.d.City);
            test = test.concat(responce.d.JobPosition);
            //test=test.concat(responce.d.Qualification);
            //$('ul li').each(function () {
            //    data.State.push({
            //        value: $(this).attr(''),
            //        label: $(this).text()
            //    });
            //});

            //$('ul').remove();

            $('#' + '<%=tags.ClientID%>')
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
                         test, extractLast(request.term)));
                    },
                    focus: function () {
                        // prevent value inserted on focus
                        return false;
                    },
                    select: function (event, ui) {
                        var terms = split(this.value);
                        // remove the current input

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

        start();
    </script>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <section>
                <div>
                    <h4>Please enter appropriate Search Keywords</h4>
                    <div class="form-inline">
                        <%--<div class="form-group">--%>
                        <input id="tags" runat="server" style="min-width: 90%" class="form-control" />
                        <asp:Button Text="Search" ID="Button2" runat="server" class="btn btn-primary btn-sm" OnClick="btnSearch_Click" />
                        <%--</div>--%>
                    </div>
                </div>
                <div>
                    <asp:GridView runat="server" ID="gvAutoSearch" CssClass="table table-striped" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvLatestJobs_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText="JobPosition" DataField="JobPosition" />
                            <asp:BoundField HeaderText="Skill" DataField="Skill" />
                            <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                            <asp:BoundField HeaderText="Posted Date" DataField="PostedDate" DataFormatString="{0:d}" />
                            <asp:BoundField HeaderText="Last Date" DataField="LastDate" DataFormatString="{0:d}" />
                            <asp:BoundField HeaderText="State" DataField="State" />
                            <asp:BoundField HeaderText="City" DataField="City" />
                        </Columns>
                    </asp:GridView>
                </div>
            </section>
            <section>
                <br />

                <div class="container row nav f-r col-md-12">
                    <div class="bmsTop">
                        <ul>
                            <li>
                                <img src="http://localhost:65503/images/hcl-120X45-25112014.gif" border="0"></li>
                            <li>
                                <img src="http://localhost:65503/images/vivo3-pk-120x45.gif" border="0"></li>
                            <li>
                                <img src="http://localhost:65503/images/cognizant13aug-pg-120x45.gif" border="0"></li>
                            <li>
                                <img src="http://localhost:65503/images/interglobe1-120x45black.gif" border="0"></li>
                            <li>
                                <img src="http://localhost:65503/images/syn-120X45.gif" border="0"></li>

                        </ul>
                    </div>
                </div>
            </section>
            <div class="table-title col-md-12">
                <asp:Label ID="Label1" Text="Lastest Jobs" runat="server" />
            </div>
            <asp:GridView runat="server" ID="gvLatestJobs" CssClass="table table-striped" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvLatestJobs_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="JobPosition" DataField="JobPosition" />
                    <asp:BoundField HeaderText="Skill" DataField="Skill" />
                    <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                    <asp:BoundField HeaderText="Posted Date" DataField="PostedDate" DataFormatString="{0:d}" />
                    <asp:BoundField HeaderText="Last Date" DataField="LastDate" DataFormatString="{0:d}" />
                    <asp:BoundField HeaderText="State" DataField="State" />
                    <asp:BoundField HeaderText="City" DataField="City" />
                </Columns>
            </asp:GridView>
            <asp:Label Text="" ID="lblGrid" runat="server" />

            <div role="tabpanel">

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
                    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <div class="row">
                            <div class="col-xs-12">
                                <br />
                                <asp:Repeater runat="server" ID="rptJobDetails">
                                    <HeaderTemplate>
                                        <div class="col-md-4">
                                            <b>Company</b>
                                        </div>
                                        <div class="col-md-4">
                                            <b>Job Position</b>
                                        </div>
                                        <div class="col-md-4">
                                            <b>Location</b>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="col-md-4">
                                            <img runat="server" src='<%#DataBinder.Eval(Container.DataItem,"ImageUrl") %>' />
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label Text='<%#Eval("JobPosition") %>' runat="server" />
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label Text='<%#Eval("City") %>' runat="server" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="profile">
                        <h3>Profile</h3>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="messages">
                        <h3>Messages</h3>

                        <table class="table-condensed" style="padding: 10px">
                            <tr>
                                <td>
                                    <div class="row">
                                        <a href="#" class="content" target="_blank">
                                            <div class="col-md-12">
                                                <div class="col-md-4">
                                                    <div class="banner">
                                                        <img alt="Siemens Limited" src="http://localhost:65503/images/73816.gif">
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="rowDetails"><span title="Opening for System Architect with Siemens" class="desig">Opening for System Architect with Siemens</span> <span class="exp"><em></em>10-15 yrs</span> <span class="loc"><em></em><span>Bengaluru/Bangalore</span> </span></div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <a href="#" class="content" target="_blank">
                                            <div class="col-md-12">
                                                <div class="col-md-4">
                                                    <div class="banner">
                                                        <img alt="Quadrangle Search" src="http://localhost:65503/images/1974.gif">
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="rowDetails"><span title="Production Support Manager for Gurgaon Location" class="desig">Production Support Manager for Gurgaon Location</span> <span class="exp"><em></em>10-14 yrs</span> <span class="loc"><em></em><span>Delhi/NCR(National Capital Region), Gurgaon</span> </span></div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <a href="#" class="content" target="_blank">
                                            <div class="col-md-12">
                                                <div class="col-md-4">
                                                    <div class="banner">
                                                        <img alt="Amazon Development Centre (India) Pvt. Ltd." src="http://localhost:65503/images/194374.gif">
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="rowDetails"><span title="Amazon Hyderabad : Senior Software Development Engineer (SDE II)" class="desig">Amazon Hyderabad : Senior Software Development Engineer (SDE II)</span> <span class="exp"><em></em>4-9 yrs</span> <span class="loc"><em></em><span>Hyderabad / Secunderabad</span> </span></div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <a href="#" class="content" target="_blank">
                                            <div class="col-md-12">
                                                <div class="col-md-4">
                                                    <div class="banner">
                                                        <img alt="Volantis Technologies Pvt Ltd." src="http://localhost:65503/images/380043.gif">
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="rowDetails"><span title="Java L2/l3 Testing" class="desig">Java L2/l3 Testing</span> <span class="exp"><em></em>3-8 yrs</span> <span class="loc"><em></em><span>Bengaluru/Bangalore</span> </span></div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <a href="#" class="content" target="_blank">
                                            <div class="col-md-12">
                                                <div class="col-md-4">
                                                    <div class="banner">
                                                        <img alt="Synopsys" src="http://localhost:65503/images/6697.gif">
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="rowDetails"><span title="Senior Applications Consultant" class="desig">Senior Applications Consultant</span> <span class="exp"><em></em>5-10 yrs</span> <span class="loc"><em></em><span>Hyderabad / Secunderabad</span> </span></div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="settings">
                        <h3>Settings</h3>
                        <div class="row">
                            <a href="#" class="content" target="_blank">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <div class="banner">
                                            <img alt="Amazon Development Centre (India) Pvt. Ltd." src="http://localhost:65503/images/194374.gif">
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="rowDetails"><span title="Hiring Senior Software Engineer for Hyderabad Location " class="desig">Hiring Senior Software Engineer for Hyderabad Location </span><span class="exp"><em></em>4-9 yrs</span> <span class="loc"><em></em><span>Hyderabad / Secunderabad</span> </span></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="row">
                            <a href="#" class="content" target="_blank">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <div class="banner">
                                            <img alt="Symbiosis Management Consultants" src="http://localhost:65503/images/1195.gif">
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="rowDetails"><span title="Software Architect (Sr Manager)" class="desig">Software Architect (Sr Manager)</span> <span class="exp"><em></em>10-15 yrs</span> <span class="loc"><em></em><span>Pune</span> </span></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="row">
                            <a href="#" class="content" target="_blank">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <div class="banner">
                                            <img alt="Symbiosis Management Consultants" src="http://localhost:65503/images/1195.gif">
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="rowDetails"><span title="Software Designer (Sr Manager)" class="desig">Software Designer (Sr Manager)</span> <span class="exp"><em></em>5-10 yrs</span> <span class="loc"><em></em><span>Pune</span> </span></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="row">
                            <a href="#" class="content" target="_blank">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <div class="banner">
                                            <img alt="ManpowerGroup Services India Private Limited" src="http://localhost:65503/images/742.gif">
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="rowDetails"><span title="Sr. VP - Customer Experience - E-commerce" class="desig">Sr. VP - Customer Experience - E-commerce</span> <span class="exp"><em></em>5-10 yrs</span> <span class="loc"><em></em><span>Bengaluru/Bangalore</span> </span></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
            <%--/tabpanel--%>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
