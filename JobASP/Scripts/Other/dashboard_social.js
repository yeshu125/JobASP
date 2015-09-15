if (! Mons)
{       
        var Mons={};
}               

if (! Mons.BASE_SERVER)
{       
        Mons.BASE_SERVER='monsterindia.com';
} 
var mediapath = "http://media."+Mons.BASE_SERVER;
var pathname = window.location.pathname;
if (pathname.charAt(0) == "/") pathname = pathname.substr(1);
if(window.location.protocol.indexOf("https:") == 0)
{
        mediapath = "https://media4."+Mons.BASE_SERVER;
}
function show_loading()
{
	$('.loading_wrap').css('filter', 'alpha(opacity=70)').fadeIn();
}
function hide_loading()
{
	$('.loading_wrap').hide();
}
jQuery(function(){

		/* required for brandmaximizer start*/
        var bm_timeout='';
                function hide_brandmaximizer(){
                        if(!jQuery('.sc_brandmaximizer_popup').is(':animated'))
                        {
                                clearTimeout(bm_timeout);
                                        jQuery('.sc_brandmaximizer_popup').css('overflow','hidden');
                                        jQuery('.sc_brandmaximizer_popup').animate({'left':'0px', 'top':'0px', 'opacity':'0.5', 'height': '0px', 'width':'180px'}, 1500, function(){
                                                jQuery('.pop_bg').fadeOut();
                                                jQuery('.sc_brandmaximizer_popup').hide();
                                                document.body.style.overflow = "";
                                                jQuery('.sc_brandmaximizer_inner').find('img').slideDown();
                                                });
                        }
                }
                function show_brandmaximizer(){
                                if(jQuery('.sc_brandmaximizer').css('display') == 'block')
                                {
                                document.body.style.overflow = "hidden";
                                document.body.scrollTop = '0px';
                                jQuery('.pop_bg').fadeIn(function(){
                                        jQuery('.sc_brandmaximizer_popup').fadeIn(300);
                                });
       
                                jQuery('.sc_brandmaximizer_popup_close').click(function(){
                                        hide_brandmaximizer();
                                });
                                bm_timeout = setTimeout(function(){
                                        hide_brandmaximizer();
                                        }, 2000);
                                }
                }
        /* required for brandmaximizer end */
		jQuery(window).load(function(){
                show_brandmaximizer();
                });



		
			$('.close_commnt').click(function(){
					$(this).closest('.close').remove();
				});
	
		$('#comment').click(function(){
				$('.pop_bg').show();
				$('#comment_popup').fadeIn();
			});
			$('#commentpop_close').click(function(){
					$('#comment_popup').fadeOut(function(){
							$('.pop_bg').hide();
						});
				});
		
		$('.tabitem').click(function(){
			
			var ele = $(this);
			if(!$(this).hasClass('active') && !$(this).hasClass('loaded')){
				show_loading();
				setTimeout(function(){
					hide_loading();
					$('.tabitem').removeClass('active');
					ele.addClass('active loaded');
					$('.tab_content').hide();
					$('#'+ele.data('content')).show();
				}, 3000);
			}
			else if(!$(this).hasClass('active') && $(this).hasClass('loaded'))
			{
					$('.loading_wrap').hide();
					$('.tabitem').removeClass('active');
					ele.addClass('active');
					$('.tab_content').hide();
					$('#'+ele.data('content')).show();
			}
		});
		$('.conn').mouseenter(function(){
				$(this).children('.tooltip').show();
			}).mouseleave(function(){
				$(this).children('.tooltip').hide();
			});
					
	});


function displayRecommendations(recommendations)
{
	var html='';
	var length_rec = '0';
	if(recommendations)
	{
		length_rec = recommendations.length;
		var count_rec = '0';
        	if(length_rec > 0)
        	{
        	        for(var key in recommendations)
        	        {
				count_rec++;
        	                html += '<div class="pf_rec_item color1">';
					html += '<div class="left">';
        	                        	html += ' <a class="lnkall" href="http://my.'+Mons.BASE_SERVER+'/my_publicprofile.html?uid='+key+'"><img src="'+recommendations[key].IMG_PATH+'" class="dp"></a>';
					html += '</div>';
					html += '<div class="left">';
						html += '<a class="lnkall" href="javascript:void(0);">';
							html += '<div class="h_big">'+recommendations[key].NAME+'</div>';
							html += '<div class="f_h2">'+recommendations[key].DESIGNATION+'</div>';
							html += '<div class="f_h3">'+recommendations[key].COMPANY_NAME+'</div></a>';
						html += '</a>';
					html += '</div>';
					html += '<div class="clr"></div>';
					html += '<div class="txt">'+recommendations[key].REC_TEXT+'</div>';
					html += '<div class="date">'+recommendations[key].UPDATED+'</div>';
        	                html += '</div>';
				if(count_rec == '2' )
				{
					break;
				}
        	        }
        	        if(length_rec > 0)
        	        {
        	              html += '<div class="view_more_wrap"><a href="http://my.'+Mons.BASE_SERVER+'/my_recommendations.html" class="link">'+xmldata.VIEW_ALL+'</a></div>';
        	        }
        	}
        	else
        	{
				html += '<div class="no_datatext_wrap">'+xmldata.IMPROVE_YOUR_PROFILE+'<div class="notxt_btn"><a style="" class="apply_btn shd_commn" href="http://my.'+Mons.BASE_SERVER+'/my_connections.html">'+xmldata.SEE_YOUR_CONNECTION+'</a></div></div>';
        	}
	}
	else
	{

		html += '<div class="no_datatext_wrap">'+xmldata.IMPROVE_YOUR_PROFILE+'<div class="notxt_btn"><a style="" class="apply_btn shd_commn" href="http://my.'+Mons.BASE_SERVER+'/my_connections.html">'+xmldata.SEE_YOUR_CONNECTION+'</a></div></div>';
	}
        var count_html_rec = xmldata.RECOMMENDATION+': ('+length_rec+')';
        document.getElementById('recommendation_id').innerHTML = html;
        document.getElementById('recommendation_count').innerHTML = count_html_rec;
}


