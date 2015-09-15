if(BASESERVERNAME)
{
        Mons.BASE_SERVER = BASESERVERNAME;
}
else
{
        Mons.BASE_SERVER = 'monsterindia.com';
}
var mediapath = "http://media."+Mons.BASE_SERVER;
var pathname = window.location.pathname;
if (pathname.charAt(0) == "/") pathname = pathname.substr(1);
if(window.location.protocol.indexOf("https:") == 0)
{
        mediapath = "https://media4."+Mons.BASE_SERVER;
}

function displayheader(data,type,loggedin,scid,network,datacheck,inboxdata,lastaccess,lasttime,pagetype,nothomepage)
{
	var html='';
	var sidenavigationhtml = '';
	var homepage_right_strip ='';
	var ciibox = '';
	
	if(data)
	{
		if(nothomepage)
		{
			if(type == 'LARGE')
			{
				html+= '<div class="header_main big">';
			}
			else
			{
				html+= '<div class="header_main">';
			}
			html+= '<div class="bgright"></div><div class="bgvirtual"></div><div class="ds_header_inner"><a class="mlogo" href="http://www.'+Mons.BASE_SERVER+'/index.html"></a>';

			if(type == 'LARGE')
			{
				html+= '<div class="loc_block"><div class="icon left"></div>'+data.CUR_LOCATION;
				if(data.PARENT_LOCATION)
				{
					html+= ', '+data.PARENT_LOCATION;
				}

				html +='</div><div class="update_txt">'+xml.PAGE_CONTENT.LAST_UPDATED+': '+data.UPDATED+'</div><div class="login_txt">'+xml.PAGE_CONTENT.LAST_LOGIN+': '+data.DATE_LOGIN+'</div><div class="uname">'+data.NAME+'</div><div class="uinfo">';
				if(data.DESIGNATION)
				{
					html += data.DESIGNATION; 
				}
				if(data.COMPANY_NAME)
				{
					html += ' at '+data.COMPANY_NAME;
				}
				html += '</div><div class="avatar_wrap"><div class="avatar_wrapinnr"><div class="avtbg"><div class="avtbg_innr round_ie"></div></div><div class="percent_meter_wrap"><div id="container"></div></div><div class="avatarimg_wrap"><div class="avatarimg_wrapinnr round_ie"><img src="'+data.IMG_PATH+'" class="round_ie"></div></div>';
				if(data.IMG_ST == 'pending')
				{
					html += '<div class="review_avait">Awaiting Review</div>';
				}
				if(pagetype == '1')
				{
					html += '<div class="infoedit_bg"><div class="infoedit_bginnr round_ie"><div class="apply_btn colr" onclick="showEditSection(1);" id="edit_resume_section1_open">Edit</div></div></div>';
				}


				html += '<a href="http://my.'+Mons.BASE_SERVER+'/my_monster.html?flag=1" class="profile_comp shd_commn"><strong>'+xml.PAGE_CONTENT.COMPLETE_PROFILE+'</strong> ('+data.PERCENTAGE+'%)</a><div class="email_mob_wrap em">';

				if(data.EMAIL_VERIFIED == '1')
				{
					html += '<div class="right verify_wrap">'+xml.PAGE_CONTENT.VERIFIED+'<div class="icon"></div></div>';
				}
				else
				{
					html += '<a data-width="650px" data-height="340px" title="Click here to verify" href="#" onclick="emailinfoOverlay(this);" class="right verify_wrap not">'+xml.PAGE_CONTENT.NOT_VERIFIED+'<div class="icon"></div></a>';
				}

				html +='<div class="right">'+data.EMAIL+'</div>';
                                if(pagetype == '1')
                                {
                                        html +='<div onclick="showEditSection(12);" id="edit_resume_section12_open" class="right edit_email"></div>';
                                }
                                html +='</div><div class="email_mob_wrap mb"><div class="left">'+data.MOBILE+'</div>';
				if(scid == '1')
				{
					if(data.MOBILE_VERIFIED == '1')
					{
						html += '<div class="left verify_wrap">'+xml.PAGE_CONTENT.VERIFIED+'<div class="icon"></div></div>';
					}
					else
					{
						html += '<a data-width="650px" data-height="340px" title="Click here to verify" href="#" onclick="openverifyOverlay(\''+data.USER_MOBILE+'\',\''+data.MOBILE_CODE+'\');" class="left verify_wrap not">'+xml.PAGE_CONTENT.NOT_VERIFIED+'<div class="icon"></div></a>';
					}
				}
				html += '</div></div></div>';
			}

			if(loggedin)
			{
				html += loggedin_right(data,type,network,datacheck,inboxdata,lastaccess,lasttime);
			}
			else
			{
				html += nonloggedin_right(data,type);
			}

			html += '</div></div>';
			var sidenavigationhtml = sidenavigation();
			
		}

		var layer3html = layer3(data,type,loggedin,scid,nothomepage);
		if(nothomepage == 0 && loggedin == 0)
		{
			homepage_right_strip = employerLink(scid);	
		}
		if(scid == 1)
		{
			ciibox = ciiBox();
		}
		html 	+= homepage_right_strip;
		html 	+= layer3html;

		html += sidenavigationhtml;
	}
	else
	{
		html += 'DeTAILS NOT FOUND FOR HEADER';
	}
	html    += ciibox;
	document.getElementById('header_id').innerHTML = html;
}

function nonloggedin_right()
{
	var nonloggedhtml = '';
	nonloggedhtml += '<div class="right loginwrap"><a class="log_btn joinus shd_commn" href="http://my.'+Mons.BASE_SERVER+'/create_account.html">Sign Up</a><a class="log_btn signin shd_commn" href="http://my.'+Mons.BASE_SERVER+'/login.html">Sign In</a></div>';
	return nonloggedhtml;
}

