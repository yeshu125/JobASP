<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="JobASP.Test" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%--<%@  Register TagPrefix="uc" TagName="Skill" Src="~/Account/SkillSet.ascx" %>--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

   





    <link href="../Content/ui-lightness/jquery-ui-1.10.4.custom.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.9.0.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>
 
  
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tabs').tabs();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
       
        <script src="Scripts/index.js" type="text/javascript"></script>
        <script src="Scripts/jquery.smartWizard.js" type="text/javascript"></script>
        <%--     <script type="text/javascript">
            $(document).ready(function () {

                //  Wizard 2
                $('#wizard2').smartWizard({ transitionEffect: 'slide', onFinish: onFinishCallback });
                function onFinishCallback() {
                    var val = Page_ClientValidate();
                    if (!val) {
                        return false;
                    }
                    var dataobj = [];
                    dataobj[0] = $('#' + '<%=txtName.ClientID%>').val();
                    dataobj[1] = $('#' + '<%=txtLName.ClientID%>').val();
                    dataobj[2] = $('#' + '<%=ddlGender.ClientID%> option:selected').text();
                    dataobj[3] = $('#' + '<%=txtDOB.ClientID%>').val();
                    dataobj[4] = $('#' + '<%=ddlCountry.ClientID%> option:selected').text();
                    dataobj[5] = $('#' + '<%=ddlState.ClientID%> option:selected').text();
                    dataobj[6] = $('#' + '<%=ddlCity.ClientID%> option:selected').text();
                    dataobj[7] = $('#' + '<%=txtIndustry.ClientID%>').val();
                    dataobj[8] = $('#' + '<%=ddlSkillSet.ClientID%> option:selected').text();
                    dataobj[9] = $('#' + '<%=txtSkillList.ClientID%>').val();
                    dataobj[10] = $('#' + '<%=txtTotalExperience.ClientID%>').val();
                    dataobj[11] = $('#' + '<%=txt10thPercent.ClientID%>').val();
                    dataobj[12] = $('#' + '<%=txtInterPercent.ClientID%>').val();
                    dataobj[13] = $('#' + '<%=rdoLstSelect.ClientID%> input:checked').val();
                    dataobj[14] = $('#' + '<%=txtGradPercent.ClientID%>').val();
                    dataobj[15] = $('#' + '<%=txtPGPercent.ClientID%>').val();
                    dataobj[16] = $('#' + '<%=txtPhNum.ClientID%>').val();
                    dataobj[17] = $('#' + '<%=txtEmailID.ClientID%>').val();
                    dataobj[18] = $('#' + '<%=txtPassword.ClientID%>').val();
                    $.ajax({
                        type: "POST",
                        url: "Test.aspx/CollectData",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ 'obj': dataobj }),
                        success: SuccessTestService,
                        dataType: "json",
                        failure: ajaxCallFailed
                    });
                    return true;
                }
                function SuccessTestService(responce) {
                    alert("Success");
                }
                function ajaxCallFailed(error) {
                    alert('error: ' + error);
                }
            });
        </script>--%>


        <ajax:ToolkitScriptManager runat="server" />

      <%--  <div class="imgL">
            <h2 class="f16"></h2>
            <h2 class="_title">Top Employers</h2>

            <table border="0" cellpadding="0" cellspacing="14">
                <tbody>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3159453&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEL/ti-panel-120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3149497&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/eric-120X45-3.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147513&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TRHS/techm-120x45-07012015.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147473&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/lnt-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147495&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/novartis-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3148835&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/ibm-120X45-12.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147543&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/deloittepanel-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147497&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/ltinfotech-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147523&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/wipro-pk-120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147533&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/utc-120X45-31122014.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147553&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/xerox-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3146961&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/cisco1-sk-120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147517&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/aricent-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147509&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/broadcom-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147545&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/airtel-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147511&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/mindtree-120X45-05012015-1.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147507&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/capco-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147521&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/aditya-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147535&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/tata-technologies-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147491&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/ustglobal27_201202_120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147471&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/ion08012915.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3145173&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/fis120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3151823&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/gi-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147559&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/tuv-30sept13_120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147541&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/bapco_120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3106421&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/wns-pk-120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147499&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/akcgroup_120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147501&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/biocon-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147519&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/mphasis-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147527&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/meil-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147531&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/msnlabs120x45-080612-01.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147539&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/oracle-india-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147547&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/escort-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3158229&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/virtusa-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3146949&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/xchangingX120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147493&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/altisource_120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147525&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/infinite-india-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147549&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/flsmidth-120X45-1.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147503&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/jda-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147557&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/idc-sk-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3151413&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/amazon-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147537&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/prokarma-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147657&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/bartronics_120x45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3151463&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEL/sierra-panel-120x45-1.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147529&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/srp_banners/lifestyle-120X45-30122014.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3147505&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TEB/indus-towers-120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3151423&amp;othersrcp=" target="_blank">
                            <img src=" http://bms.naukimg.com/banner/banners2014/srp_banners/tech120X45.gif" border="0"></a></td>
                    </tr>
                    <tr>
                        <td><a href="http://w28.naukri.com/advertiser/bms_hits.php?banner=3148483&amp;othersrcp=" target="_blank">
                            <img src="http://bms.naukimg.com/banner/banners2014/TRHS/dtdc-120x45.gif" border="0"></a></td>
                    </tr>
                </tbody>
            </table>
            <img style="display: none;" class="" src="http://w28.naukri.com/advertiser/bms_logimpressions.php?banlist=3159453,3149497,3147513,3147473,3147495,3148835,3147543,3147497,3147523,3147533,3147553,3146961,3147517,3147509,3147545,3147511,3147507,3147521,3147535,3147491,3147471,3145173,3151823,3147559,3147541,3106421,3147499,3147501,3147519,3147527,3147531,3147539,3147547,3158229,3146949,3147493,3147525,3147549,3147503,3147557,3151413,3147537,3147657,3151463,3147529,3147505,3151423,3148483" width="0" height="0">
        </div>--%>

      <%-- <div class="cmplogo_roller">
        					<div class="cmplogo_roller_inner">
							<div class="header">Employers of Choice</div>
        						<div class="cmplogo_rollerlist">
                						<ul class="cmp_slide" style="margin-left: 0px;"><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10294&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fcognin%2F%20" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/cognizant_160x60_border.gif" alt="Cognizant-IT and Technology Jobs" title="Cognizant-IT and Technology Jobs" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front9509&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fltitin%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/l&amp;t_infotech_160x60_border.gif" alt="Jobs at Larsen &amp; Toubro" title="Jobs at Larsen &amp; Toubro" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10375&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Finfinitecsin%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/infinite_160x60_border.gif" alt="infinite-IT Job opprtunities" title="infinite-IT Job opprtunities" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10152&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fmbtin%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/tech_mahindra_160x60_border.gif" alt="Tech Mahindra- IT Job opportunities" title="Tech Mahindra- IT Job opportunities" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10241&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fwiproin%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/wipro_160x60_border.gif" alt="Wipro- IT Job opportunites" title="Wipro- IT Job opportunites" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10297&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fsynechronin%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/syn.jpg" alt="Synechron- IT Job opportunites" title="Synechron- IT Job opportunites" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front9819&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fpersistentin%2Findex.html" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/persistent_160x60_border.gif" alt="Persistent- Technology Jobs" title="Persistent- Technology Jobs" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10357&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fvirtin%2Fjobs.html" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/virtela_160x60_border.gif" alt="Virtela- Technology Jobs" title="Virtela- Technology Jobs" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10426&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fdelllpin%2Findex.html" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/Deloitte_160x60_border.gif" alt="Deloitte-Jobs in Audit,Consulting and more" title="Deloitte-Jobs in Audit,Consulting and more" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10499&amp;url=http%3A%2F%2Fwww.convergysindia.in%2Fcareers.php" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/convergys_160x60_border.gif" alt="Convergys- Jobs in BPO" title="Convergys- Jobs in BPO" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10506&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fmindtree_in%2Fcareer.html" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/Mindtree_160_60_border.gif" alt="Mindtree-IT Job opportunities" title="Mindtree-IT Job opportunities" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10298&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fcybernetin%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/css_corp_160x60_border.gif" alt="CSS Corp- Technology Jobs" title="CSS Corp- Technology Jobs" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10505&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fpolarisin%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/polaris_160x60_border.gif" alt="Polaris- Technology Jobs" title="Polaris- Technology Jobs" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10300&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fwfisin%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/wellsFargo_160x60_border.gif" alt="Wells Fargo- Jobs in banking industry" title="Wells Fargo- Jobs in banking industry" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10521&amp;url=http%3A%2F%2Fjobsearch.monsterindia.com%2Fsearchresult.html%3Fcid%3D10702%3Blan%3D1%20" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/TIBCO_160x60_boder.gif" alt="TIBCO- IT Job opportunites" title="TIBCO- IT Job opportunites" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10530&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fibmindiain%2Fnews.html" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/IBM_160x60_border.gif" alt="IBM- Jobs at IBM" title="IBM- Jobs at IBM" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10532&amp;url=http%3A%2F%2Fjobsearch.monsterindia.com%2Fsearchresult.html%3Fcid%3D213886%3Blan%3D1" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/Honeywell_160x60_border.gif" alt="Jobs at Honeywell" title="Jobs at Honeywell" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10541&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fmicrochip%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/microchip_160x60_border.gif" alt="Jobs at Microchip" title="Jobs at Microchip" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10548&amp;url=http%3A%2F%2Fjobsearch.monsterindia.com%2Fsearchresult.html%3Fcid%3D7872%3Blan%3D1" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/HCL_160x600_border.gif" alt="HCL- IT Job opportunities" title="HCL- IT Job opportunities" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10387&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2FTurner_aacin%2Findex.html" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/turner_miller_160x60_border.gif" alt="Turner&amp;Miller- Technology Jobs" title="Turner&amp;Miller- Technology Jobs" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10461&amp;url=http%3A%2F%2Fjobsearch.monsterindia.com%2Fsearchresult.html%3Fcid%3D64096%3Blan%3D1" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/barclays_160x60_border.gif" alt="Barclays- Technology Jobs" title="Barclays- Technology Jobs" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10556&amp;url=http%3A%2F%2Fjobsearch.monsterindia.com%2Fsearchresult.html%3Fcid%3D210704%3Blan%3D1" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/Softek_160x60_border.gif" alt="Softtek- IT Job opportunites" title="Softtek- IT Job opportunites" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10555&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Fcybagein%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/Cybage_160x60_border.gif" alt="Cybage- Software and IT Jobs" title="Cybage- Software and IT Jobs" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10566&amp;url=http%3A%2F%2Fjobsearch.monsterindia.com%2Fsearchresult.html%3Fcid%3D1544%3Blan%3D1%20" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/geometric_160x60_border.gif" alt="Jobs at Geometric" title="Jobs at Geometric" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10549&amp;url=http%3A%2F%2Fjobsearch.monsterindia.com%2Fsearchresult.html%3Fcid%3D206016%3Blan%3D1" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/genpact_160x60_border.gif" alt="Jobs at Genpact India" title="Jobs at Genpact India" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10567&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Faccenturein%2F" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/acebytg.gif?0.610895259476411&amp;" alt="" title="" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front10580&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Faltisbsin%2Fcurrent_openings.html" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/logo_altisource160x60.jpg" alt="Jobs at Altisource" title="Jobs at Altisource" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li><li class="cmpslide_item"> 
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front8646&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Ftcsin%2Findex.html" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/tcs_160x60_border.gif?0.480763245458974&amp;" alt="TCS   IT Jobs in India" title="TCS   IT Jobs in India" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								
                        								<a href="http://www.monsterindia.com/tracker.html?banner_id=Front9510&amp;url=http%3A%2F%2Fcompany.monsterindia.com%2Flntin%2Findex.html" class="shd_comm cmp_link" target="_blank">
                        									<img border="0" src="http://media.monsterindia.com/logos/l&amp;t_160x60_border.gif" alt="Jobs at Larsen &amp; Toubro" title="Jobs at Larsen &amp; Toubro" class="grayscale grayscale-fade">
                    									</a>
                    									<div class="cmp_spacer"></div>
                								</li></ul>
        						</div>
        						<div class="nav lft" data-direction="lt"></div>
        						<div class="nav rht" data-direction="rt"></div>
    						</div>
					</div>
 <div id="tabs" style="width: 60%">
                            <ul>
                                <li style="width: 20%; text-align: center;"><a style="text-align: center; width: 80%;"
                                    href="#tbl1">First</a></li>
                                <li style="width: 20%; text-align: center;"><a style="text-align: center; width: 80%;"
                                    href="#tbl2">Second</a></li>
                                <li style="width: 20%; text-align: center;"><a style="text-align: center; width: 80%;"
                                    href="#tbl3">Third</a></li>
                                <li style="width: 20%; text-align: center;"><a style="text-align: center; width: 80%;"
                                    href="#tabs-4">Four</a></li>
                            </ul>
                            <table border="2" cellpadding="0" id="tbl1" style="text-align: center" width="50%"
                                style="height: 0%;" cellspacing="0">
                                <tr>
                                    <td align="center" scope="col" style="width: 10%">
                                       
                                    </td>
                                </tr>
                            </table>
                            <table border="3" cellpadding="0" id="tbl2" cellspacing="0">
                                <tr>
                                    <td align="center" scope="row">
                                       
                                    </td>
                                </tr>
                            </table>
                            <table border="4" id="tbl3" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center" scope="row">
                                       
                                    </td>
                                </tr>
                            </table>
                            <div id="tabs-4" style="width: 90%; height: 50%">
                            </div>
                        </div>



        