function displayConnections(connections)
{
	var connection_nos='0';
	var html='';
	var setting = document.getElementById('settingblock1').value;
	if(setting == 'none')
	{
		html += '<div class="no_datatext_wrap"><div class="h_sm">You have Choosen to be a private profile.</div><div class="h_sm1">To grom your connections network &nbsp; <a class="link" href="http://my.'+Mons.BASE_SERVER+'/personalsettings.html?tab=1">switch to public profile</a></div><div class="nodata_txt">Know Benefits of connection:<ul><li>'+xmldata.BENEFIT1+'</li><li>'+xmldata.BENEFIT2+'</li><li>'+xmldata.BENEFIT3+'</li></ul></div>';
	}
	else if(connections)
	{
		var count_con = '0';
		var arr = [];
        	for(var key in connections) {
        	        arr.push(key);
        	}
        	connection_nos = arr.length;

		if(connection_nos > 0)
		{
			html += '<div class="pf_con_input_wrap"><div class="icon" onclick=doPreview();></div><input type="text" id="findfriend" value="Search in your connections" onfocus="if(this.value  == \'Search in your connections\') { this.value = \'\'; } " onblur="if(this.value == \'\') { this.value = \'Search in your connections\'; } " /></div>';
			for(var key in connections)
			{
				count_con++;
				html += '<div class="pf_con_wrap left">';
					html += '<div class="left">';
						html += '<a href="http://my.'+Mons.BASE_SERVER+'/my_publicprofile.html?uid='+key+'" class="lnkall">';
							html += '<img src="'+connections[key].IMG_PATH+'" class="dp">';
						html += '</a>';
					html += '</div>';
					html += '<div class="left">';	
						html += '<a href="http://my.'+Mons.BASE_SERVER+'/my_publicprofile.html?uid='+key+'" class="lnkall">';
							var name = connections[key].NAME.substring(0,20);
							html += '<div class="h_big">'+name+'</div>';
							if(connections[key].DESIGNATION)
							{
								var desig = connections[key].DESIGNATION.substring(0,20);
								html += '<div class="f_h2">'+desig+'</div>';
							}
							if(connections[key].COMPANY_NAME)
							{
								var name_comp = connections[key].COMPANY_NAME.substring(0,20);
								html += '<div class="f_h3">'+name_comp+'</div>';
							}
						html += '</a>';
						if(connections[key].RECOMMEND_STATUS)
						{
							if(connections[key].RECOMMEND_STATUS == 'ask')
							{
								html += '<div class="pf_get_rec">'+xmldata.PENDING_REC+'</div>';
							}
							else
							{
								html += '<div class="pf_get_rec">'+xmldata.ALREADY_REC+'</div>';
							}
						}
						else
						{
							html += '<div id="'+key+'"><a class="pf_get_rec" href="javascript:void(0);" onclick=recommend_request('+key+');>'+xmldata.GET_RECOMMENDATION+'</a></div>';
						}
					html += '</div>';
					html += '<div class="clr"></div>';
				html += '</div>';
				if(count_con == '2' )
        	                {
        	                        break;
        	                }
			}
				html += '<div class="clr"></div>';
			if(connection_nos > 0)
			{
			      html += '<div class="view_more_wrap"><a href="http://my.'+Mons.BASE_SERVER+'/my_connections.html" class="link">'+xmldata.VIEW_CONN+'</a></div>';
			}
		}
		else
		{
			html += '<div class="no_datatext_wrap">'+xmldata.BUILD_UR_NETWORK+'<div class="notxt_btn"><a class="apply_btn shd_commn" href="http://my.'+Mons.BASE_SERVER+'/suggest_connections.html">'+xmldata.ADD_CONNECTIONS+'</a></div></div>';
		}
	}
	else
	{
		html += '<div class="no_datatext_wrap">'+xmldata.BUILD_UR_NETWORK+'<div class="notxt_btn"><a class="apply_btn shd_commn" href="http://my.'+Mons.BASE_SERVER+'/suggest_connections.html">'+xmldata.ADD_CONNECTIONS+'</a></div></div>';
	}
	var count_html = xmldata.CONNECTIONS+': ('+connection_nos+')';
	document.getElementById('connection_id').innerHTML = html;
	document.getElementById('connection_count').innerHTML = count_html;
}


function getJobConnections(JOB_ID,JOB_CNAME,JOB_COMPID)
{
	var postData =  {
                                job_id          :       JOB_ID,
                                job_cname       :       JOB_CNAME,
                                job_compid      :       JOB_COMPID,
                        };
                        var final_url ="company_connection.html";
                        var request =  $.ajax({
                                url  : final_url,
                                data : postData,
                                type: "GET",
                                dataType: "json"
                        });
                        request.done(function(response) {
				if(response)
				{
					return response;
				}
			});
}