function loggedin_right(data,type,network,datacheck,inboxdata,lastaccess,lasttime)
{
	var network_data='';
	var notification_data='';
	var inbox_data='';
	var cnt_net=0;
	var cnt_noti=0;
	var cnt_inbox=0;
		cnt_net 	= network.NET_CNT;
		cnt_noti 	= network.NOTI_CNT;	
		cnt_inbox	= network.INBOX_CNT;
			
		localStorage.setItem('INBOX', network.INBOX_DATA);
                localStorage.setItem('INBOX_CNT', cnt_inbox);
		localStorage.setItem('NOTIFICATION', network.NOTI_DATA);
		localStorage.setItem('NOTIFICATION_CNT', cnt_noti);
		localStorage.setItem('NETWORK',network.NETWORK_DATA);
		localStorage.setItem('NETWORK_CNT', cnt_net);
		window.sessionStorage["NOTIFICATION"] = "notification_data";

		var getinbox            = window.localStorage["INBOX"] || 'No new Messages.';
                var getnotification     = localStorage.getItem('NOTIFICATION') || 'No new Notifications.';
                var getnetwork          = localStorage.getItem('NETWORK') || 'No new Network Updates.';

	
	var righthtml = '';
        righthtml +='<div class="notification_wrap"><ul class="notify"><li class="left"><a title="Inbox" class="nicon3" id="inbox_div"></a><div class=""></div><div class="nav_dd"><div class="navarrw"></div><div class="nav_ddinnr"><div class="dd_head">'+xml.PAGE_CONTENT.INBOX+'</div><div class="nav_ddinnrscroll scroll_custom"><div class="nav_ddinnrscroll_innr">'+getinbox+'</div></div><div class="viewall_wrap"><a href="http://my.'+Mons.BASE_SERVER+'/my_notification.html?type=inbox" target="_blank" class="view_link shd_commn">View All</a></div></div></div>';if(cnt_inbox != 0){righthtml +='<div id="inbox_cnt"><div class="ncount">'+window.localStorage["INBOX_CNT"]+'</div></div>';}righthtml +='</li><li class="left"><a title="Notifications" class="nicon1" id="noti_div"></a><div class="nav_dd"><div class="navarrw"></div><div class="nav_ddinnr"><div class="dd_head">'+xml.PAGE_CONTENT.NOTIFICATIONS+'</div><div class="nav_ddinnrscroll scroll_custom"><div class="nav_ddinnrscroll_innr">'+getnotification+'</div></div><div class="viewall_wrap"><a href="http://my.'+Mons.BASE_SERVER+'/my_notification.html?type=notification" target="_blank" class="view_link shd_commn">View All</a></div></div></div>';if(cnt_noti != 0){righthtml +='<div id="noti_cnt"><div class="ncount">'+localStorage.getItem('NOTIFICATION_CNT')+'</div></div>';}righthtml +='</li><li class="left nobr"><a title="Job Alert" class="nicon2" id="network_div"></a>';if(cnt_net != 0){righthtml +='<div id="net_cnt"><div class="ncount">'+localStorage.getItem('NETWORK_CNT')+'</div></div>';}righthtml +='<div class="nav_dd"><div class="navarrw"></div><div class="nav_ddinnr"><div class="dd_head">'+xml.PAGE_CONTENT.NETWORK+'</div><div class="nav_ddinnrscroll scroll_custom"><div class="nav_ddinnrscroll_innr">'+getnetwork+'</div></div><div class="viewall_wrap"><a href="http://my.'+Mons.BASE_SERVER+'/my_notification.html?type=network" target="_blank" class="view_link shd_commn">View All</a></div></div></div></li>';
        if((type == 'LARGE') && (data.AMCAT == '1' || data.VSKILL == '1' || data.SMARTCV == '1'))
        {
                righthtml += '<li class="left nobr badges"><a title="Badges" class="nicon4" href="javascrip:void(0);"></a><div class="nav_dd"><div class="navarrw"></div><div class="nav_ddinnr">';
		if(data.AMCAT == '1')
		{
			righthtml += '	<div class="logo_iconwrap"><div class="left logo_icon"><img src="'+mediapath+'/seeker_2014/social/clogo/bagde1.jpg"></div><div class="right"><a class="share" href="javascript:void(0);"><div class="icon"></div>Share</a></div><div class="clr"></div></div>';
		}
		if(data.SMARTCV == '1')
                {
                        righthtml += '<div class="logo_iconwrap"><div class="left logo_icon"><img src="'+mediapath+'/seeker_2014/social/clogo/bagde2.jpg"></div><div class="right"><a class="share" href="javascript:void(0);"><div class="icon"></div>Share</a></div><div class="clr"></div></div>';
                }
		if(data.VSKILL == '1')
                {
                        righthtml += '<div class="logo_iconwrap"><div class="left logo_icon"><img src="'+mediapath+'/seeker_2014/social/clogo/badge3.jpg"></div><div class="right"><a class="share" href="javascript:void(0);"><div class="icon"></div>Share</a></div><div class="clr"></div></div>';
                }

	righthtml += '</div></div></li>';
        }
        righthtml += '<div class="clr"></div></ul></div>';
	return righthtml;
}
function employerLink(scid)
{
	var homepage_right = '';
	var buyonlinelink = 'http://recruiter.'+Mons.BASE_SERVER+'/v2/ecom/index.html';
        if(scid == 1)
        {
                buyonlinelink = 'http://recruiter.'+Mons.BASE_SERVER+'/v2/ecom/more_products.html';
        }
        if(scid == 5)
        {
                buyonlinelink = 'http://promotions.monster.com.hk/employers/index.html';
        }
        homepage_right = '<div class="right ns_recruiterlogin"><div class="ns_rec_link"><a href="http://recruiter.'+Mons.BASE_SERVER+'/v2/ecom/more_products.html" class="ns_main_link ns_border_lt">Looking to Hire?</a> | <span id="employee_login" class="ns_main_link ns_changemargin">Employers<div style="display: none;" class="ns_reclogin_box"><a class="ns_reclinks" href="https://recruiter.'+Mons.BASE_SERVER+'/?login=yes">Login Here</a><a class="ns_reclinks" href="http://recruiter.'+Mons.BASE_SERVER+'/v2/ecom/jp_learnmore.html">Post Jobs</a><a class="ns_reclinks" href="http://recruiter.'+Mons.BASE_SERVER+'/v2/ecom/sr_learnmore.html">Search Resumes</a><a class="ns_reclinks" href="'+buyonlinelink+'">Buy Online</a><a class="ns_reclinks" href="http://recruiter.'+Mons.BASE_SERVER+'/">Contact Us</a></div></span></div></div>';
	return homepage_right;
}

function ciiBox()
{
	var ciibox='';
	ciibox= '<div class="pop_bg"></div><div class="pop_main" id="msgAlertDiv_cii" style="display:none;z-index:1000000;height:220px;top:200px;"><div class="pop_main_inner"><div class="popform_wrap"><img src="'+mediapath+'/monster_2012/cii/cii_img.jpg"  width="44" height="44"><div class="ns_lt" style="padding:15px;">You are being redirected to <span class="bold">CIIspecialablityjobs.in</span> which is for disability recruitment. <br>Click ok to continue if relevant or cancel to continue searching jobs on Monster.</div><div class="ns_clr"></div><div style="text-align:center; margin-top:20px; height:30px; padding:0px 15px;"><div class="ns_rt apply_btn" style="margin-left:10px;" onclick="ciispecialability_alert(\'CANCEL\'); return false;">CANCEL</div><div class="ns_rt apply_btn" onClick="window.location.href=\'http://www.ciispecialabilityjobs.in/\';">OK</div></div></div></div>';
	return ciibox; 
}