</div>

   
        <div class="demoHead">
        </div>
      --%>  <table align="center" border="0" cellpadding="0" cellspacing="0">
            <%--  <tr>
                <td>&nbsp;
                       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="RegGroup1" DisplayMode="BulletList" ForeColor="Red" ShowSummary="true" />
                    <asp:Label Text="" ID="lblRegErr" runat="server" />
                    <h3>Seeker Registration</h3>

                    <!-- Smart Wizard wizard2-->
                    <div id="wizard2" class="swMain">
                        <ul>
                            <li><a href="#step-1">
                                <label class="stepNumber">1</label>
                                <span class="stepDesc">Personal<br />
                                    <small>Personal Information</small>
                                </span>
                            </a></li>
                            <li><a href="#step-2">
                                <label class="stepNumber">2</label>
                                <span class="stepDesc">Professional<br />
                                    <small>Professional Details</small>
                                </span>
                            </a></li>
                            <li><a href="#step-3">
                                <label class="stepNumber">3</label>
                                <span class="stepDesc">Educational<br />
                                    <small>Education Details</small>
                                </span>
                            </a></li>
                            <li><a href="#step-4">
                                <label class="stepNumber">4</label>
                                <span class="stepDesc">General<br />
                                    <small>General Information</small>
                                </span>
                            </a></li>
                        </ul>
                        <div id="step-1">
                            <h2 class="StepTitle">Personal Information</h2>
                            <table width="100%" align="center" cellpadding="2" class="table table-striped" cellspacing="10" border="0">
                                <tr>
                                    <td width="15%"></td>
                                    <td width="20%">Name</td>
                                    <td width="30%">
                                        <asp:TextBox runat="server" ID="txtName" Width="90%" /></td>
                                    <td width="35%">
                                        <asp:RequiredFieldValidator Display="None" ValidationGroup="RegGroup1" ForeColor="red" ID="RequiredFieldValidator1" ErrorMessage="Name  is Required " ControlToValidate="txtName" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Last Name</td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtLName" Width="90%" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ForeColor="red" ValidationGroup="RegGroup1" ID="RequiredFieldValidator2" ErrorMessage="Last Name is Required" ControlToValidate="txtLName" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Gender</td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlGender" Width="91%" CssClass="CssDDL" align="center">
                                            <asp:ListItem Text="Male" Enabled="true" Value="0" />
                                            <asp:ListItem Text="Female" Value="1" />
                                        </asp:DropDownList></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Date Of Birth
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ReadOnly="false" onkeypress="return false;" onpaste="return false;" ViewStateMode="Enabled" ID="txtDOB" ValidationGroup="RegGroup1" AutoCompleteType="None" Width="90%" />
                                        <ajax:CalendarExtender ID="AjaxCalDOB" DefaultView="Years" runat="server" PopupButtonID="txtDOB" TargetControlID="txtDOB" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator3" ValidationGroup="RegGroup1" ForeColor="Red" ErrorMessage="Please Select Your Date of Birth" ControlToValidate="txtDOB" runat="server" />
                                        <asp:RangeValidator Display="None" ErrorMessage="Age should be Greaterthan 14 and Lessthan 60" ControlToValidate="txtDOB" runat="server" ForeColor="Red" Type="Date" ID="rngValDOB" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Country</td>
                                    <td>
                                        <asp:DropDownList ID="ddlCountry" ValidationGroup="RegGroup1" CssClass="CssDDL" Width="92%" runat="server" />
                                        <ajax:CascadingDropDown ID="CountryCascading" runat="server" Category="Country" TargetControlID="ddlCountry" LoadingText="Loading Countries..." PromptText="Select Country" ServiceMethod="BindCountry" ServicePath="~/CCDDLWebService.asmx" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator4" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select Country" ControlToValidate="ddlCountry" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>State</td>
                                    <td>
                                        <asp:DropDownList ID="ddlState" Style="text-align: center" Width="92%" CssClass="CssDDL" runat="server" ValidationGroup="RegGroup1" />
                                        <ajax:CascadingDropDown ID="StateCascading" runat="server" Category="State" TargetControlID="ddlState" ParentControlID="ddlCountry" LoadingText="Loading States..." PromptText="Select State" ServiceMethod="BindState" ServicePath="~/CCDDLWebService.asmx" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator5" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select State" ControlToValidate="ddlState" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>City</td>
                                    <td>
                                        <asp:DropDownList ID="ddlCity" Style="text-align: center" CssClass="CssDDL" Width="92%" runat="server" ValidationGroup="RegGroup1" />
                                        <ajax:CascadingDropDown ID="CityCascading" runat="server" Category="Region" TargetControlID="ddlCity" ParentControlID="ddlState" LoadingText="Loading Cities..." PromptText="Select City" ServiceMethod="BindCity" ServicePath="~/CCDDLWebService.asmx" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator6" ForeColor="red" ValidationGroup="RegGroup1" ErrorMessage="Please Select City" ControlToValidate="ddlCity" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="step-2">
                            <h2 class="StepTitle">Professional Details</h2>
                            <table width="100%" align="center" cellpadding="0" class="table table-striped" style="text-align: left;" cellspacing="10" border="0">
                                <tr align="center">
                                    <td></td>
                                    <td>Industry
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtIndustry" Width="92%" />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr align="center">
                                    <td width="15%"></td>
                                    <td width="20%">Primary Skill
                                    </td>
                                    <td width="35%">
                                        <%--<select runat="server" id="ddlSkillSetHtml" multiple="true" placeholder="Please select appropriate options" class="SlectBox" />--%>
            <%--  <asp:DropDownList runat="server" ID="ddlSkillSet" CssClass="CssDDL" Width="92%" ValidationGroup="RegGroup2" />
                                    </td>
                                    <td width="30%">
                                        <asp:RequiredFieldValidator Display="None" ForeColor="red" ValidationGroup="RegGroup2" ErrorMessage="Please Select your Primary Skill" InitialValue="Select" ControlToValidate="ddlSkillSet" runat="server" />
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td width="15%"></td>
                                    <td width="20%">Other Skills
                                    </td>
                                    <td width="35%">
                                        <asp:TextBox runat="server" onkeypress="return lettersWithCommaOnly(event);" Width="92%" ID="txtSkillList" /><br />
                                        Enter your other Skills Seperated by a comma(,)
                                        <%--<asp:DropDownList runat="server" ID="ddlSkillSet" CssClass="CssDDL" Width="92%" ValidationGroup="RegGroup2" />--%>
            <%--  </td>
                                    <td width="30%">
                                        <asp:Label Text="" ID="lblSkillSetErr" runat="server" />
                                    </td>
                                </tr>
                                <%--  <tr align="center">
                                    <td></td>
                                    <td>Designation</td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtDesignation" Width="90%" ValidationGroup="RegGroup2" /></td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ForeColor="Red" ValidationGroup="RegGroup2" ID="RequiredFieldValidator7" ErrorMessage=" Designation to be entered" ControlToValidate="txtDesignation" runat="server" /></td>
                                </tr>
                                  <tr align="center">
                                            <td></td>
                                            <td>Company</td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtCompany" Width="90%" ValidationGroup="RegGroup2" />
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator Display="None" ForeColor="red" ValidationGroup="RegGroup2" ErrorMessage="Please enter your Company Name" ID="rfvCompanyName" ControlToValidate="txtCompany" runat="server" />
                                            </td>
                                        </tr>--%>
            <%--   <tr align="center">
                                    <td></td>
                                    <td>Total Experience
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtTotalExperience" Width="90%" ValidationGroup="RegGroup2" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ForeColor="red" ValidationGroup="RegGroup2" ErrorMessage="Please enter your Total Experience" ID="rfvTotalExperience" ControlToValidate="txtTotalExperience" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="step-3">
                            <h2 class="StepTitle">Educational Details</h2>
                            <table width="100%" align="center" cellpadding="0" class="table table-striped" cellspacing="10" border="0">
                                <tr>
                                    <td width="15%"></td>
                                    <td width="30%">10<sup>th</sup> Percentage:</td>
                                    <td width="25%">
                                        <asp:TextBox runat="server" MaxLength="3" onkeypress="return blockNonNumbers(this,event)" Width="80%" ID="txt10thPercent" />%
                                    </td>
                                    <td width="30%">
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator8" ValidationGroup="RegGroup3" ErrorMessage="Please enter your 10th Percentage" ControlToValidate="txt10thPercent" runat="server" ForeColor="Red" />
                                        <asp:RangeValidator Display="None" ID="RangeValidator1" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txt10thPercent" runat="server" MinimumValue="1" MaximumValue="100" Type="Integer" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Inter Percentage:</td>
                                    <td>
                                        <asp:TextBox runat="server" MaxLength="3" onkeypress="return blockNonNumbers(this,event)" Width="80%" ID="txtInterPercent" />%
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator9" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Inter marks" ControlToValidate="txtInterPercent" runat="server" ForeColor="Red" />
                                        <asp:RangeValidator Display="None" ID="RangeValidator2" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtInterPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Graduation :</td>
                                    <td>
                                        <asp:RadioButtonList runat="server" ID="rdoLstSelect" RepeatDirection="Horizontal">
                                            <asp:ListItem Text="Degree" Value="Degree" Selected="False" />
                                            <asp:ListItem Text="B.Tect" Value="B.Tect" />
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator10" ErrorMessage="Please select one option" ValidationGroup="RegGroup3" ForeColor="Red" ControlToValidate="rdoLstSelect" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Graduation Percentage :
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" MaxLength="3" onkeypress="return blockNonNumbers(this,event)" ID="txtGradPercent" ValidationGroup="RegGroup3" Width="80%" />%
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator11" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Graduation marks" ControlToValidate="txtGradPercent" runat="server" ForeColor="Red" />
                                        <asp:RangeValidator Display="None" ID="RangeValidator3" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtGradPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>P.G. Percentage :
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" onkeypress="return blockNonNumbers(this,event)" MaxLength="3" ID="txtPGPercent" Width="80%" ValidationGroup="RegGroup3" />%
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" Display="none" ValidationGroup="RegGroup3" ErrorMessage="Please enter your Graduation marks" ControlToValidate="txtPGPercent" runat="server" ForeColor="Red" />
                                        <asp:RangeValidator ID="RangeValidator4" Display="none" ValidationGroup="RegGroup3" ErrorMessage="Entered values are out of Range" ControlToValidate="txtPGPercent" runat="server" MinimumValue="1" Type="Integer" MaximumValue="100" ForeColor="Red" />
                                    </td>
                                </tr>

                            </table>
                        </div>
                        <div id="step-4">
                            <h2 class="StepTitle">General Information</h2>
                            <table width="100%" align="center" cellpadding="0" class="table table-striped" style="text-align: left;" cellspacing="10" border="0">
                                <tr align="center">
                                    <td></td>
                                    <td>Mobile</td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtPhNum" ValidationGroup="RegGroup" TextMode="Phone" onkeypress="return blockNonNumbers(this,event)" MaxLength="10" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ForeColor="red" Display="None" ValidationGroup="RegGroup" ID="RequiredFieldValidator7" ErrorMessage="Please Enter Phone Number" ControlToValidate="txtPhNum" runat="server" />
                                    </td>
                                </tr>

                                <tr align="center">
                                    <td></td>
                                    <td>Email ID</td>
                                    <td>
                                        <asp:TextBox runat="server" TextMode="Email" ValidationGroup="RegGroup" ID="txtEmailID" AutoCompleteType="None" autocomplete="off" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator Display="None" ForeColor="red" ValidationGroup="RegGroup" ID="RequiredFieldValidator13" ErrorMessage="Please Enter Email ID" ControlToValidate="txtEmailID" runat="server" />
                                        <asp:RegularExpressionValidator Display="None" ForeColor="red" ID="Regularexpressionvalidator2" ValidationGroup="RegGroup" ErrorMessage="Please enter a valid Email ID" ControlToValidate="txtEmailID" ValidationExpression="^[^@]+@[^@]+\.[^@]+$" runat="server" />
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td></td>
                                    <td>Password
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" TextMode="Password" ValidationGroup="RegGroup" AutoCompleteType="None" ID="txtPassword" autocomplete="return false" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ForeColor="red" ValidationGroup="RegGroup" Display="None" ErrorMessage="Please enter a Password" ControlToValidate="txtPassword" runat="server" />
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td></td>
                                    <td>Confirm Password
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" TextMode="Password" ValidationGroup="RegGroup" AutoCompleteType="None" ID="txtConfirmPassword" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ForeColor="red" ValidationGroup="RegGroup" ErrorMessage="Please enter your Password" Display="None" ControlToValidate="txtConfirmPassword" runat="server" />
                                        <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Password MisMatch" ForeColor="Red" ValidationGroup="RegGroup" ControlToValidate="txtConfirmPassword" Display="None" ControlToCompare="txtPassword" runat="server" />

                                    </td>
                                </tr>
                                <%-- <tr align="center">
                                    <td></td>
                                    <td>Resume
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="fuSeekerResume" runat="server" ValidationGroup="UploadGroup" />
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ValidationGroup="UploadGroup" Display="none" ErrorMessage="Please upload only PDF Files" ValidationExpression="[a-zA-Z\\].*(.pdf|.PDF)$" ControlToValidate="fuSeekerResume" runat="server" />
                                    </td>
                                </tr>--%>


            <%--        </table>
                        </div>
                    </div>
                    <!-- End SmartWizard Content 2 -->

                </td>
            </tr>--%>

            <tr>
                <td>
                    <div class="container">
                        <div class="row">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="search" name="txtSearchOther" placeholder="Skills,Designations,Companies" value=" " />
                                    <input type="search" name="txtSearchLoc" placeholder="Location" />
                                    <select multiple="multiple" name="txtExperiece">
                                        <option value="0">Fresher</option>
                                        <option value="1"><1 Year</option>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