function displaymatchingjobs(jobs,type,myenvid)
{
	var html='';
	if(jobs)
	{
		if(jobs.length > 0)
		{
			html += '<div class="rsltmain_wrap">';
			for(var key in jobs)
			{
				//var connectionresponse =   getJobConnections(jobs[key].FOLDERID ,jobs[key].COMPANY_NAME,jobs[key].COMPANY);
				//var connectionresponse =   getJobConnections('15548499' ,'Mechanical','213622');
				var connectionresponse;
				var tooltip_html = '';
				if(connectionresponse)
				{
					for (var key in connectionresponse)
                                	{
                                	        var conn_obj = connectionresponse[key].CONNECTION;
                                	        if(conn_obj)
                                	        {
                                	                var conn_count = conn_obj.length;
                                	                if(conn_count > 0)
                                	                {
                                	                        var conn_namespace = 'Connections';
                                	                        if(conn_count == 1)
                                	                        {
                                	                                conn_namespace = 'Connection';
                                	                        }
                                	                        tooltip_html += '<div class="icon"></div>'+conn_count+' connections <div class="tooltip"><div class="tarrw"></div><div class="tooltip_innr">';
                                	                        for(var i=0;i<conn_count;i++)
                                	                        {
                                	                                tooltip_html += '<div class="name">'+conn_obj[i].NAME+'</div>';
                                	                        }

                                	                        tooltip_html += '</div></div>';
                                	                }
                                	       	}
						else
						{
							tooltip_html += 'No Connection';
						}
                                	}
				}
				else
				{
					tooltip_html += '';
				}
				if(jobs[key].JOB_MODEL == "WJP")
				{
					html +='<div class="rsltmain_item walkin">';
					html +='<div class="logo_bg"></div>';
				}
				else
				{
					html +='<div class="rsltmain_item">';
				}
					html +='<div class="rsltmain_tbl">';
						html +='<div class="rsltmain_tblcell">';
							html +='<div class="logo_wrap left big">';
							if(jobs[key].LOGO)
							{
								html +=jobs[key].LOGO;
							}
							html +='</div>';
							html +='<div class="left">';
								html +='<div class="f_h1">'+jobs[key].TITLE+'</div>';
								html +='<div class="f_h3">'+jobs[key].COMPANY_NAME+'</div>';
								html +='<div class="f_h2">'+jobs[key].LOCATIONS+', '+jobs[key].MINEXP+'-'+jobs[key].MAXEXP+' '+xmldata.YEARS+'</div>';
							html +='</div>';
							html +='<div class="clr"></div>';
						html +='</div>';
						html +='<div class="rsltmain_tblcell follow_wrap"><a href="http://jobs.'+Mons.BASE_SERVER+'/details/'+jobs[key].FOLDERID+'.html" target="_blank" class="apply_btn shd_commn">'+xmldata.VIEW+'</a></div>';
					html +='</div>';
					html +='<div class="share_wrap"><ul class="share_innr">';
						html += jobs[key].SHARE;
						html +='<li class="left"><a href="http://jobsearch.'+Mons.BASE_SERVER+'/searchresult.html?cid='+jobs[key].COMPANY+';lan=1" class="rec" target="_blank"><div class="icon"></div>'+xmldata.REC_JOBS+'</a></li>';
						html +='<li class="left"><a href="http://jobsearch.'+Mons.BASE_SERVER+'/searchresult.html?rfr=SIM_JOB&sim_job='+jobs[key].FOLDERID+'&srt=rel&strict_mxe=&djbm=" target="_blank" class="similar"><div class="icon"></div>'+xmldata.SIMILAR_JOBS+'</a></li>';
						if(jobs[key].SAVED_JOB == '1')
						{
							html +='<li class="left"><a href="javascript:void(0);" class="saved" onclick="save_unsave_jobs(\'unsave\','+myenvid+','+jobs[key].FOLDERID+',this);"><div class="icon"></div>'+xmldata.UNSAVE+'</a></li>';
						}
						else
						{
							html +='<li class="left"><a href="javascript:void(0);" class="save" onclick="save_unsave_jobs(\'save\','+myenvid+','+jobs[key].FOLDERID+',this);"><div class="icon"></div>'+xmldata.SAVE+'</a></li>';
						}

						html +='<li class="left">';
							html+='<a href="javascript:void(0);" class="conn">'+tooltip_html+'</a>';
						html +='</li>';
					html +='</ul></div>';
				html +='</div>';
				
			}
			html += '</div>';
		}
		else
		{
			html += '<div style="height:294px" class="rsltmain_wrap"><div class="no_datatext_wrap">'+xmldata.CURR_NO_JOBS+'</div></div>';
		}
	}
	else
	{
		html += '<div style="height:294px" class="rsltmain_wrap"><div class="no_datatext_wrap">'+xmldata.CURR_NO_JOBS+'</div></div>';
	}
	document.getElementById(type).innerHTML = html;
}

function getjobs(type)
{
	if(type)
	{
		var postData =  {
        	                                        REQ_SRC         : type,
        	                                };
        	var final_url ="matchingjobs.html";
        	var request =  $.ajax({
        	        url  : final_url,
        	        data : postData,
        	        type: "POST",
        	        dataType: "json"
        	});
		request.done(function(response) {
			if(type == 'network_job')
			{
				displaynetworktab(response.DATA,type);
			}
			else
			{
				displaymatchingjobs(response.DATA.DATA,type);
			}
        	});
	}
}