function ciispecialability_alert(msg)
{
	jQuery('.pop_bg').fadeIn();
	scrollOff();
        document.body.scroll='no';
        window.onscroll = doNotScroll;	
	
        if(msg == 'OK')
        {
                MJS.HTML.hideTag('msgAlertDiv_cii');
                window.open('http://www.ciispecialabilityjobs.in/', '_blank');
        }
        else if(msg == 'CANCEL')
        {
		scrollOn();
		jQuery('.pop_bg').hide();
                MJS.HTML.hideTag('msgAlertDiv_cii');
                return false;
        }
        else
        {
                document.getElementById('msgAlertDiv_cii').style.display='block';
                return false;
        }
}


function scrollOff()
{
        if (document.all)
        {
               document.body.scroll = "yes";
        }
        else
        {
               var oTop = document.body.scrollTop;
               document.body.style.overflow = "visible";
               document.body.scrollTop = oTop;
        }
}

function doNotScroll(){
        window.scrollTo(0,0);
}

function scrollOn()
{
        document.body.scroll = "";
        document.body.style.overflow = "";
        window.onscroll = "";
}

function layer3(data,type,loggedin,scid,nothomepage)
{
	var SUBLINK_WALKINS_JOBS='';
	if(data['CHANNELINK']['SUBLINK_WALKINS_JOBS'][scid])
        {
                SUBLINK_WALKINS_JOBS = '<a class="menu2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/walkins/index.html">'+xml.PAGE_CONTENT.WALKINS_JOBS+'</a>';
        }
	var SUBLINK_CONTRACT_JOBS='';
	if(data['CHANNELINK']['SUBLINK_CONTRACT_JOBS'][scid])
        {
                SUBLINK_CONTRACT_JOBS = '<a class="menu2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/contract/index.html">'+xml.PAGE_CONTENT.CONTRACT_JOBS+'</a>';
        }
	var SUBLINK_GOVT_JOBS='';
	if(data['CHANNELINK']['SUBLINK_GOVT_JOBS'][scid])
        {
                SUBLINK_GOVT_JOBS = '<a class="menu2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/government-jobs/index.html">'+xml.PAGE_CONTENT.GOVT_JOBS+'</a>';
        }
	var SUBLINK_COLLEGE_JOBS='';
	if(data['CHANNELINK']['SUBLINK_COLLEGE_JOBS'][scid])
        {
                SUBLINK_COLLEGE_JOBS = '<a class="menu2_link" href="http://www.monstercollege.in/">'+xml.PAGE_CONTENT.COLLEGE+'</a>';
        }
	var SUBLINK_SPECIAL_ABILITY='';
        if(data['CHANNELINK']['SUBLINK_SPECIAL_ABILITY'][scid])
        {
                SUBLINK_SPECIAL_ABILITY = '<a class="menu2_link" href="#"  onclick="return ciispecialability_alert();">'+xml.PAGE_CONTENT.SPECIAL_ABILITY+'</a>';
        }
	var SUBLINK_INSIGHTS_MSI='';
        if(data['CHANNELINK']['SUBLINK_INSIGHTS_MSI'][scid])
        {
		if(loggedin)
		{
                	SUBLINK_INSIGHTS_MSI = '<a class="menu2_link" href="javascript:void(0)" onclick="insights_link(\'salary_index\','+scid+')">'+xml.PAGE_CONTENT.SALARY_INDEX+'</a>';
		}
		else
		{
			SUBLINK_INSIGHTS_MSI = '<a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/salary_check.html">'+xml.PAGE_CONTENT.SALARY_INDEX+'</a>';
		}
        }       
        var SUBLINK_INSIGHTS_MEI='';
        if(data['CHANNELINK']['SUBLINK_INSIGHTS_MEI'][scid])
        {
		if(loggedin)
		{
                	SUBLINK_INSIGHTS_MEI = '<a class="menu2_link" href="javascript:void(0)" onclick="insights_link(\'msi\','+scid+')">'+xml.PAGE_CONTENT.EMPLOYMENT_INDEX+'</a>';
		}
		else
		{
			SUBLINK_INSIGHTS_MEI = '<a class="menu2_link" href="http://www.'+Mons.BASE_SERVER+'/employment-index/index.html">'+xml.PAGE_CONTENT.EMPLOYMENT_INDEX+'</a>';
		}
        }
	var SUBLINK_XPRESS_RESUME='';
        if(data['CHANNELINK']['SUBLINK_XPRESS_RESUME'][scid])
        {
                SUBLINK_XPRESS_RESUME = '<a  class="menu2_link" href="http://expressresume.'+Mons.BASE_SERVER+'/index.html">'+xml.PAGE_CONTENT.XPRESS_RESUME+'</a>';
        } 
	var SUBLINK_RIGHT_RESUME='';
        if(data['CHANNELINK']['SUBLINK_RIGHT_RESUME'][scid])
        {
                SUBLINK_RIGHT_RESUME = '<a class="menu2_link" href="http://resumeservice.'+Mons.BASE_SERVER+'/index.html">'+xml.PAGE_CONTENT.RIGHT_RESUME+'</a>';
        }
	var SUBLINK_CAREER_BOOSTER ='';
        if(data['CHANNELINK']['SUBLINK_CAREER_BOOSTER'][scid])
        {
                SUBLINK_CAREER_BOOSTER = '<a class="menu2_link" href="http://careerbooster.'+Mons.BASE_SERVER+'/index.html">'+xml.PAGE_CONTENT.CAREER_BOOSTER+'</a>';
        }
	var SUBLINK_RES_HIGHLIGHT='';
        if(data['CHANNELINK']['SUBLINK_RES_HIGHLIGHT'][scid])
        {
                SUBLINK_RES_HIGHLIGHT = '<a  class="menu2_link" href="http://www.'+Mons.BASE_SERVER+'/resume_highlighter/index.html">'+xml.PAGE_CONTENT.RES_HIGHLIGHT+'</a>';
        }
	var SUBLINK_VSKILLS='';
        if(data['CHANNELINK']['SUBLINK_VSKILLS'][scid])
        {
                SUBLINK_VSKILLS = '<a  class="menu2_link" href="http://www.'+Mons.BASE_SERVER+'/vskills/index.html">'+xml.PAGE_CONTENT.VSKILLS_CERT+'</a>';
        }
	var SUBLINK_PSYCHMETRIC_TEST='';
        if(data['CHANNELINK']['SUBLINK_PSYCHMETRIC_TEST'][scid])
        {
                SUBLINK_PSYCHMETRIC_TEST = '<a  class="menu2_link" href="http://www.'+Mons.BASE_SERVER+'/psychometrictest/index.html">'+xml.PAGE_CONTENT.PSYCHMETRIC_TEST+'</a>';
        }
	var SUBLINK_JOBS_BY_LOCATION='';
        if(data['CHANNELINK']['SUBLINK_JOBS_BY_LOCATION'][scid])
        {
                SUBLINK_JOBS_BY_LOCATION = '<a class="menu2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/location/index.html">'+xml.PAGE_CONTENT.JOBS_BY_LOCATION+'</a>';
        }

	var AMCATCERT= '';
        if(scid == '1')
        {
                AMCATCERT = '<a class="menu2_link" href="http://www.'+Mons.BASE_SERVER+'/amcat/index.html">AMCAT Certification</a>';
        }	
	var layerhtml = '';
	var style_homepage ='';
	if(nothomepage == 0)
	{
		style_homepage = "background:#252040; border-bottom:0";	
	}
	layerhtml += '<div class="menu_wrapper" style=\''+style_homepage+'\'>';
        var ham_html = hamhtml(data,scid,loggedin);
        layerhtml += ham_html;
        if(type == 'LARGE')
        {
                layerhtml += '<ul class="nav_menu big">';
        }
        else
        {
                layerhtml += '<ul class="nav_menu">';
        }
        
        layerhtml += '<li class="left"><a href="http://jobsearch.'+Mons.BASE_SERVER+'/search.html"><div class="icon jobs left active"></div>'+xml.PAGE_CONTENT.JOBS+'</a><div class="nav_menu2"><div class="menu2link_wrap"><div class="arrw"></div><a class="menu2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/search.html">'+xml.PAGE_CONTENT.ADVANCE_JOB_SEARCH+'</a>'+SUBLINK_JOBS_BY_LOCATION+'<a class="menu2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/industry/index.html">'+xml.PAGE_CONTENT.JOBS_BY_INDUSTRY+'</a><a class="menu2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/category/index.html">'+xml.PAGE_CONTENT.JOBS_BY_FUNCTION+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/find_companies.html">'+xml.PAGE_CONTENT.JOBS_BY_COMPANY+'</a><a class="menu2_link" href="http://www.'+Mons.BASE_SERVER+'/mobile/index.html">'+xml.PAGE_CONTENT.MONSTER_ON_MOBILE+'</a>'+SUBLINK_GOVT_JOBS+''+SUBLINK_CONTRACT_JOBS+''+SUBLINK_WALKINS_JOBS+''+SUBLINK_SPECIAL_ABILITY+''+SUBLINK_COLLEGE_JOBS+'<a class="menu2_link" href="http://www.'+Mons.BASE_SERVER+'/search_tips.html">'+xml.PAGE_CONTENT.SEARCH_TIP+'</a></div></div></li><li class="left"><a href="http://my.'+Mons.BASE_SERVER+'/find_companies.html" class="beta"><div class="icon cmp left"></div>'+xml.PAGE_CONTENT.COMPANIES+'</a><div class="nav_menu2"><div class="menu2link_wrap"><div class="arrw"></div><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/company_updates.html">'+xml.PAGE_CONTENT.COMPANIES_UPDATE+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/company_updates.html?rec=1">'+xml.PAGE_CONTENT.RECRUITER_UPDATE+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/find_companies.html">'+xml.PAGE_CONTENT.FIND_COMPANIES+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/recruiter_list.html">'+xml.PAGE_CONTENT.FIND_RECRUITERS+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/company_list.html?type=my">'+xml.PAGE_CONTENT.COMPANY_FOLLOWING+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/recruiter_list.html?type=my">'+xml.PAGE_CONTENT.RECRUITER_FOLLOWING+'</a></div></div></li>';                
	if(type == 'LARGE')
	{
		layerhtml += '<li class="left headerbig"></li>';                
	}
		if(loggedin)
		{
        		layerhtml += '<li class="left"><a href="javascript:void(0)"  onclick="insights_link(\'\','+scid+')" class="beta"><div class="icon insight left"></div>'+xml.PAGE_CONTENT.ANALYTICS+'</a><div class="nav_menu2"><div class="menu2link_wrap"><div class="arrw"></div><a class="menu2_link" href="javascript:void(0)"  onclick="insights_link(\'profile_view\','+scid+')">'+xml.PAGE_CONTENT.PROFILE_VIEWS+'</a><a class="menu2_link" href="javascript:void(0)"  onclick="insights_link(\'activity_score\','+scid+')">'+xml.PAGE_CONTENT.ACTIVITY_SCORE+'</a>'+SUBLINK_INSIGHTS_MSI+''+SUBLINK_INSIGHTS_MEI+'</div></div></li>';
		}
		else
		{
			layerhtml += '<li class="left"><a href="http://my.'+Mons.BASE_SERVER+'/salary_check.html"><div class="icon insight left"></div>Career Resources</a> <div class="nav_menu2"> <div class="menu2link_wrap"> <div class="arrw"></div>'+SUBLINK_INSIGHTS_MSI+''+SUBLINK_INSIGHTS_MEI+'<div style="text-align:left; padding-left:5px;" class="head_big">Career Services</div>'+SUBLINK_XPRESS_RESUME+''+SUBLINK_RIGHT_RESUME+''+SUBLINK_CAREER_BOOSTER+''+SUBLINK_RES_HIGHLIGHT+''+SUBLINK_VSKILLS+''+AMCATCERT+''+SUBLINK_PSYCHMETRIC_TEST+'<a href="http://content.'+Mons.BASE_SERVER+'/article_index.html" class="menu2_link">Career Center</a></div></div></li>';
		}


	layerhtml += '<li class="left"><a href="http://my.'+Mons.BASE_SERVER+'/my_monster.html"><div class="icon profile left"></div>'+xml.PAGE_CONTENT.MY_MONSTER+'</a><div class="nav_menu2"><div class="menu2link_wrap"><div class="arrw"></div><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/view_resume.html">'+xml.PAGE_CONTENT.MY_PROFILE+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/insights.html#activity_score">'+xml.PAGE_CONTENT.MY_ACTIVITY_SCORE+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/my_publicprofile.html">'+xml.PAGE_CONTENT.MY_PUBLIC_PROFILE+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/saved_jobs.html">'+xml.PAGE_CONTENT.MY_SAVED_JOBS+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/applications.html">'+xml.PAGE_CONTENT.MY_APPLICATION+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/manageagents.html">'+xml.PAGE_CONTENT.JOB_AGENT+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/manage_settings.html">'+xml.PAGE_CONTENT.PRIVACY_PLUS+'</a><a class="menu2_link" href="http://my.'+Mons.BASE_SERVER+'/newsletter.html">'+xml.PAGE_CONTENT.SUBSCRIPTIONS+'</a></div></div></li></ul>';

	if(loggedin)
	{
		layerhtml +='<div class="uinfo_nav right">';                
		if(type != 'LARGE')                
		{                        
			layerhtml +='<div class="left uimg"><img src="'+data.IMG_PATH+'"></div>';                
		} 
		layerhtml += '<div class="left">'+xml.PAGE_CONTENT.HI+', '+data.FNAME+'</div><div class="left"><div class="settings_icon"><div class="userinfodd"><div class="navarrw"></div><div class="userinfodd_innr"><div class="usrname">'+data.NAME+'</div><div class="left u_emailicon"></div><div class="left"><a href="mailto:'+data.EMAIL+'" class="u_emailtxt">'+data.EMAIL+'</a><a href="mailto:'+data.ALT_EMAIL+'" class="u_emailtxt">'+data.ALT_EMAIL+'</a></div><div class="clr"></div><div class="u_mobicon left"></div><div class="u_mobtxt">'+data.MOBILE+'</div><div class="clr"></div><div class="uactionwrap"><div class="right"><a class="apply_btn shd_commn logout" href="'+data.LOGOUTLINK+'">'+xml.PAGE_CONTENT.SIGN_OUT+'</a></div><div class="right"><a class="apply_btn shd_commn" href="http://my.'+Mons.BASE_SERVER+'/manage_settings.html">'+xml.PAGE_CONTENT.MANAGE_SETTINGS+'</a></div><div class="right"><a class="apply_btn shd_commn" href="'+data.FEEDBACKLINK+'">'+xml.PAGE_CONTENT.FEEDBACK+'</a></div></div></div></div></div></div></div></div>';
	}
	return layerhtml;
}

