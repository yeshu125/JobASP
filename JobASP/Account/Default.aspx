<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/JobMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JobASP._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="../Content/chosen.css" rel="stylesheet" />
    <link href="../Content/prism.css" rel="stylesheet" />
    <style>
        #page {
            margin: 0 auto 50px;
            position: relative;
            width: 720px;
        }

        .button {
            color: #fff;
            cursor: pointer;
            display: inline-block;
            text-align: center;
            text-decoration: none;
        }

            .button.small {
                border-radius: 15px;
                float: right;
                margin: 22px 5px 0;
                padding: 6px 15px;
            }

            .button:hover {
                background-color: #bbb;
            }

            .button > span {
                font-size: 84%;
            }

            .button.b-close, .button.bClose {
                background-repeat:no-repeat;
                position: absolute;
                right: 0;
                top:0;
                padding:10px;
            }

        .scrollable-menu {
            max-height: 250px;
            overflow: hidden;
            overflow-y: auto;
        }


        #popup {
            background-color: #fff;
            border-radius: 4px;
            /*box-shadow: 0 0 25px 5px #999;*/
            color: #111;
            display: none;
            min-width: 400px;
            max-width: 800px;
            min-height: 250px;
            padding: 25px;
        }

            #popup .logo {
                color: #2b91af;
                font: bold 325% 'Petrona',sans;
            }
    </style>
    <script src="../Scripts/chosen.proto.js"></script>
    <script src="../Scripts/chosen.jquery.js"></script>
    <script src="../Scripts/prism.js"></script>
 

    <script type="text/javascript">
        //Cache these as variables so we only have to select once

        //var $msg = $("#message");

        //Apply a single change event to fire on either dropdown

        $(function () {
            var $min = $('#' + '<%=ddlAdvSalMin.ClientID%>');
            var $max = $('#' + '<%=ddlAdvSalMax.ClientID%>');
            $min.add($max).change(function () {
                //Have some default text to display, an empty string
                var text = "";

                //Cache the vales as variables so we don't have to keep getting them
                //We will parse the numbers out of the string values
                var minVal = parseInt($min.val(), 10);
                var maxVal = parseInt($max.val(), 10)

                //Determine if both are numbers, if so then they both have values
                var bothHaveValues = !isNaN(minVal) && !isNaN(maxVal);
                var bothHaveMinVal = minVal > 0 && maxVal > 0;
                if (bothHaveValues && bothHaveMinVal) {
                    if (minVal > maxVal) {
                        text += 'Minimum expreience should be less than maximum';
                    } else if (maxVal < minVal) {
                        text += 'Maximum experience should be greater than minimum';
                    }
                }
                if (text != "") {
                    //Display the text
                    funcAlertDanger(text);
                }
                else {
                    document.getElementById("alertDanger").style.display = 'none';
                }
            });
            //(function (a) {
            //    a(function () {
            //        a("body").on("click", ".small", function () {
            //            var c = a("#popup");
            //            c.bPopup({
            //                follow: [!0, !0],
            //                position: [90, 40],
            //                opacity: ".4",
            //                positionStyle: "fixed",
            //                modal: true,
            //                modalClose: false,
            //                transition: 'slideDown',
            //                speed: 1000
            //            });
            //        });
            //    });
            //    var b = function (a, b) {
            //        return (b - 600)
            //    }
            //})(jQuery);
        });
        $(function () {
            $(".chosen-select").chosen({ max_selected_options: 2 });
            $("#ddlJobCategory").chosen({ disable_search_threshold: 2, max_selected_options: 2 });
            var slider = $('.bxslider').bxSlider({
                auto: true,
                pager: false,
                infiniteLoop: true,
                controls: false,                     // true, false - previous and next controls
                easing: 'swing',
                autoStart: true,
                autocontrols: true,
                adaptiveHeight: true,
                slideWidth: 700
            });

            $('.bx-prev, .bx-next').click(function (e) {
                slider.stopAuto();
                setTimeout(function () {
                    slider.startAuto();
                }, 300);

                return false;
            });


            $("#create-user").button().on("click", function (e) {
                e.preventDefault();
                $('#dialog').bPopup({
                });
            });
        });
    </script>
    <script type="text/javascript">
        bootstrap_alert = function () { }
        bootstrap_alert.warning = function (message) {
            $('#alertDanger').html('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><span>' + message + '</span></div>')
        }
        function funcAlertDanger(text) {
            bootstrap_alert.warning(text);
            //document.getElementById("lblAdvSrchErr").value = text;
            document.getElementById("alertDanger").style.display = 'block';
        }
        function validateAdvSearch() {
            var flag1 = 0, flag2 = 0, flag3 = 0, flag4 = 0, flag5 = 0, flag6 = 0;
            var tags = $('#' + '<%=txtAdvtags.ClientID%>').val();
            var locs = $('#' + '<%=txtAdvLocation.ClientID%>').val();
            var Indust = $(".chosen-select").chosen().val();
            var JobCat = $("#ddlJobCategory").chosen().val();
            var text = ' Please enter ';
            if (tags === "") {
                text += 'Keywords ';
                flag1 = 1;
            }

            if (locs === "") {
                if (flag1 === 1) {
                    text += 'or ';
                }
                text += 'Location ';

                flag2 = 1;
            }

            if (Indust === null) {
                if (flag1 === 1 || flag2 === 1) {
                    text += 'or ';
                }
                text += 'select Job Category ';

                flag3 = 1;
            }

            if (JobCat === null) {
                if (flag1 === 1 || flag2 === 1 || flag3 === 1) {
                    text += 'or ';
                }

                text += 'Industry to search';
                flag4 = 1;
            }

            if (flag1 === 1 && flag2 === 1 && flag3 === 1 && flag4 === 1) {
                $('#' + '<%=txtAdvtags.ClientID%>').css('border-color', 'red');
                $('#' + '<%=txtAdvLocation.ClientID%>').css('border-color', 'red');
                $(".chosen-choices").css('border-color', 'red');
                $("#ddlJobCategory").chosen().css('border-color', 'red');
                funcAlertDanger(text);
                return false;
            }
            else {
                $('#' + '<%=txtAdvtags.ClientID%>').css('border-color', '');
                $('#' + '<%=txtAdvLocation.ClientID%>').css('border-color', '');
                $(".chosen-choices").css('border-color', '');
                $("#ddlJobCategory").chosen().css('border-color', '');
                document.getElementById("alertDanger").style.display = 'none';
                return true;
            }
        }
        function Validate(sender, args) {
            var gridView = document.getElementById("<%=gvAutoSearch.ClientID %>");

            var checkBoxes = gridView.getElementsByTagName("input");
            for (var i = 0; i < checkBoxes.length; i++) {
                if (checkBoxes[i].type == "checkbox" && checkBoxes[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }
        function ValidateSearch() {
            var tags = $('#' + '<%=txttags.ClientID%>').val();
            var loc = $('#' + '<%=txtLocation.ClientID%>').val();
            if (tags == '' && loc == '') {
                $('#' + '<%=lblSearch.ClientID%>').text("Please enter Keywords or Location to search");
                $('#' + '<%=lblSearch.ClientID%>').css("color", 'Red');
                return false;
            }
            else {
                $('#' + '<%=lblSearch.ClientID%>').text('');
                $('#' + '<%=lblSearch.ClientID%>').css("color", '');
                return true;
            }
        }
        function start() {
            try {
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/getAutoCompleteData",
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


        //For the javascript to run after the partial postback was performed using Update Panel
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            start();
            var slider = $('.bxslider').bxSlider({
                auto: true,
                pager: false,
                infiniteLoop: true,
                controls: true,                     // true, false - previous and next controls
                easing: 'swing',
                autoStart: true,
                autocontrols: true,
                adaptiveHeight: true,
                slideWidth: 700
            });

            $('.bx-prev, .bx-next').click(function (e) {
                slider.stopAuto();
                setTimeout(function () {
                    slider.startAuto();
                }, 300);

                return false;
            });
        });

        function SuccessTestService(responce) {

            var data = responce.d;
            var dataLoc = data.Country.concat(responce.d.State);
            dataLoc = dataLoc.concat(responce.d.City);
            var dataTags = responce.d.Skill;
            dataTags = dataTags.concat(responce.d.JobPosition);
            dataTags = dataTags.concat(responce.d.Company);
            $('#' + '<%=txttags.ClientID%>')
                .bind("keydown", function (event) {
                    if (event.keyCode === $.ui.keyCode.TAB && $(this).autocomplete("instance").menu.active) { event.preventDefault(); }
                }).autocomplete({
                    minLength: 0,
                    source: function (request, response) { response($.ui.autocomplete.filter(dataTags, extractLast(request.term))); },
                    focus: function () { return false; },
                    select: function (event, ui) {
                        var terms = split(this.value);
                        terms.pop();
                        terms.push(ui.item.value);
                        terms.push("");
                        this.value = terms.join(",");
                        return false;
                    }
                });
            $('.txtAdvClass').bind("keydown", function (event) {
                if (event.keyCode === $.ui.keyCode.TAB && $(this).autocomplete("instance").menu.active) { event.preventDefault(); }
            }).autocomplete({
                minLength: 0,
                source: function (request, response) { response($.ui.autocomplete.filter(dataTags, extractLast(request.term))); },
                focus: function () { return false; },
                select: function (event, ui) {
                    var terms = split(this.value);
                    terms.pop();
                    terms.push(ui.item.value);
                    terms.push("");
                    this.value = terms.join(",");
                    return false;
                }
            });

            $('#' + '<%=txtLocation.ClientID%>')
               .bind("keydown", function (event) {
                   if (event.keyCode === $.ui.keyCode.TAB && $(this).autocomplete("instance").menu.active) { event.preventDefault(); }
               }).autocomplete({
                   minLength: 0,
                   source: function (request, response) { response($.ui.autocomplete.filter(dataLoc, extractLast(request.term))); },
                   focus: function () { return false; },
                   select: function (event, ui) {
                       var terms = split(this.value);
                       terms.pop();
                       terms.push(ui.item.value);
                       terms.push("");
                       this.value = terms.join(",");
                       return false;
                   }
               });
            $('#' + '<%=txtAdvLocation.ClientID%>').bind("keydown", function (event) {
                if (event.keyCode === $.ui.keyCode.TAB && $(this).autocomplete("instance").menu.active) { event.preventDefault(); }
            }).autocomplete({
                minLength: 0,
                source: function (request, response) { response($.ui.autocomplete.filter(dataLoc, extractLast(request.term))); },
                focus: function () { return false; },
                select: function (event, ui) {
                    var terms = split(this.value);
                    terms.pop();
                    terms.push(ui.item.value);
                    terms.push("");
                    this.value = terms.join(",");
                    return false;
                }
            });

        }
        function ajaxCallFailed(error) {
            alert('error: ' + error);
        }
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
                <section class="search-elements">
                    <div class="form-group">
                        <div class="form-inline" style="background-color: #bbb;">
                            <input class="in-search" id="txttags" runat="server" type="search" style="width: 36.5%; border-left: 3px solid #bbb; border-bottom: 3px solid #bbb; border-top: 3px solid #bbb; border-right: 1px solid #bbb;" name="txtSearchOther" placeholder="Skills, Designations, Companies" />
                            <input class="in-search" id="txtLocation" runat="server" type="search" style="border-left: 1px solid #bbb; border-bottom: 3px solid #bbb; border-top: 3px solid #bbb; border-right: 1px solid #bbb;" name="txtSearchLoc" placeholder="Location" />
                            <select class="sel-search" id="selExperience" runat="server" name="SelExperiece" style="border-left: 1px solid #bbb; border-bottom: 3px solid #bbb; border-top: 3px solid #bbb; border-right: 1px solid #bbb;">
                                <option value="0">Experience</option>
                                <option value="1">Fresher</option>
                                <option value="2">1 Year</option>
                                <option value="3">2 Years</option>
                                <option value="4">3 Years</option>
                                <option value="5">4 Years</option>
                                <option value="6">5 Years</option>
                                <option value="7">6 Years</option>
                                <option value="8">7 Years</option>
                                <option value="9">8 Years</option>
                                <option value="10">9 Years</option>
                                <option value="11">10 Years</option>
                                <option value="12">>10 Years</option>
                            </select>
                            <select class="sel-search" runat="server" id="SelSalary" style="border-left: 1px solid #bbb; border-bottom: 3px solid #bbb; border-top: 3px solid #bbb; border-right: 1px solid #bbb;">
                                <option value="0">Salary</option>
                                <option value="1"><1 Lac</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">>10</option>
                            </select>

                            <asp:Button Text="Search" ID="Button1" runat="server" Style="margin-top: -3px;" class="btn btn-primary btn-md" OnClick="btnSearch_Click" OnClientClick="return ValidateSearch();" />
                        </div>
                        <div class="f-r btn-link">
                            <a href="#" class="small pop1">Advanced Search</a>
                        </div>
                    </div>

                    <asp:Label Text="" ID="lblSearch" runat="server" />
                    <%--<span style="color:red; padding:0; margin:0;display:none;">Please enter Keywords or Location to search</span>--%>
                </section>
                <br />
                <div>
                    <asp:GridView runat="server" ID="gvAutoSearch" OnRowCommand="gvAutoSearch_RowCommand" ShowFooter="true" CssClass="table table-striped" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" OnPageIndexChanging="gvLatestJobs_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSelect" CssClass="" runat="server"></asp:CheckBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:ValidationSummary ValidationGroup="gvAutoSearchGroup" runat="server" ForeColor="Red" ShowMessageBox="true" ShowSummary="false" DisplayMode="List" />
                                    <asp:CustomValidator EnableClientScript="true" SetFocusOnError="true" Style="color: red;" ID="CustomValidator1" runat="server" Display="None" ErrorMessage="Please select at least one job." ClientValidationFunction="Validate" ForeColor="Red" ValidationGroup="gvAutoSearchGroup"></asp:CustomValidator>
                                    <asp:Button Text="Apply" CommandName="CheckListbtn" ID="btnChkApply" ValidationGroup="gvAutoSearchGroup" runat="server" CssClass="btn btn-primary btn-sm" />
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="JobPosition" DataField="JobPosition" />
                            <asp:TemplateField HeaderText="Skill">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" Text='<%#Eval("Skills.Skill") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                            <asp:BoundField HeaderText="Posted Date" DataField="PostedDate" DataFormatString="{0:d}" />
                            <asp:BoundField HeaderText="Last Date" DataField="LastDate" DataFormatString="{0:d}" />
                            <asp:TemplateField HeaderText="State">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" Text='<%#Eval("States.StateName") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" Text='<%#Eval("Cities.CityName") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </section>

            <section>
                <br />
                <div class="nav f-r">
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

            <section style="padding-left: 5px;">
                <div>
                    <ul class="bxslider">
                        <li>
                            <img src="../images/bxSlider/im1.jpg" height="300" width="700" />
                        </li>
                        <li>
                            <img src="../images/bxSlider/im2.jpg" height="300" width="700" />
                        </li>
                        <li>
                            <img src="../images/bxSlider/im3.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im4.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im5.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im6.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im7.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im8.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im9.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im10.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im11.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im12.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im13.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im14.jpg" height="300" width="700" /></li>
                        <li>
                            <img src="../images/bxSlider/im15.jpg" height="300" width="700" /></li>
                        <%-- <li>
                        <img src="../images/bxSlider/im16.jpg" /></li>--%>
                    </ul>

                </div>

            </section>

            <div class="table-title" style="text-align: center">
                <asp:Label ID="Label1" Text="Lastest Jobs" Visible="false" runat="server" />
            </div>

            <div>
                <asp:GridView runat="server" ID="gvLatestJobs" CssClass="table" OnRowCommand="gvLatestJobs_RowCommand" Visible="false" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" OnPageIndexChanging="gvLatestJobs_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="JobPosition" DataField="JobPosition" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label Text='<%#Eval("Skills.Skill") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                        <asp:BoundField HeaderText="Posted Date" DataField="PostedDate" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="Last Date" DataField="LastDate" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="City" DataField="City" />
                        <asp:BoundField HeaderText="Experience" DataField="Experience" />
                        <asp:ButtonField HeaderText="Apply" ButtonType="Button" ControlStyle-CssClass="btn btn-primary btn-sm" CommandName='Apply' Text="Apply" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Label Text="" ID="lblGrid" runat="server" Visible="false" />
            <section>
                <div role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs nav-justified" role="tablist">
                        <li role="presentation" class="active"><a href="#upcoming" aria-controls="upcoming" role="tab" data-toggle="tab">Upcoming Jobs</a></li>
                        <li role="presentation"><a href="#latest" aria-controls="latest" role="tab" data-toggle="tab">Latest Jobs</a></li>
                        <li role="presentation"><a href="#it" aria-controls="it" role="tab" data-toggle="tab">IT Jobs</a></li>
                        <li role="presentation"><a href="#management" aria-controls="management" role="tab" data-toggle="tab">Management Jobs</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="upcoming">


                            <div class="row no-ml no-mr">
                                <div class="col-xs-12 row_box cf">
                                    <a href="/Account/JobDetailsMaster.aspx?JobID=5">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Siemens Limited" src="http://localhost:65503/images/73816.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Opening for System Architect with Siemens" class="desig">Opening for System Architect with Siemens</span> <span class="exp"><em></em>10-15 yrs</span> <span class="loc"><em></em><span>Bengaluru/Bangalore</span> </span></div>
                                        </div>
                                    </a>
                                </div>
                                <%--/row_box--%>
                                <div class="col-xs-12 row_box cf">
                                    <a href="#">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Amazon Development Centre (India) Pvt. Ltd." src="http://localhost:65503/images/194374.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Amazon Hyderabad : Senior Software Development Engineer (SDE II)" class="desig">Amazon Hyderabad : Senior Software Development Engineer (SDE II)</span> <span class="exp"><em></em>4-9 yrs</span> <span class="loc"><em></em><span>Hyderabad / Secunderabad</span> </span></div>
                                        </div>
                                    </a>
                                </div>

                                <%--/row_box--%>
                                <div class="col-xs-12 row_box cf">
                                    <a href="#">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Volantis Technologies Pvt Ltd." src="http://localhost:65503/images/380043.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Java L2/l3 Testing" class="desig">Java L2/l3 Testing</span> <span class="exp"><em></em>3-8 yrs</span> <span class="loc"><em></em><span>Bengaluru/Bangalore</span> </span></div>
                                        </div>
                                    </a>
                                </div>
                                <%--/row_box--%>

                                <div class="col-xs-12 row_box cf">
                                    <a href="#">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Synopsys" src="http://localhost:65503/images/6697.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Senior Applications Consultant" class="desig">Senior Applications Consultant</span> <span class="exp"><em></em>5-10 yrs</span> <span class="loc"><em></em><span>Hyderabad / Secunderabad</span> </span></div>
                                        </div>
                                    </a>
                                </div>
                                <%--/row_box--%>
                            </div>
                            <%--/row--%>
                        </div>
                        <div role="tabpanel" class="tab-pane fade active" id="latest">
                            <div class="row no-ml no-mr">
                                <div class="col-xs-12 row_box cf">
                                    <a href="#">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Quadrangle Search" src="http://localhost:65503/images/1974.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Production Support Manager for Gurgaon Location" class="desig">Production Support Manager for Gurgaon Location</span> <span class="exp"><em></em>10-14 yrs</span> <span class="loc"><em></em><span>Delhi/NCR(National Capital Region), Gurgaon</span> </span></div>
                                        </div>
                                    </a>
                                </div>
                                <%--/row_box--%>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="it">
                            <div class="row no-ml no-mr">
                                <div class="col-xs-12 row_box cf">
                                    <a href="#">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Siemens Limited" src="http://localhost:65503/images/73816.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Opening for System Architect with Siemens" class="desig">Opening for System Architect with Siemens</span> <span class="exp"><em></em>10-15 yrs</span> <span class="loc"><em></em><span>Bengaluru/Bangalore</span> </span></div>
                                        </div>
                                    </a>
                                </div>
                                <%--/row_box--%>



                                <div class="col-xs-12 row_box cf">
                                    <a href="#">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Siemens Limited" src="http://localhost:65503/images/73816.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Opening for System Architect with Siemens" class="desig">Opening for System Architect with Siemens</span> <span class="exp"><em></em>10-15 yrs</span> <span class="loc"><em></em><span>Bengaluru/Bangalore</span> </span></div>
                                        </div>
                                    </a>
                                </div>
                                <%--/row_box--%>

                                <div class="col-xs-12 row_box cf">
                                    <a href="#">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Amazon Development Centre (India) Pvt. Ltd." src="http://localhost:65503/images/194374.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Amazon Hyderabad : Senior Software Development Engineer (SDE II)" class="desig">Amazon Hyderabad : Senior Software Development Engineer (SDE II)</span> <span class="exp"><em></em>4-9 yrs</span> <span class="loc"><em></em><span>Hyderabad / Secunderabad</span> </span></div>
                                        </div>
                                    </a>
                                </div>

                                <%--/row_box--%>
                                <div class="col-xs-12 row_box cf">
                                    <a href="#">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Volantis Technologies Pvt Ltd." src="http://localhost:65503/images/380043.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Java L2/l3 Testing" class="desig">Java L2/l3 Testing</span> <span class="exp"><em></em>3-8 yrs</span> <span class="loc"><em></em><span>Bengaluru/Bangalore</span> </span></div>
                                        </div>
                                    </a>
                                </div>
                                <%--/row_box--%>

                                <div class="col-xs-12 row_box cf">
                                    <a href="#">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Synopsys" src="http://localhost:65503/images/6697.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Senior Applications Consultant" class="desig">Senior Applications Consultant</span> <span class="exp"><em></em>5-10 yrs</span> <span class="loc"><em></em><span>Hyderabad / Secunderabad</span> </span></div>
                                        </div>
                                    </a>
                                </div>
                                <%--/row_box--%>
                            </div>
                            <%--/row--%>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="management">
                            <div class="row no-ml no-mr">
                                <a href="#" class="content" target="_blank">
                                    <div class="col-xs-12 row_box cf">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Amazon Development Centre (India) Pvt. Ltd." src="http://localhost:65503/images/194374.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Hiring Executive HR for Hyderabad Location " class="desig">Hiring Executive HR for Hyderabad Location </span><span class="exp"><em></em>4-9 yrs</span> <span class="loc"><em></em><span>Hyderabad / Secunderabad</span> </span></div>
                                        </div>
                                    </div>
                                </a>


                                <a href="#" class="content" target="_blank">
                                    <div class="col-xs-12 row_box cf">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Symbiosis Management Consultants" src="http://localhost:65503/images/1195.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Recruiter " class="desig">Recruiter </span><span class="exp"><em></em>10-15 yrs</span> <span class="loc"><em></em><span>Pune</span> </span></div>
                                        </div>
                                    </div>
                                </a>

                                <a href="#" class="content" target="_blank">
                                    <div class="col-xs-12 row_box cf">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="Symbiosis Management Consultants" src="http://localhost:65503/images/1195.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Software Designer (Sr Manager)" class="desig">Software Designer (Sr Manager)</span> <span class="exp"><em></em>5-10 yrs</span> <span class="loc"><em></em><span>Pune</span> </span></div>
                                        </div>
                                    </div>
                                </a>

                                <a href="#" class="content" target="_blank">
                                    <div class="col-xs-12 row_box cf">
                                        <div class="col-xs-2">
                                            <div class="banner">
                                                <img alt="ManpowerGroup Services India Private Limited" src="http://localhost:65503/images/742.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-10">
                                            <div class="rowDetails"><span title="Sr. VP - Customer Experience - E-commerce" class="desig">Sr. VP - Customer Experience - E-commerce</span> <span class="exp"><em></em>5-10 yrs</span> <span class="loc"><em></em><span>Bengaluru/Bangalore</span> </span></div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>
                    <%--/tabpanel--%>
                </div>
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="popup">
        <span class="button b-close"><span>
            <img src="../Content/Images/close-20.png" alt="pop close" /></span></span>
        <header class="form">
        <span class="logo">Advanced Search</span>
        </header>
        <div class="col-md-12">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="Container">
                    <div class="row col-md-12 pt pb">
                        <div style="display: none;" id="alertDanger">
                            <%-- <a href="#" class="close" data-dismiss="alert">&times;</a>
                            <strong>Error!</strong> <label id="lblAdvSrchErr"></label> --%>
                        </div>
                        <div class="f-l">
                            <label for="Sug_advKeyskills">Keyskills </label>
                        </div>
                        <div class="f-r">
                            <input id="txtAdvtags" class="txtAdvClass form-control" runat="server" type="search" name="txtSearchOther" placeholder="Skills, Designations, Companies" />
                        </div>
                    </div>
                    <div class="row col-md-12 pt pb">
                        <div class="f-l">
                            <label for="Sug_advLocation">Location </label>
                        </div>
                        <div class="f-r">
                            <input id="txtAdvLocation" class="form-control" runat="server" type="search" name="txtSearchLoc" placeholder="Location" />
                        </div>
                    </div>
                    <div class="row col-md-12 pt pb">
                        <div class="f-l">
                            <label for="adv_workExp_year">Work Experience </label>
                        </div>
                        <div class="f-r form-group form-inline">
                            <select class="form-control" id="ddlAdvExpYears" runat="server" name="SelExperiece">
                                <option value="0">Experience</option>
                                <option value="1">Fresher</option>
                                <option value="2">0</option>
                                <option value="3">1 </option>
                                <option value="4">2 </option>
                                <option value="5">3 </option>
                                <option value="6">4 </option>
                                <option value="7">5 </option>
                                <option value="8">6 </option>
                                <option value="9">7 </option>
                                <option value="10">8 </option>
                                <option value="11">9 </option>
                                <option value="12">10 </option>
                                <option value="13">>10 </option>
                            </select>
                            <label for="adv_workExp_year">Years </label>
                            <select class="form-control" id="Select2" runat="server" name="SelExperiece">
                                <option value="1">0</option>
                                <option value="2">1 </option>
                                <option value="3">2 </option>
                                <option value="4">3 </option>
                                <option value="5">4 </option>
                                <option value="6">5 </option>
                                <option value="7">6 </option>
                                <option value="8">7 </option>
                                <option value="9">8 </option>
                                <option value="10">9 </option>
                                <option value="11">10 </option>
                                <option value="12">11 </option>
                            </select>
                            <label for="adv_workExp_month">Month </label>
                        </div>
                    </div>
                    <div class="row col-md-12 pt pb">
                        <div class="f-l">
                            <label for="adv_exp_sal">Expected Salary </label>
                        </div>
                        <div class="f-r form-inline">
                            <select class="form-control" runat="server" id="ddlAdvSalMin" onchange="">
                                <option value="0">Min</option>
                                <option value="1"><1 Lac</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">>10</option>
                            </select>
                            <select class="form-control" runat="server" id="ddlAdvSalMax" onchange="">
                                <option value="0">Max</option>
                                <option value="1">1 Lac</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">>10</option>
                            </select>
                        </div>
                    </div>
                    <div class="row col-md-12 pt pb">
                        <div class="f-l">
                            <label for="inp_ddAdvIndusrty">Industry </label>
                        </div>
                        <div class="cf" style="margin-left: 220px;">
                            <select class="chosen-select form-control" id="ddlJobIndustry" aria-readonly="true" multiple="multiple" data-placeholder="Choose a Industry...">
                                <option value="1">Travel , Hotels , Restaurants , Airlines , Railways</option>
                                <option value="2">Textiles , Garments , Accessories</option>
                                <option value="3">Automobile , Auto Anciliary , Auto Components</option>
                                <option value="4">Chemicals , PetroChemical , Plastic , Rubber</option>
                                <option value="5">BPO , Call Centre , ITES</option>
                                <option value="6">Accounting , Finance</option>
                                <option value="7">FMCG , Foods , Beverage</option>
                                <option value="8">Consumer Electronics , Appliances , Durables</option>
                                <option value="9">Construction , Engineering , Cement , Metals</option>
                                <option value="10">Export , Import</option>
                                <option value="11">Banking , Financial Services , Broking</option>
                                <option value="12">IT-Hardware &amp; Networking</option>
                                <option value="13">Industrial Products , Heavy Machinery</option>
                                <option value="14">Insurance</option>
                                <option value="15">Courier , Transportation , Freight , Warehousing</option>
                                <option value="16">Media , Entertainment , Internet</option>
                                <option value="17">Medical , Healthcare , Hospitals</option>
                                <option value="18">Office Equipment , Automation</option>
                                <option value="19">Pharma , Biotech , Clinical Research</option>
                                <option value="20">Oil and Gas , Energy , Power , Infrastructure</option>
                                <option value="21">Retail , Wholesale</option>
                                <option value="22">IT-Software , Software Services</option>
                                <option value="23">Education , Teaching , Training</option>
                                <option value="24">Telecom,ISP</option>
                                <option value="25">Semiconductors , Electronics</option>
                                <option value="26">Other</option>
                                <option value="27">Architecture , Interior Design</option>
                                <option value="28">Fresher , Trainee , Entry Level</option>
                                <option value="29">Advertising , PR , MR , Event Management</option>
                                <option value="30">Agriculture , Dairy</option>
                                <option value="31">Recruitment , Staffing</option>
                                <option value="32">Gems , Jewellery</option>
                                <option value="33">Legal</option>
                                <option value="34">NGO , Social Services , Regulators , Industry Associations</option>
                                <option value="35">Printing , Packaging</option>
                                <option value="36">Real Estate , Property</option>
                                <option value="37">Security , Law Enforcement</option>
                                <option value="38">Fertilizers , Pesticides</option>
                            </select>
                        </div>
                        <i class="notif" id="ddAdvIndusrty_err">You can select at max 2 industries</i>
                    </div>
                    <div class="row col-md-12 pt pb">
                        <div class="f-l">
                            <label for="adv_jobCategory">Job Category </label>
                        </div>
                        <div class="cf" style="margin-left: 220px;">
                            <select class="chosen-select form-control" id="ddlJobCategory" aria-readonly="true" multiple="multiple" data-placeholder="Select your areas of expertise">
                                <option value="0" class="sAct">Select</option>
                                <option value="1" class="">Accounts, Finance, Tax, Company Secretary, Audit</option>
                                <option value="2">Architecture, Interior Design</option>
                                <option value="3" class="">Design, Creative, User Experience</option>
                                <option value="4">Hotels, Restaurants</option>
                                <option value="5">Journalism, Editing, Content</option>
                                <option value="6">Financial Services, Banking, Investments, Insurance</option>
                                <option value="7">Strategy, Management Consulting, Corporate Planning</option>
                                <option value="8">ITES, BPO, KPO, LPO, Customer Service, Operations</option>
                                <option value="9">Self Employed, Entrepreneur, Independent Consultant</option>
                                <option value="10">Export, Import, Merchandising</option>
                                <option value="11">Executive Assistant, Front Office, Data Entry</option>
                                <option value="12">HR, Recruitment, Administration, IR</option>
                                <option value="13">Legal, Regulatory, Intellectual Property</option>
                                <option value="14">Supply Chain, Logistics, Purchase, Materials</option>
                                <option value="15">Marketing, Advertising, MR, PR, Media Planning</option>
                                <option value="16">Medical, Healthcare, R&amp;D, Pharmaceuticals, Biotechnology</option>
                                <option value="18">Packaging</option>
                                <option value="19">Production, Manufacturing, Maintenance</option>
                                <option value="20">Site Engineering, Project Management</option>
                            </select>

                        </div>
                    </div>
                    <div class="row col-md-12 pt pb">
                        <div class="f-l">
                            <label>Job Type </label>
                        </div>
                        <div class="f-r">
                            <div class="nav">
                                  <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary active">
                                        <input type="radio" name="options" id="option1" autocomplete="off" checked="checked"/>
                                        All Jobs
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="radio" name="options" id="option2" autocomplete="off"/>
                                         Company Jobs
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="radio" name="options" id="option3" autocomplete="off"/>
                                        Consultant Jobs
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 pt pb" style="padding-right: 30px;">
                        <button id="adv_submit" class="blueBtn f-r" type="submit" onclick="return validateAdvSearch();">Search </button>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