function getSuggestComp()
{
		var sign = document.getElementById('signature').value;
		var corsBrowserComp = document.getElementById('corsBrowserComp').value;
		var tm = document.getElementById('tm').value;
		if(sign && env_uid)
		{
                	var postData =  {
                	                                        sig         : sign,
                	                                        uid         : env_uid,
                	                                        cid         : channel_Id,
                	                                        scid         : subchannel_Id,
                	                                        type         : 'comp',
                	                                        comp_type     : 'all',
                	                                        tm         : tm,
                	                                        base_server         : Mons.BASE_SERVER,
                	                                        default_logo         : 'n',
                	                                };
			var final_url='';
			if(corsBrowserComp == '1')
			{
                		final_url ='http://app.'+Mons.BASE_SERVER+'/company_suggestion.html';
			}
			else
			{
				final_url ="company_suggestion.html";
			}
                	var request =  $.ajax({
                	        url  : final_url,
                	        data : postData,
                	        type: "POST",
                	        dataType: "json"
                	});
                	request.done(function(response) {
					if(response && response.DATA != '')
					{
                	                	companyFollow(response.DATA);
					}
					else
					{
						var html_sugcomp = '<div style="margin-top:18px" class="no_datatext_wrap">'+xmldata.NO_SUG_COMP+'</div>';
        					document.getElementById('follow_compid').innerHTML = html_sugcomp;
					}
                	});
		}
}

function getSkillQuotient()
{
                var sign = document.getElementById('signature').value;
		var corsBrowserComp = document.getElementById('corsBrowserComp').value;
		var tm = document.getElementById('tm').value;
                if(sign && env_uid)
                {
                        var postData =  {
                                                                sig         : sign,
                                                                uid         : env_uid,
                                                                tm         : tm,
                                                        };
			var final_url='';               
                        if(corsBrowserComp == '1')
                        {
                                final_url ='http://app.'+Mons.BASE_SERVER+'/skill_quotient_api.html';
                        }       
                        else
                        {
                                final_url ="skill_quotient_api.html";
                        }
                        var request =  $.ajax({
                                url  : final_url,
                                data : postData,
                                type: "POST",
                                dataType: "json"
                        });
                        request.done(function(response) {
                                        if(response.HTML != '')
                                        {
						$("#skill_quotient").append('<script type="text/javascript" src="'+mediapath+'/v2/js/common/seeker/skillquot_slider.js?34343434"></script>');		
						$("#skill_quotient").append(response.HTML);		
                                        }
                        });
                }
}


function getCompUpts()
{
		var sign = document.getElementById('signature').value;
                var corsBrowserComp = document.getElementById('corsBrowserComp').value;
                var tm = document.getElementById('tm').value;
                if(sign && env_uid)
                {
                        var postData =  {
                                                                sig         : sign,
                                                                uid         : env_uid,
                                                                tm         : tm,
								envbaseserver : Mons.BASE_SERVER,
								scid : subchannel_Id,
								
                                                        };
                        var final_url='';
                        if(corsBrowserComp == '1')
                        {
                                final_url ='http://app.'+Mons.BASE_SERVER+'/company_updates_api.html';
                        }
                        else
                        {
                                final_url ="company_updates_api.html";
                        }
                        var request =  $.ajax({
                                url  : final_url,
                                data : postData,
                                type: "POST",
                                dataType: "json"
                        });
                        request.done(function(response) {
                                        if(response && response.DATA != '')
                                        {
						displayCompUpts(response.DATA);
                                        }
					else
					{
						var html = '<div class="no_datatext_wrap">'+xmldata.NO_UPDATES_FOLLOW_COMP+'</div>';
        					document.getElementById('compUpt').innerHTML = html;
					}
                        });
                }
}

function displayCompUpts(data)
{
	var html='';
	var htmlpop='';
	if(data)
	{
			var len = data.length;
                        for(i=0;i<len;i++)
			{
				html += '<div class="update_item">';
				if(data[i].COMP_LOGO)
				{
					html += '<div class="logo_wrap left"><a href="http://company.'+Mons.BASE_SERVER+'/corpprofile/index.html?corpid='+data[i].CORPID+'" class="lnkall"><img src="'+data[i].COMP_LOGO+'" class="shd_commn"></a></div>';
				}
				html += '<div class="up_content"><span class="dark">'+data[i].COMP_NAME+'</span>';
				if(!data[i].IMAGE)
				{
					html += data[i].POST;
				}
				if(data[i].IMAGE)
				{
					html += '<div class="blog_post_wrap"><div class="left"><img src="'+data[i].IMAGE+'"></div><div class="blog_content"><div class="blog_txt">'+data[i].POST+'</div></div><div class="clr"></div></div>';
				}
				html += '<div class="social_action"><div class="left"><a href="javascript:void(0);" id="likecount" class="link" onclick="likecomp('+data[i].PO_ID+','+data[i].CORPID+','+env_uid+');">'+xmldata.LIKE+' ('+data[i].LIKES+')</a> | <a href="javascript:void(0);" onclick="commentcomp(\''+data[i].PO_ID+'\',\''+data[i].CORPID+'\',\''+env_uid+'\');" class="link" id="comment">'+xmldata.COMMENT+' ('+data[i].COMMENTS+')</a> | '+data[i].SHARE+'</div><div class="right date">'+xmldata.POSTED_ON+': '+data[i].UPDATED+'</div><div class="clr"></div></div></div><div class="clr"></div></div><div class="seemore_wrap"><a href="http://my.'+Mons.BASE_SERVER+'/company_updates.html" class="link">'+xmldata.SEE_UPDATE+'</a> </div>';

				htmlpop +='<div class="pop_main" style="width:561px"><div class="pop_main_inner"><div class="pop_head">'+xmldata.COMPANY_UPDATES+'<div class="right pop_close" id="commentpop_close" onclick="closepopup();"></div></div><div class="blog_headwrap"><div class="left">';
				if(data[i].COMP_LOGO)
				{
					htmlpop +='<img width="110px" height="40px" src="'+data[i].COMP_LOGO+'">';
				}
				htmlpop +='</div><div class="left post_txt"><strong>';
				if(data[i].COMP_NAME)
                                {
                                        htmlpop += data[i].COMP_NAME;
                                }
				htmlpop +='</strong>';
				if(data[i].POST)
                                {
                                        htmlpop += data[i].POST;
                                }
                                htmlpop +='</div><div class="clr"></div></div><div class="allcomment_wrap" id="commentlist"></div><div class="comment_box"><div class="cminput_wrap left"><input type="text" class="cminput_txt" id="commentext"></div><div class="right"><input type="submit" class="apply_btn shd_commn colr" value="Comment" onclick="commentupdate(\''+data[i].PO_ID+'\',\''+data[i].CORPID+'\',\''+env_uid+'\');"/></div><div class="clr"></div></div></div></div>';
				

				break;	
			}
	}
	else
	{
		html += '<div class="no_datatext_wrap">'+xmldata.NO_UPDATES_FOLLOW_COMP+'</div>';
	}
	document.getElementById('compUpt').innerHTML = html;
	document.getElementById('comment_popup').innerHTML = htmlpop;
}