var insights_link = function(tab,scid) {
	var url = window.location.pathname;
	if(url.match(/insights\.html/g)) {
		window.location.href='http://my.'+Mons.BASE_SERVER+'/insights.html#'+tab;
		window.location.reload();
	} else {
		window.location.href='http://my.'+Mons.BASE_SERVER+'/insights.html#'+tab;
	}
}

function sidenavigation()
{
	var navigation = '';
	navigation += '<div class="get_monster_wrap"><div class="inrr"><div class="top_band"><div class="left"></div><div class="right"></div></div><div class="icon_wrap"><a href="http://www.'+Mons.BASE_SERVER+'/mobile/index.html?deviceId=0" target="_blank" class="icon ios"></a><a href="http://www.'+Mons.BASE_SERVER+'/mobile/index.html?deviceId=2" target="_blank" class="icon android"></a><a href="http://www.'+Mons.BASE_SERVER+'/mobile/index.html?deviceId=3" target="_blank" class="icon bb"></a><a href="http://www.'+Mons.BASE_SERVER+'/mobile/index.html?deviceId=4" target="_blank" class="icon w8"></a><a href="http://www.'+Mons.BASE_SERVER+'/mobile/index.html?deviceId=6" target="_blank"  class="icon wap"></a></div></div></div>';
	return navigation;
}

