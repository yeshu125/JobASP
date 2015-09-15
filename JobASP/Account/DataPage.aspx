<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMaster.master" AutoEventWireup="true" CodeBehind="DataPage.aspx.cs" Inherits="JobASP.Account.DataPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProHeadContent" runat="server">
    <%--<script type="text/javascript">
        $(document).ready(function () {

            $.ajax({
                type: "POST",
                url: "http://localhost:65503/Account/JQGridHandler.ashx?id=1",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //$('#tblData').dataTable({
                    //    "processing": true,
                    //    "serverSide": true,
                    //    "data": response.d,
                    //    "columns": [
                    //        { "title": "JobId" },
                    //        { "title": "JobPosition" },
                    //        { "title": "CompanyName" },
                    //        { "title": "State", "class": "center" },
                    //        { "title": "Skill", "class": "center" }
                    //    ]
                    //});
                }
            });

        });
    </script>--%>
    <link href="../Content/chosen.css" rel="stylesheet" />
    <link href="../Content/prism.css" rel="stylesheet" />
    <link href="../Content/jqx.bootstrap.css" rel="stylesheet" />
  
    <script src="../Scripts/chosen.proto.js"></script>
    <script src="../Scripts/chosen.jquery.js"></script>
    <script src="../Scripts/prism.js"></script>
    <style>
        #page {
            margin: 0 auto 50px;
            position: relative;
            width: 920px;
        }

        .button {
            background-color: #2b91af;
            border-radius: 10px;
            box-shadow: 0 2px 3px rgba(0,0,0,0.3);
            color: #fff;
            cursor: pointer;
            display: inline-block;
            padding: 10px 20px;
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
                background-color: #1e1e1e;
            }

            .button > span {
                font-size: 84%;
            }

            .button.b-close, .button.bClose {
                border-radius: 7px 7px 7px 7px;
                box-shadow: none;
                font: bold 131% sans-serif;
                padding: 0 6px 2px;
                position: absolute;
                right: -7px;
                top: -7px;
            }


        #popup {
            background-color: #fff;
            border-radius: 10px 10px 10px 10px;
            box-shadow: 0 0 25px 5px #999;
            color: #111;
            display: none;
            min-width: 550px;
            padding: 20px;
            min-height: 250px;
        }

            #popup .logo {
                color: #2b91af;
                font: bold 325% 'Petrona',sans;
            }

 .Page_Dimmer
{
    position: fixed;
    height: 100%;
    width: 100%;
    top: 0px;
    left: 0px;
    background-color: #000;
    filter: alpha(opacity=50);
    -moz-opacity: 0.5;
    opacity: 0.5;
    z-index: 50;
}