function displaynetworktab(data,type)
{
	var html='';
        if(data.ERROR == 0)
        {
		html += '<div class="rsltmain_wrap">';
		for(var key in data.DATA)
                {
			if(key == 'company')
			{
				for(i=0;i<data.DATA[key].length;i++)
				{
					html += '<div class="rsltmain_item"><div class="rsltmain_tbl"><div class="rsltmain_tblcell">';
                                	html += '<div class="logo_wrap left big">';
					if(data.DATA[key][i].IMAGE)
					{
						html +=	'<img src="'+data.DATA[key][i].IMAGE+'">';
					}
					html+= '</div>';
                                	html += '<div class="left"><div class="f_h3">'+data.DATA[key][i].NAME+'</div>';
					if(data.DATA[key][i].INDUSTRY != null)
					{
						html += '<div class="f_h2">'+data.DATA[key][i].INDUSTRY+'</div>';
					}
					html += '<div class="f_h2">Posted '+data.DATA[key][i].COUNT+' jobs</div></div>';
                                	html += '<div class="clr"></div>';
                                	html += '</div><div class="rsltmain_tblcell follow_wrap"><a class="apply_btn shd_commn" href="'+data.DATA[key][i].LINK+'" target="_blank">'+xmldata.VIEW+'</a></div></div>';
                                    	html += '<div class="share_wrap"><ul class="share_innr"><li class="left">'+data.DATA[key][i].SHARE+'</li><li class="left"><a class="rec" href="http://jobsearch.'+Mons.BASE_SERVER+'/searchresult.html?cid='+data.DATA[key][i].ID+';lan=1"><div class="icon"></div>'+xmldata.ALL_JOBS_COMPANY+'</a></li></ul></div>';
					html += '</div>';
				}
			}
			else if(key == 'recruiter')
			{
				for(j=0;j<data.DATA[key].length;j++)
				{
					html += '<div class="rsltmain_item"><div class="rsltmain_tbl"><div class="rsltmain_tblcell">';
					html += '<div class="logo_wrap left small">';
					if(data.DATA[key][j].IMAGE)
					{
						html += '<img src="'+data.DATA[key][j].IMAGE+'">';
					}
					html += '</div>';
                                	html += '<div class="left"><div class="f_h1">'+data.DATA[key][j].NAME+'</div><div class="f_h3">'+data.DATA[key][j].COMPANY+'</div><div class="f_h2">Posted '+data.DATA[key][j].COUNT+' jobs</div></div>';
                                	html += '<div class="clr"></div></div><div class="rsltmain_tblcell follow_wrap"><a class="apply_btn shd_commn" href="'+data.DATA[key][j].LINK+'" target="_blank">'+xmldata.VIEW+'</a></div></div>';
					html += '<div class="share_wrap"><ul class="share_innr"><li class="left">'+data.DATA[key][j].SHARE+'</li></ul></div>';
					html += '</div>';
				}
			}
		}	
		html += '</div>';
	}
	else
        {
		html += '<div style="height:294px" class="rsltmain_wrap"><div class="no_datatext_wrap">'+xmldata.NO_JOBS+'<br>'+xmldata.FOLLOW_MORE_REC+'</div></div>';
        }
        document.getElementById(type).innerHTML = html;	
}

function likecomp(poid,corpid,seekerid)
{
	if(poid && corpid && seekerid)
	{
		var postData =  {
                                                        TYPE        : 'like',
                                                        POID        : poid,
                                                        CORPID        : corpid,
                                                        SEEKERID        : seekerid,
                                                };
                var final_url ="http://my."+Mons.BASE_SERVER+"/likepostcomp.html";
                var request =  $.ajax({         
                        url  : final_url,               
                        data : postData,        
                        type: "POST",           
                        dataType: "json"        
                });                                     
                request.done(function(response) {      
			if(response.ERROR == 0)
                        {
				document.getElementById('likecount').innerHTML = 'Like ('+response.LIKES+')';
                        }
                        else
                        {
                                alert(response.ERROR_MSG);
                        } 
                });
	}
}