function hamhtml(data,scid,loggedin)
{

	var SUBLINK_CAREER_BOOSTER ='';
	if(data['CHANNELINK']['SUBLINK_CAREER_BOOSTER'][scid])
	{
		SUBLINK_CAREER_BOOSTER = '<a class="level2_link" href="http://careerbooster.'+Mons.BASE_SERVER+'/index.html">'+xml.PAGE_CONTENT.CAREER_BOOSTER+'</a>';
	}
	var SUBLINK_XPRESS_RESUME='';
	if(data['CHANNELINK']['SUBLINK_XPRESS_RESUME'][scid])
        {
                SUBLINK_XPRESS_RESUME = '<a class="level2_link" href="http://expressresume.'+Mons.BASE_SERVER+'/index.html">'+xml.PAGE_CONTENT.XPRESS_RESUME+'</a>';
        }
	var SUBLINK_RES_HIGHLIGHT='';
        if(data['CHANNELINK']['SUBLINK_RES_HIGHLIGHT'][scid])
        {
                SUBLINK_RES_HIGHLIGHT = '<a class="level2_link" href="http://www.'+Mons.BASE_SERVER+'/resume_highlighter/index.html">'+xml.PAGE_CONTENT.RES_HIGHLIGHT+'</a>';
        }
	var SUBLINK_RIGHT_RESUME='';
	if(data['CHANNELINK']['SUBLINK_RIGHT_RESUME'][scid])
        {
                SUBLINK_RIGHT_RESUME = '<a class="level2_link" href="http://resumeservice.'+Mons.BASE_SERVER+'/index.html">'+xml.PAGE_CONTENT.RIGHT_RESUME+'</a>';
        }
	var SUBLINK_VSKILLS='';
	if(data['CHANNELINK']['SUBLINK_VSKILLS'][scid])
        {
                SUBLINK_VSKILLS = '<a class="level2_link" href="http://www.'+Mons.BASE_SERVER+'/vskills/index.html">'+xml.PAGE_CONTENT.VSKILLS_CERT+'</a>';
        }
	var SUBLINK_PSYCHMETRIC_TEST='';
	if(data['CHANNELINK']['SUBLINK_PSYCHMETRIC_TEST'][scid])
        {
                SUBLINK_PSYCHMETRIC_TEST = '<a class="level2_link" href="http://www.'+Mons.BASE_SERVER+'/psychometrictest/index.html">'+xml.PAGE_CONTENT.PSYCHMETRIC_TEST+'</a>';
        }
	var SUBLINK_INTERVIEW_CENTER='';
	if(data['CHANNELINK']['SUBLINK_INTERVIEW_CENTER'][scid])
        {
                SUBLINK_INTERVIEW_CENTER = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/interview_center.html">'+xml.PAGE_CONTENT.INTERVIEW_CENTER+'</a>';
        }
	var SUBLINK_LIFE_AT_WORK='';
	if(data['CHANNELINK']['SUBLINK_LIFE_AT_WORK'][scid])
	{
		SUBLINK_LIFE_AT_WORK = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/lifeatwork.html">'+xml.PAGE_CONTENT.LIFE_AT_WORK+'</a>';
	}
	var SUBLINK_RES_CENTER='';
	if(data['CHANNELINK']['SUBLINK_RES_CENTER'][scid])
        {
                SUBLINK_RES_CENTER = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/resumecenter.html">'+xml.PAGE_CONTENT.RES_CENTER+'</a>';
        }
	var SUBLINK_SAL_CENTER='';
	if(data['CHANNELINK']['SUBLINK_SAL_CENTER'][scid])
        {
                SUBLINK_SAL_CENTER = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/salary_center.html">'+xml.PAGE_CONTENT.SAL_CENTER+'</a>';
        }
	var SUBLINK_UPCOMING_JOB_TRENDS='';
        if(data['CHANNELINK']['SUBLINK_UPCOMING_JOB_TRENDS'][scid])
        {
                SUBLINK_UPCOMING_JOB_TRENDS = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/career_articles.html?sec_id=31">'+xml.PAGE_CONTENT.UPCOMING_JOB_TRENDS+'</a>';
        }
	var SUBLINK_SELF_IMPROVEMENT_TIPS='';
        if(data['CHANNELINK']['SUBLINK_SELF_IMPROVEMENT_TIPS'][scid])
        {
                SUBLINK_SELF_IMPROVEMENT_TIPS = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/career_articles.html?sec_id=32">'+xml.PAGE_CONTENT.SELF_IMPROVEMENT_TIPS+'</a>';
        }
	var SUBLINK_NEW_CAREER_OPTIONS='';
	if(data['CHANNELINK']['SUBLINK_NEW_CAREER_OPTIONS'][scid])
        {
                SUBLINK_NEW_CAREER_OPTIONS = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/career_articles.html?sec_id=33">'+xml.PAGE_CONTENT.NEW_CAREER_OPTIONS+'</a>';
        }
	var SUBLINK_EXPERTS_ADVICE='';
        if(data['CHANNELINK']['SUBLINK_EXPERTS_ADVICE'][scid])
        {
                SUBLINK_EXPERTS_ADVICE = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/career_articles.html?sec_id=34">'+xml.PAGE_CONTENT.EXPERTS_ADVICE+'</a>';
        }
	var SUBLINK_CEO_CTO_STUDIES='';
	if(data['CHANNELINK']['SUBLINK_CEO_CTO_STUDIES'][scid])
        {
                SUBLINK_CEO_CTO_STUDIES = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/research.html">'+xml.PAGE_CONTENT.CEO_CTO_STUDIES+'</a>';
        }
	var SUBLINK_BRANDING_URL='';
	if(data['CHANNELINK']['SUBLINK_BRANDING_URL'][scid])
        {
                SUBLINK_BRANDING_URL = '<a class="level2_link" href="http://content.'+Mons.BASE_SERVER+'/employer_branding.html">'+xml.PAGE_CONTENT.BRANDINGTREND+'</a>';
        }
	var SUBLINK_WALKINS_JOBS='';
	if(data['CHANNELINK']['SUBLINK_WALKINS_JOBS'][scid])
        {
                SUBLINK_WALKINS_JOBS = '<a class="level2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/walkins/index.html">'+xml.PAGE_CONTENT.WALKINS_JOBS+'</a>';
        }
	var SUBLINK_CONTRACT_JOBS='';
	if(data['CHANNELINK']['SUBLINK_CONTRACT_JOBS'][scid])
        {
                SUBLINK_CONTRACT_JOBS = '<a class="level2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/contract/index.html">'+xml.PAGE_CONTENT.CONTRACT_JOBS+'</a>';
        }
	var SUBLINK_GOVT_JOBS='';
	if(data['CHANNELINK']['SUBLINK_GOVT_JOBS'][scid])
        {
                SUBLINK_GOVT_JOBS = '<a class="level2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/government-jobs/index.html">'+xml.PAGE_CONTENT.GOVT_JOBS+'</a>';
        }
	var SUBLINK_COLLEGE_JOBS='';
	if(data['CHANNELINK']['SUBLINK_COLLEGE_JOBS'][scid])
        {
                SUBLINK_COLLEGE_JOBS = '<a class="level2_link" href="http://www.monstercollege.in/">'+xml.PAGE_CONTENT.COLLEGE+'</a>';
        }
	var SUBLINK_SPECIAL_ABILITY='';
        if(data['CHANNELINK']['SUBLINK_SPECIAL_ABILITY'][scid])
        {
                SUBLINK_SPECIAL_ABILITY = '<a class="level2_link" href="#" onclick=" return ciispecialability_alert();">'+xml.PAGE_CONTENT.SPECIAL_ABILITY+'</a>';
        }
	var SUBLINK_INSIGHTS_MSI='';
        if(data['CHANNELINK']['SUBLINK_INSIGHTS_MSI'][scid])
        {
		if(loggedin)
		{
                	SUBLINK_INSIGHTS_MSI = '<a class="level2_link" href="javascript:void(0)"  onclick="insights_link(\'salary_index\','+scid+')">'+xml.PAGE_CONTENT.SALARY_INDEX+'</a>';
		}
		else
		{
			SUBLINK_INSIGHTS_MSI = '<a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/salary_check.html">'+xml.PAGE_CONTENT.SALARY_INDEX+'</a>';
		}
        }
        var SUBLINK_INSIGHTS_MEI='';
        if(data['CHANNELINK']['SUBLINK_INSIGHTS_MEI'][scid])
        {
		if(loggedin)
		{
                	SUBLINK_INSIGHTS_MEI = '<a class="level2_link" href="javascript:void(0)"  onclick="insights_link(\'msi\','+scid+')">'+xml.PAGE_CONTENT.EMPLOYMENT_INDEX+'</a>';
		}
		else
		{
			SUBLINK_INSIGHTS_MEI = '<a class="level2_link" href="http://www.'+Mons.BASE_SERVER+'/employment-index/index.html">'+xml.PAGE_CONTENT.EMPLOYMENT_INDEX+'</a>';
		}
        }
	var SUBLINK_JOBS_BY_LOCATION='';
        if(data['CHANNELINK']['SUBLINK_JOBS_BY_LOCATION'][scid])
        {       
		SUBLINK_JOBS_BY_LOCATION = '<a class="level2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/location/index.html">'+xml.PAGE_CONTENT.JOBS_BY_LOCATION+'</a>';
        }
	var AMCATCERT= '';
	if(scid == '1')
	{
		AMCATCERT = '<a class="level2_link" href="http://www.'+Mons.BASE_SERVER+'/amcat/index.html">AMCAT Certification</a>';
	}
	var SWITCHHTML='';
	if(scid == '2' && langtype == 'ar')
	{
		SWITCHHTML = '<div class="slide_out_menuitemwrap ccenter"><a id="switchlang" href="'+langswitch+'" class="slide_out_menuitem"><div class="icon left"></div>'+xml.PAGE_CONTENT.SWITCH_ENGLISH+'</a></div>'
	}
	if(scid == '2' && langtype == 'en')
	{
		SWITCHHTML = '<div class="slide_out_menuitemwrap ccenter"><a id="switchlang" href="'+langswitch+'" class="slide_out_menuitem"><div class="icon left"></div>'+xml.PAGE_CONTENT.SWITCH_ARABIC+'</a></div>'
	}
	var html_ham = '';	
	html_ham += '<div id="ham_menu" class="leftmenu"><div class="hamitem"></div><div class="hamitem"></div><div class="hamitem"></div><div class="slideout_menu_wrap slideout_menu" style="height: 1061px;"><div class="slide_out_menuitemwrap"><a id="mymonster" href="http://my.'+Mons.BASE_SERVER+'/my_monster.html" class="slide_out_menuitem"><div class="icon left"></div>'+xml.PAGE_CONTENT.MY_MONSTER+'</a><div class="slide_level2"><div class="level2link_wrap"><div class="arrw"></div><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/view_resume.html">'+xml.PAGE_CONTENT.MY_PROFILE+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/insights.html#activity_score">'+xml.PAGE_CONTENT.MY_ACTIVITY_SCORE+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/my_publicprofile.html">'+xml.PAGE_CONTENT.MY_PUBLIC_PROFILE+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/saved_jobs.html">'+xml.PAGE_CONTENT.MY_SAVED_JOBS+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/applications.html">'+xml.PAGE_CONTENT.MY_APPLICATION+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/manageagents.html">'+xml.PAGE_CONTENT.JOB_AGENT+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/manage_settings.html">'+xml.PAGE_CONTENT.PRIVACY_PLUS+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/newsletter.html">'+xml.PAGE_CONTENT.SUBSCRIPTIONS+'</a></div></div></div><div class="slide_out_menuitemwrap searchjob"><a id="searchjobs" href="http://jobsearch.'+Mons.BASE_SERVER+'/search.html" class="slide_out_menuitem"><div class="icon left"></div>'+xml.PAGE_CONTENT.SEARCH_JOBS+'</a><div class="slide_level2"><div class="level2link_wrap"><div class="arrw"></div><a class="level2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/search.html">'+xml.PAGE_CONTENT.ADVANCE_JOB_SEARCH+'</a>'+SUBLINK_JOBS_BY_LOCATION+'<a class="level2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/industry/index.html">'+xml.PAGE_CONTENT.JOBS_BY_INDUSTRY+'</a><a class="level2_link" href="http://jobsearch.'+Mons.BASE_SERVER+'/category/index.html">'+xml.PAGE_CONTENT.JOBS_BY_FUNCTION+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/find_companies.html">'+xml.PAGE_CONTENT.JOBS_BY_COMPANY+'</a><a class="level2_link" href="http://www.'+Mons.BASE_SERVER+'/mobile/index.html">'+xml.PAGE_CONTENT.MONSTER_ON_MOBILE+'</a>'+SUBLINK_GOVT_JOBS+''+SUBLINK_CONTRACT_JOBS+''+SUBLINK_WALKINS_JOBS+''+SUBLINK_SPECIAL_ABILITY+''+SUBLINK_COLLEGE_JOBS+'<a class="level2_link" href="http://www.'+Mons.BASE_SERVER+'/search_tips.html">'+xml.PAGE_CONTENT.SEARCH_TIP+'</a></div></div></div><div class="slide_out_menuitemwrap company"><a id="company" href="http://my.'+Mons.BASE_SERVER+'/find_companies.html" class="slide_out_menuitem beta"><div class="icon left"></div>'+xml.PAGE_CONTENT.COMPANIES+'</a><div class="slide_level2"><div class="level2link_wrap"><div class="arrw"></div><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/company_updates.html">'+xml.PAGE_CONTENT.COMPANIES_UPDATE+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/company_updates.html?rec=1">'+xml.PAGE_CONTENT.RECRUITER_UPDATE+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/find_companies.html">'+xml.PAGE_CONTENT.FIND_COMPANIES+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/recruiter_list.html">'+xml.PAGE_CONTENT.FIND_RECRUITERS+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/company_list.html?type=my">'+xml.PAGE_CONTENT.COMPANY_FOLLOWING+'</a><a class="level2_link" href="http://my.'+Mons.BASE_SERVER+'/recruiter_list.html?type=my">'+xml.PAGE_CONTENT.RECRUITER_FOLLOWING+'</a></div></div></div>';

	if(loggedin)
	{
		html_ham += '<div class="slide_out_menuitemwrap insights"><a id="insights" href="javascript:void(0)"  onclick="insights_link(\'\','+scid+')" class="slide_out_menuitem beta"><div class="icon left"></div>'+xml.PAGE_CONTENT.ANALYTICS+'</a><div class="slide_level2"><div class="level2link_wrap"><div class="arrw"></div><a class="level2_link" href="javascript:void(0)"  onclick="insights_link(\'profile_view\','+scid+')">'+xml.PAGE_CONTENT.PROFILE_VIEWS+'</a>'+SUBLINK_INSIGHTS_MSI+''+SUBLINK_INSIGHTS_MEI+'<a class="level2_link" href="javascript:void(0)"  onclick="insights_link(\'activity_score\','+scid+')">'+xml.PAGE_CONTENT.ACTIVITY_SCORE+'</a></div></div></div>';

	}
	else
	{
		html_ham += '<div class="slide_out_menuitemwrap insights nonloggedin"><a id="insights" href="http://my.'+Mons.BASE_SERVER+'/salary_check.html" class="slide_out_menuitem"><div class="icon left"></div>Career Resources</a><div class="slide_level2"><div class="level2link_wrap"><div class="arrw"></div>'+SUBLINK_INSIGHTS_MSI+''+SUBLINK_INSIGHTS_MEI+'</div></div></div>';
	}


	html_ham += '<div class="slide_out_menuitemwrap cservices"><a id="careerservices" href="http://content.'+Mons.BASE_SERVER+'/index.html" class="slide_out_menuitem"><div class="icon left"></div>'+xml.PAGE_CONTENT.CAREER_SERVICES+'</a><div class="slide_level2"><div class="level2link_wrap"><div class="arrw"></div><div class="head_big">Seeker Services</div>'+SUBLINK_CAREER_BOOSTER+''+SUBLINK_XPRESS_RESUME+''+SUBLINK_RES_HIGHLIGHT+''+SUBLINK_RIGHT_RESUME+'<div class="head_big">'+xml.PAGE_CONTENT.LEARNING_CENTER+'</div>'+SUBLINK_VSKILLS+''+AMCATCERT+''+SUBLINK_PSYCHMETRIC_TEST+'<div class="head_big">'+xml.PAGE_CONTENT.CAREER_ADVICE+'</div><a href="http://content.'+Mons.BASE_SERVER+'/article_index.html" class="level2_link">'+xml.PAGE_CONTENT.CAREER_CENTER+'</a><div class="head_big">'+xml.PAGE_CONTENT.RESEARCH+'</div>'+SUBLINK_CEO_CTO_STUDIES+''+SUBLINK_BRANDING_URL+'</div></div></div>'+SWITCHHTML+'</div></div>';

	return html_ham;
}