.PopupHolder
{
    position:absolute;
   /* overflow: auto;*/
    background-color: #fff;
    z-index: 50;
    top:40%;
    left:20%;
    right:20%;
    max-width:700px;
    vertical-align:middle;
  
    margin: 0px auto;
    border-radius:10px;
}

    </style>
    <script src="../Scripts/jquery.bpopup.min.js"></script>
    <script type="text/javascript">
        function popshow() {
          
            return false;
        }
        $(function () {

          
          
            
           $(".chosen-select-no-single").chosen({ max_selected_options: 4 });

            (function (a) {
                var m = a("#popup"),
                    n = a("#popup2"),
                    d = 0;
                a(function () {
                    a(".small.special").on("open.bpopup", function () {
                        alert("I'm special")
                    });
                    a("body").on("click", ".small", function () {
                        var c = a(this).hasClass("pop1") ? m : n,
                            h = a(".content"),
                            j = a(this);
                        if (a(this).hasClass("events")) c.bPopup({
                            onOpen: function () {
                                alert("onOpen fired")
                            },
                            onClose: function () {
                                alert("onClose fired")
                            }
                        }, function () {
                            alert("Callback fired")
                        });
                        else if (a(this).hasClass("random")) {
                            var e = b(0, a(window).width() - 500),
                                p = b(a(document).scrollTop(), a(document).scrollTop() + a(window).height() - 300),
                                k = 3 == b(0, 4),
                                l = b(0, 2),
                                f = "fadeIn",
                                g = 350;
                            1 === l ? (f = "slideDown", g = 600) : 2 === l && (f = "slideIn", g = 500);
                            c.bPopup({
                                follow: k ? [!0, !0] : [!1, !1],
                                position: !k ? [e, p] : ["auto", "auto"],
                                opacity: "0." + b(1, 9),
                                positionStyle: 25 == b(0, 50) ? "fixed" : "absolute",
                                modal: 0 == b(0, 10) ? !1 : !0,
                                modalClose: 0 == b(0, 5) ? !1 : !0,
                                modalColor: "hsl(" + b(0, 360) + ",100%, 50%)",
                                transition: f,
                                speed: g
                            })
                        } else a(this).hasClass("x-content") ? c.bPopup({
                            onOpen: function () {
                                h.html(j.data("bpopup") || {})
                            },
                            onClose: function () {
                                h.empty()
                            }
                        }) : a(this).hasClass("multi") ? (d++, c = b(0, a(window).width() - 500), e = b(a(document).scrollTop(), a(document).scrollTop() + a(window).height() - 300), a('<div class="bMulti"><span class="button bClose close' + d + '"><span>X</span></span><p>' + d + '</p><a class="button small multi">Pop another up</a></div>').bPopup({
                            closeClass: "close" + d,
                            position: [c, e],
                            follow: [!1, !1],
                            onClose: function () {
                                d--;
                                a(this).remove()
                            }
                        })) : c.bPopup(j.data("bpopup") || {})
                    })
                });
                var b = function (a, b) {
                    return ~~(Math.random() * (b - a + 1) + a)
                }
            })(jQuery);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ProMainContent" runat="server">

<%--<div class="Page_Dimmer" id="divPageDimmer" runat="server" style="display:none">
&nbsp;
</div>
<div class="PopupHolder" id="divPopupHolder" runat="server" style="display:none">--%>
      <select id="ddlAdvIndustrySel" class="chosen-select-no-single" style="width: 350px;" data-placeholder="Choose a Industry...">
        <option></option>
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
    <select>
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
<%--</div>--%>

<button style="padding:4px 16px;" id="Button1" onclick="return popshow();">Test</button>

       <div id='jqxWidget'>
            <button style="padding:4px 16px;" id="Left" >
                Left</button>
            <button style="padding:4px 16px;" id="Center">
                Center</button>
            <button style="padding:4px 16px;" id="Right">
                Right</button>
        </div>
       

  
    <section>

        <div id="page">
            <ul>
                <li>

                    <span class="button small pop1">Pop it up</span>

                    <pre>
       
                </pre>
                </li>
            </ul>
        </div>
        <div id="popup">
            <span class="button b-close"><span>X</span></span>
            <span class="logo">Advanced Search</span>
            <div class="col-md-12">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="Container">
                        <div class="row col-md-12 pt pb">
                            <div class="f-l">
                                <label for="Sug_advKeyskills">Keyskills </label>
                            </div>
                            <div class="f-r">
                                <input id="txtAdvtags" class="" runat="server" type="search" name="txtSearchOther" placeholder="Skills, Designations, Companies" />
                            </div>
                        </div>
                        <div class="row col-md-12 pt pb">
                            <div class="f-l">
                                <label for="Sug_advLocation">Location </label>
                            </div>
                            <div class="f-r">
                                <input id="txtAdvLocation" runat="server" type="search" name="txtSearchLoc" placeholder="Location" />
                            </div>
                        </div>
                        <div class="row col-md-12 pt pb">
                            <div class="f-l">
                                <label for="adv_workExp_year">Work Experience </label>
                            </div>
                            <div class="f-r">
                                <select class="" id="selExperience" runat="server" name="SelExperiece" style="border-left: 1px solid #bbb; border-bottom: 3px solid #bbb; border-top: 3px solid #bbb; border-right: 1px solid #bbb;">
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
                                <select class="" id="Select1" runat="server" name="SelExperiece" style="border-left: 1px solid #bbb; border-bottom: 3px solid #bbb; border-top: 3px solid #bbb; border-right: 1px solid #bbb;">
                                    <option value="1">Fresher</option>
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
                                    <option value="13">12 </option>
                                </select>
                                <label for="adv_workExp_month">Month </label>
                            </div>
                        </div>
                        <div class="row col-md-12 pt pb">
                            <div class="f-l">
                                <label for="adv_exp_sal">Expected Salary </label>
                            </div>
                            <div class="f-r">
                                <select class="nScrollable" runat="server" id="SelSalary" style="border-left: 1px solid #bbb; border-bottom: 3px solid #bbb; border-top: 3px solid #bbb; border-right: 1px solid #bbb;">
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
                                <select class="nScrollable" runat="server" id="Select2" style="border-left: 1px solid #bbb; border-bottom: 3px solid #bbb; border-top: 3px solid #bbb; border-right: 1px solid #bbb;">
                                    <option value="0">Max</option>
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
                            </div>
                        </div>
                        <div class="row col-md-12 pt pb">
                            <div class="f-l">
                                <label for="inp_ddAdvIndusrty">Industry </label>
                            </div>
                            <div class="f-r">
                                <input class="srchTxt" type="text" name="" placeholder="Select the industry where you want to work" autocomplete="off" />
                            </div>
                            <i class="notif" id="ddAdvIndusrty_err">You can select at max 2 industries</i>
                        </div>
                        <div class="row col-md-12 pt pb">
                            <div class="f-l">
                                <label for="adv_jobCategory">Job Category </label>
                            </div>
                            <div class="f-r">
                                <input id="adv_jobCategory" class="input-append dropdown-toggle" data-toggle="dropdown" type="text" name="" placeholder="Select your areas of expertise" rel="" readonly="readonly" autocomplete="off" tabindex="-1" />
                            </div>
                        </div>
                        <div class="row col-md-12 pt pb">
                            <div class="f-l">
                                <label>Job Type </label>
                            </div>
                            <div class="f-r">
                                <div class="nav">
                                    <a href="javascript:" class="btn-secondary btn btn-sm" style="padding: 3px;">All Jobs </a>
                                    <a href="javascript:" class="btn-secondary btn btn-sm" style="padding: 3px;">Company Jobs </a>
                                    <a href="javascript:" class="btn-secondary btn btn-sm" style="padding: 3px;">Consultant Jobs </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 pt pb" style="padding-right: 30px;">
                            <button id="adv_submit" class="blueBtn f-r" type="submit">Search </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
        --%>




        <div id="Div1">
            <ul>
                <li>
                    <h3 class="header">1. HELLO WORLD</h3>
                    <span class="button small pop1">Pop it up</span>
                    <span class="example">
                        <strong>Example 1, default: </strong>
                        <em>Simple jQuery modal popup with default settings (Hello World popup)</em>
                    </span>
                    <pre>
        $(<span class="code-string">'element_to_pop_up'</span>).bPopup();
                </pre>
                </li>
                <li>
                    <h3 class="header">2. CUSTOM SETTINGS</h3>
                    <span class="button small pop1" data-bpopup='{"follow":[false,false],"position":[150,400]}'>Pop it up</span>
                    <span class="example">
                        <strong>Example 2a, custom settings: </strong>
                        <em>Simple jQuery popup with custom settings (Lazy popup, not going anywhere)</em>
                    </span>
                    <pre>
        $(<span class="code-string">'element_to_pop_up'</span>).bPopup({
            follow: [<span class="code-function">false</span>, <span class="code-function">false</span>],<span class="code-comment"> //x, y</span>
            position: [<span class="code-int">150</span>, <span class="code-int">400</span>]<span class="code-comment"> //x, y</span>
        });
                </pre>
                </li>
                <li>
                    <span class="button small pop1" data-bpopup='{"modalClose":false,"opacity":0.6,"positionStyle":"fixed"}'>Pop it up</span>
                    <span class="example">
                        <strong>Example 2b, custom settings: </strong>
                        <em>Simple jQuery popup with custom settings part 2 (Sticky popup)</em>
                    </span>
                    <pre>
        $(<span class="code-string">'element_to_pop_up'</span>).bPopup({
            modalClose: <span class="code-function">false</span>,
            opacity: <span class="code-int">0.6</span>,
            positionStyle: <span class="code-string">'fixed'</span><span class="code-comment"> //'fixed' or 'absolute'</span>
        });
                </pre>
                </li>
                <li>
                    <span class="button small pop1" data-bpopup='{"fadeSpeed":"slow", "followSpeed":1500, "modalColor":"greenYellow"}'>Pop it up</span>
                    <span class="example">
                        <strong>Example 2c, custom settings: </strong>
                        <em>Simple jQuery popup with custom settings part 3 (Jamaican popup, relax man)</em>
                    </span>
                    <pre>
        $(<span class="code-string">'element_to_pop_up'</span>).bPopup({
            fadeSpeed: <span class="code-string">'slow'</span>,<span class="code-comment"> //can be a string ('slow'/'fast') or int</span>
            followSpeed: <span class="code-int">1500</span>,<span class="code-comment"> //can be a string ('slow'/'fast') or int</span>
            modalColor: <span class="code-string">'greenYellow'</span>
        });
                </pre>
                </li>
            </ul>
        </div>
        <div id="popup">
            <span class="button b-close"><span>X</span></span>
            <span class="logo">bPopup</span>If you can't get it up use
        </div>
    </section>


    <section>
    </section>

</asp:Content>