function commentcomp(poid,corpid,seekerid)
{
	$('.pop_bg').show();
        $('#comment_popup').fadeIn();
	if(poid && corpid && seekerid)
	{
		document.getElementById('commentext').value = '';
		var postData =  {
                                                        TYPE        : 'commentlisting',
                                                        POID        : poid,
                                                        CORPID        : corpid,
                                                        SEEKERID        : seekerid,
                                                };
                var final_url ="http://my."+Mons.BASE_SERVER+"/likepostcomp.html";
                var request =  $.ajax({
                        url  : final_url,
                        data : postData,
                        type: "POST",
                        dataType: "json"
                });
                request.done(function(response) {
                        if(response.ERROR == 0)
                        {
                                document.getElementById('commentlist').innerHTML = response.DATA;
                        }
                        else
                        {
                        }
                });
	}
}

function commentupdate(poid,corpid,seekerid)
{
	if(poid && corpid && seekerid)
        {
		var comment = document.getElementById("commentext").value;
		if(comment)
		{
                	var postData =  {
                	                                        TYPE        : 'docomment',
                	                                        POID        : poid,
                	                                        CORPID        : corpid,
                	                                        SEEKERID        : seekerid,
                	                                        COMMENT        : comment,
                	                                };
                	var final_url ="http://my."+Mons.BASE_SERVER+"/likepostcomp.html";
                	var request =  $.ajax({
                	        url  : final_url,
                	        data : postData,
                	        type: "POST",
                	        dataType: "json"
                	});
                	request.done(function(response) {
                	        if(response.ERROR == 0)
                	        {
					commentcomp(poid,corpid,seekerid);
					document.getElementById('comment').innerHTML = xmldata.COMMENTS+'('+response.COMMENTS+')';
					document.getElementById('commentext').value = '';
                	        }
                	        else
                	        {
                	                alert(response.ERROR_MSG);
                	        }
                	});
		}
		else
		{
			alert('Please fill your comment');
		}
        }
}


function follow_rec_ajax(rec_id,type)
{
	if(rec_id)
	{
		var postData =  {
                                                        REC_ID         : rec_id,
                                                };
                var final_url ="recfollow.html";
                var request =  $.ajax({
                        url  : final_url,
                        data : postData,
                        type: "POST",
                        dataType: "json"
                });
                request.done(function(response) {
			if(response.ERROR == 0)
				{
					var my_html='';
					if(type == 'rpanel')
					{
						my_html = '<a href="javascript:void(0);" onclick="unfollow_rec(\'' + rec_id + '\',\'rpanel\');"class="btn follow_update">'+xml.PAGE_CONTENT.UNFOLLOW+'</a>';
						var cnt_id = 'cnt_'+rec_id;
						var followCountTxt = "Followers";
						if(response.FOLLOW_COUNT == 1)
						{
							followCountTxt = "Follower";
						}
						document.getElementById(cnt_id).innerHTML = response.FOLLOW_COUNT+' '+followCountTxt;
					}
					else
					{
						my_html = '<a href="javascript:void(0);" onclick="unfollow_rec(\'' + rec_id + '\');"class="follow_btn">'+xml.PAGE_CONTENT.UNFOLLOW+'</a>';		
					}
					var myid = 'fol_'+rec_id;
					document.getElementById(myid).innerHTML = my_html;
					if(document.getElementById('recfollow_cnt'))
					{
						var recfollowcnt = document.getElementById('recfollow_cnt').innerHTML;
						recfollowcnt = Number(recfollowcnt) + Number(1);
						document.getElementById('recfollow_cnt').innerHTML = recfollowcnt;
					}
					
                                }
				else
				{
					
                                        alert('Unable to follow');
                                }
                });
	}
}

function unfollow_rec(rec_id,type)
{
	if(rec_id)
        {
                var postData =  {
                                                        REC_ID         : rec_id,
                                                        TYPE         : 'unfollow_rec',
                                                };
                var final_url ="recfollow.html";
                var request =  $.ajax({
                        url  : final_url,
                        data : postData,
                        type: "POST",
                        dataType: "json"
                });
                request.done(function(response) {
                        if(response.ERROR == 0)
                                {
					var my_html='';
					if(type == 'rpanel')
					{
                                        	my_html = '<a href="javascript:void(0);" class="btn follow_update" onclick="follow_rec_ajax(\'' + rec_id + '\',\'rpanel\');">'+xml.PAGE_CONTENT.FOLLOW+'</a>';
						var cnt_id = 'cnt_'+rec_id;
                                                var followCountTxt = "Followers";
                                                if(response.FOLLOW_COUNT == 1)
                                                {
                                                        followCountTxt = "Follower";
                                                }  
						document.getElementById(cnt_id).innerHTML = response.FOLLOW_COUNT+' '+followCountTxt;
					}
					else
					{
						my_html = '<a href="javascript:void(0);" class="follow_btn" onclick="follow_rec_ajax(\'' + rec_id + '\');">'+xml.PAGE_CONTENT.FOLLOW+'</a>';
					}
					var myrecid = 'fol_'+rec_id;
                                        document.getElementById(myrecid).innerHTML = my_html;
					if(document.getElementById('recfollow_cnt'))
					{
						var recfollowcnt = document.getElementById('recfollow_cnt').innerHTML;
                                        	recfollowcnt = recfollowcnt - 1;
                                        	document.getElementById('recfollow_cnt').innerHTML = recfollowcnt;
					}

                                }
                                else
                                {

                                        alert('Unable to unfollow');
                                }
                });
        }
}