$(function(){

	$(document).on("click",".showfirst",function(){
		$(this).children('.share_boxwrap').show();
                        $(this).children('.share_boxwrap').stop(true, true).animate({'top':'-170px', 'height':'170px'}, 200);
                });

	$(document).on("click",".showsecond",function(){
		$(this).children('.share_boxwrap').show();
                        $(this).children('.share_boxwrap').stop(true, true).animate({'top':'-103px', 'height':'100px'}, 200);
                });
	$(document).on("mouseleave",".share_box",function(){
		//$(this).hide();
		$(this).children('.share_boxwrap').stop(true, true).animate({'top':'0px', 'height':'0px'}, 200, function(){$(this).hide();});
	});

//	$(document).on("mouseleave",".share",function(){
  //             $(this).children('.share_boxwrap').hide();
    //    });


	$('.slideout_menu_wrap').height(parseInt($(document).height())-parseInt($('.ds_header').height()));
		$('.follow_update').click(function(){
				$(this).text() === 'Follow' ? $(this).text('Unfollow') : $(this).text('Follow');
			});

			if(langtype == 'ar')
			{
				$(document).click(function(e) {
				if (!$(e.target).closest("#ham_menu").length && $('.slideout_menu_wrap').position().left >= 0) {
					$('.slideout_menu_wrap').css('overflow', 'hidden');
       				$('.slideout_menu_wrap').stop('true, true').animate({'right':'-55px', 'width':'51px'}, 200);
   }
});
				$('#ham_menu').mouseenter(function(){
						$('.slideout_menu_wrap').stop('true, true').animate({'right':'0px'}, 200);	
				}).click(function(){
						if($('.slideout_menu_wrap').width() == '51')
						{
							$('.slideout_menu_wrap').stop('true, true').animate({'width':'250px', 'right':'0px'}, 200, function(){
							$('.slideout_menu_wrap').css('overflow', 'visible');
							});
						}
						else if($('.slideout_menu_wrap').width() == '250')
						{
							$('.slideout_menu_wrap').css('overflow', 'hidden');
							$('.slideout_menu_wrap').stop('true, true').animate({'width':'51px', 'right':'-55px'}, 200);
						}
				});
			}
			else
			{
				$(document).click(function(e) {
                                if (!$(e.target).closest("#ham_menu").length && $('.slideout_menu_wrap').position().left >= 0) {
                                        $('.slideout_menu_wrap').css('overflow', 'hidden');
                                $('.slideout_menu_wrap').stop('true, true').animate({'left':'-55px', 'width':'51px'}, 200);
   }
});
                                $('#ham_menu').mouseenter(function(){
                                                $('.slideout_menu_wrap').stop('true, true').animate({'left':'0px'}, 200);
                                }).click(function(){
                                                if($('.slideout_menu_wrap').width() == '51')
                                                {
                                                        $('.slideout_menu_wrap').stop('true, true').animate({'width':'250px', 'left':'0px'}, 200, function(){
                                                        $('.slideout_menu_wrap').css('overflow', 'visible');
                                                        });
                                                }
                                                else if($('.slideout_menu_wrap').width() == '250')
                                                {
                                                        $('.slideout_menu_wrap').css('overflow', 'hidden');
                                                        $('.slideout_menu_wrap').stop('true, true').animate({'width':'51px', 'left':'-55px'}, 200);
                                                }
                                });
			}
			$('.slideout_menu_wrap').mouseenter(function() {
                if($(this).width() == '51')
				{
					$('.slideout_menu_wrap').stop('true, true').animate({'width':'250px'}, 200, function(){
						$('.slideout_menu_wrap').css('overflow', 'visible');
						});
				}
            });
			$('ul.notify > li').mouseenter(function(){
					$(this).children('.nav_dd').show();
					$('.scroll_custom').jScrollPane({mouseWheelSpeed : 30, showArrows: false});
				}).mouseleave(function(){
					$(this).children('.nav_dd').hide();
					});
			$('.slide_out_menuitemwrap').mouseenter(function(){
				var lvl2 = $(this).children('.slide_level2');
					if(!$(this).is(':animated')){
								lvl2.css('display', 'block');
							if(langtype == 'ar')
							{
								lvl2.stop(true,true).animate({'right':'249px', 'opacity':'1'}, 300, function(){
								});
							}
							else
							{
								lvl2.stop(true,true).animate({'left':'249px', 'opacity':'1'}, 300, function(){
                                                                });
							}
					}
				}).mouseleave(function(){
								if(langtype == 'ar')
								{
									$(this).children('.slide_level2').css({'right':'250px', 'opacity':'0', 'display':'none'});
								}
								else
								{
									$(this).children('.slide_level2').css({'left':'300px', 'opacity':'0', 'display':'none'});
								}
				});
				jQuery('#employee_login').mouseenter(function(){
					jQuery('.ns_reclogin_box').stop(true, true).slideDown(300);
					}).mouseleave(function(){
						jQuery('.ns_reclogin_box').stop(true, true).slideUp(300);
						});
	
	
	});

 function getNotificationCount(lasttime,network)
 {
 var count='0';
 
 for(var key in network)
		{
			if(network[key].SECTION == 'NOTIFICATION')
        	        {
				if(lasttime[0])
				{
				if(network[key].EPOCH_TIME > lasttime[0].NOTIFICATION)
				{
					
        	                	count++;
				}
				}
        	   }
			   if(network[key].SECTION == 'NETWORK')
                        {
                                        if(lasttime[0])
                                        {
                                        if(network[key].EPOCH_TIME > lasttime[0].NETWORK)
                                        {
                                              count++;
                                        }
                                        }
                              
                        }
		}
 return count;
 }
  function set_last_access()
    {
		var typearray=["notification","network"];
		var len=typearray.length;
		for(var i=0;i<len;i++){
	
              var postData =  {type   : typearray[i]};
                        var final_url ="last_access_time.html";
                        var request =  jQuery.ajax({
                                url  : final_url,
                                data : postData,
                                type: "POST",
                                dataType: "json"
                        });
		}

    }