function companyFollow(follow)
{
        var html = '';
	var len='0';
        if(follow)
        {
                        html += '<div class="fcmpslide_box"><ul class="fcmpslider">';
			len = follow.length;
			for(i=0;i<len;i++)
			{
				var image = '';
				var class_logo = '';
				if(follow[i].IMAGE != '' &&  follow[i].IMAGE != null)
				{
					image = '<img src="'+follow[i].IMAGE+'">';
				}
				else
				{
					class_logo = 'name';
					image = follow[i].NAME;
				}
				if(follow[i].FOLLOW_STATUS == '1')
				{
					
					html += '<li class="left '+class_logo+'"><a href="" >'+image+'</a><div class="follow_wrap"><a class="follow_btn shd_commn" href="javascript:void(0);" onclick="comp_follow(this,'+follow[i].ID+',\'unfollow\');" title="'+follow[i].NAME+'">'+xml.PAGE_CONTENT.UNFOLLOW+'</a></div></li>';
				}
				else
				{
					html += '<li class="left '+class_logo+'"><a href="" >'+image+'</a><div class="follow_wrap"><a class="follow_btn shd_commn" href="javascript:void(0);" onclick="comp_follow(this,'+follow[i].ID+',\'follow\');" title="'+follow[i].NAME+'">'+xml.PAGE_CONTENT.FOLLOW+'</a></div></li>';
				}
			}
                        html += '</ul></div>';
                      	if(len > 5)
                      	{
                        	html += '<div class="navbtn lt fnavbtn" id="flt">';
                        	html += '</div><div class="navbtn rt active fnavbtn" id="frt"></div>';
                      	}
        }
        else
        {
		html += '<div style="margin-top:18px" class="no_datatext_wrap">'+xmldata.NO_SUG_COMP+'</div>';	
        }
        document.getElementById('follow_compid').innerHTML = html;
}
function RecFollow_html(rec_follow)
{
	var html = '';
	var follow = '';
	if(rec_follow)
	{
		var len = rec_follow.length;
		if(len > 0)
		{
			jQuery.each(rec_follow, function (k, val) {
			 html += '<div class="left rec_info">';
			  html += '<div class="left rimg"><a href="http://my.'+Mons.BASE_SERVER+'/recruiter_profile.html?id='+val.PROFILE_ID+'" target="_blank"><img src="' + val.IMAGE + '"></a></div>';
			  html += '<div class="left" style="width:170px">';
			  var name = val.NAME.substring(0,20);
			  var curdesig = val.CURRENT_DESIGNATION.substring(0,32);
			  var curcomp = val.CURRENT_COMPANY.substring(0,20);
			  html += '<div class="f_h1">' + name + '</div>';
			  html += '<div class="f_h2">' + curdesig + '</div>';
			  html += '<div class="f_h3">' + curcomp + '</div>';
			  html += '</div>';
			  html += '<div class="lclr"></div>';
			  html += '</div>';
			  if(val.FOLLOW_TEXT == 'Unfollow')
			  {
			  	follow = '<div class="left rec_fbtn" id="fol_'+val.PROFILE_ID+'"><a class="follow_btn" href="javascript:void(0);" onclick="unfollow_rec(\'' + val.PROFILE_ID + '\');">'+xml.PAGE_CONTENT.UNFOLLOW+'</a></div>';
			  }
			  else
			  {
				follow = '<div class="left rec_fbtn" id="fol_'+val.PROFILE_ID+'"><a class="follow_btn" href="javascript:void(0);" onclick="follow_rec_ajax(\'' + val.PROFILE_ID + '\');">Follow</a></div>';
			  }
			  html += follow;
                          html += '<div class="right"><a class="insight_btn" href="http://my.'+Mons.BASE_SERVER+'/recruiter_list.html" target="_blank"></a></div>';
                          html += '<div class="clr"></div>';
			return false;
			});
		}
		else
		{
			 html += '<br><div style="text-align:left"><strong></strong></div>';
		}
	} 
	else
	{
		html += '<br><div style="text-align:left"><strong></strong></div>';
	}
	document.getElementById('follow_rec') .innerHTML = html;
}
function plotLevel(data, value)
{
        var level = [value];
    options = {
     chart: {
      renderTo: data,
    },
    series: [{
            enableMouseTracking: false,
                name: false,
                data: level,
                tooltip: {
                enabled:false
                },
                        animation: {
                    duration: 2500,
                                        easing: 'easeInOutElastic'
                }
    }]
  };
  options = jQuery.extend(true, {}, options);
   var chart = new Highcharts.Chart(options);
}

function lazyLoadChart(meter_json)
{
	var count = 1;

	var final_json = activity_meter_link(meter_json);

	$('.gauge_wrap_main').each(function()
	{
                   var chart_id = 'chart'+ count++;
                   if($(this).data('level') == 11)
                   {
				   var pop_met = parseInt(meter_json.POPULARITY_METER.TOTAL);
                                   plotLevel($(this).children('.gauge_wrap').attr('id'), pop_met);
				   document.getElementById('pop_met_text').innerHTML = '<strong>Visibility </strong>: '+final_json.popularity_link;
				   document.getElementById('pop_met_level').innerHTML = meter_json.POPULARITY_METER.RATING;
				   
                              
                   }
                   if($(this).data('level') == 12)
                   {
				
				  var asp_met =  parseInt(meter_json.ASPIRITATION_METER.TOTAL);
                                   plotLevel($(this).children('.gauge_wrap').attr('id'), asp_met);
				document.getElementById('asp_met_text').innerHTML = '<strong>mPower </strong>: '+final_json.aspiritation_link;
				document.getElementById('asp_met_level').innerHTML = meter_json.ASPIRITATION_METER.RATING;
                              
                   }
                   if($(this).data('level') == 13)
                   {
				var soc_met = parseInt(meter_json.SOCIAL_METER.TOTAL);
                                   plotLevel($(this).children('.gauge_wrap').attr('id'), soc_met);
				 document.getElementById('soc_met_text').innerHTML = '<strong>Social </strong>: '+final_json.social_link;
				 document.getElementById('soc_met_level').innerHTML = meter_json.SOCIAL_METER.RATING;
                              
                   }
                                
         });
}