$(document).ready(function()
{
	if(localStorage.getItem('INBOX_CNT') > 0)
	{
	$("#inbox_div").mouseenter(function(){
	//$("#inbox_div").css("display", "none");
	document.getElementById('inbox_cnt').innerHTML = '';
        	        var postData =  {
        	                                type         : 'inbox',
        	                        };
        	        var final_url ="last_access_time.html";
        	        var request =  jQuery.ajax({
        	                url  : final_url,
        	                data : postData,
        	                type: "POST",
        	                dataType: "json"
        	        });

	
	});
	}
	if(localStorage.getItem('NOTIFICATION_CNT') > 0)
	{
	$("#noti_div").mouseenter(function(){
	//$("#noti_div").css("display", "none");
	document.getElementById('noti_cnt').innerHTML = '';
                        var postData =  {
                                                type         : 'notification',
                                        };
                        var final_url ="last_access_time.html";
                        var request =  jQuery.ajax({
                                url  : final_url,
                                data : postData,
                                type: "POST",
                                dataType: "json"
                        });


        });
	}
	if(localStorage.getItem('NETWORK_CNT') > 0)
	{
	$("#network_div").mouseenter(function(){
	//$("#network_div").css("display", "none");
	document.getElementById('net_cnt').innerHTML = '';
                        var postData =  {
                                                type         : 'network',
                                        };
                        var final_url ="last_access_time.html";
                        var request =  jQuery.ajax({
                                url  : final_url,
                                data : postData,
                                type: "POST",
                                dataType: "json"
                        });


        });
	}
});