//kanika code starts
function activity_meter_link(meter_json) {
	var POPULARITY_STRING = meter_json.POPULARITY_METER.SUGGESTIONS_STRING;
        var ASPIRITATION_STRING = meter_json.ASPIRITATION_METER.SUGGESTIONS_STRING;
        var SOCIAL_STRING = meter_json.SOCIAL_METER.SUGGESTIONS_STRING;

	var activity_suggestion_hash = {
		'1'     :      'javascript:void(0)',
                '2'     :      'http://jobsearch.'+Mons.BASE_SERVER+'/search.html',
                '3'     :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '4'     :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '5'     :      'http://jobsearch.'+Mons.BASE_SERVER+'/search.html',
                '6'     :      'http://jobsearch.'+Mons.BASE_SERVER+'/search.html',
                '7'     :      'http://my.'+Mons.BASE_SERVER+'/company_list.html',
                '8'     :      'http://my.'+Mons.BASE_SERVER+'/company_list.html',
                '9'     :      'http://my.'+Mons.BASE_SERVER+'/recruiter_list.html',
                '10'    :      'http://my.'+Mons.BASE_SERVER+'/recruiter_list.html',
                '11'    :      'http://my.'+Mons.BASE_SERVER+'/my_connections.html',
                '12'    :      'http://jobsearch.'+Mons.BASE_SERVER+'/search.html',
                '13'    :      'http://content.'+Mons.BASE_SERVER+'/article_index.html',
                '14'    :      'http://my.'+Mons.BASE_SERVER+'/company_updates.html',
                '15'    :      'http://my.'+Mons.BASE_SERVER+'/my_connections.html',
                '16'    :      'http://my.'+Mons.BASE_SERVER+'/my_connections.html',
                '17'    :      'http://my.'+Mons.BASE_SERVER+'/company_updates.html',
                '18'    :      'http://my.'+Mons.BASE_SERVER+'/company_updates.html',
                '19'    :      'http://content.'+Mons.BASE_SERVER+'/index.html',
                '20'    :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '21'    :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '22'    :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '23'    :      'http://content.'+Mons.BASE_SERVER+'/index.html',
                '24'    :      'http://my.'+Mons.BASE_SERVER+'/my_recommendations.html#get_rec',
                '25'    :      'http://my.'+Mons.BASE_SERVER+'/my_connections.html',
                '26'    :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '27'    :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '28'    :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '29'    :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '30'    :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html',
                '31'    :      'http://my.'+Mons.BASE_SERVER+'/suggest_connections.html',
                '32'    :      'http://my.'+Mons.BASE_SERVER+'/view_resume.html'
		};
	if(activity_suggestion_hash[meter_json.ASPIRITATION_METER.SUGGESTIONS_STRING_ID]) {
		ASPIRITATION_STRING = '<a href="'+activity_suggestion_hash[meter_json.ASPIRITATION_METER.SUGGESTIONS_STRING_ID]+'">'+meter_json.ASPIRITATION_METER.SUGGESTIONS_STRING+'</a>';
	}
	if(activity_suggestion_hash[meter_json.SOCIAL_METER.SUGGESTIONS_STRING_ID]) {
		SOCIAL_STRING = '<a href="'+activity_suggestion_hash[meter_json.SOCIAL_METER.SUGGESTIONS_STRING_ID]+'">'+meter_json.SOCIAL_METER.SUGGESTIONS_STRING+'</a>';
	}
	if(activity_suggestion_hash[meter_json.POPULARITY_METER.SUGGESTIONS_STRING_ID]) {
		POPULARITY_STRING = '<a href="'+activity_suggestion_hash[meter_json.POPULARITY_METER.SUGGESTIONS_STRING_ID]+'">'+meter_json.POPULARITY_METER.SUGGESTIONS_STRING+'</a>';
	}

	var final_json = {
		popularity_link 	: POPULARITY_STRING,
		aspiritation_link	: ASPIRITATION_STRING,
		social_link		: SOCIAL_STRING
	}
	return final_json;
}
//kanika code ends

function recommend_request(uid_send)
{
        var postData =  {
                                uid_send : uid_send,
                                type:'ask'
                        };
        var final_url ="recommend.html";
        var request =  $.ajax({
                url  : final_url,
                data : postData,
                type: "POST",
                dataType: "json"
        });
        request.done(function(response) {

                document.getElementById(uid_send).innerHTML = '<a href="javascript:void(0);" class="pf_get_rec">'+xmldata.PENDING_REC+'</a>';

        });
        return false;
}

function doPreview()
{
	var name = document.getElementById('findfriend').value; 
	var url ="my_connections.html";
	var form = $('<form action="' + url + '" method="post">'+'<input type="text" name="search_name" value="' + name + '" />' +'</form>');
	$('body').append(form);  // This line is not necessary
	$(form).submit();
}

function closepopup()
{
	$('#comment_popup').fadeOut(function(){
                                                        $('.pop_bg').hide();
                                                });
}



