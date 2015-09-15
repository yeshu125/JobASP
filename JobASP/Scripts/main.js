list_count = 0;
list_position = 0;
prevKeyword = "";
var ajaxRequestarray = ajaxRequestkeyword = [];
function createUrl(id,txt,mode,type){
	var newUrl = "/";
	if(type=="courses"){
		var onlinearray = [4,5,6,8];
		var cntry = ((mode!="")?(onlinearray.indexOf(mode)?"online":"in"):"in");
		txt = txt.replace(/[^a-zA-Z0-9]+/g,' ').trim().replace(/[^a-zA-Z0-9]+/g,'-');
		newUrl = "/"+cntry+"/course/"+txt+"/"+id;
	} else if((type=="institutes") || (type=="training-institutes")){
		var cntry = "in";
		txt = txt.replace(/[^a-zA-Z0-9]+/g,' ').trim().replace(/[^a-zA-Z0-9]+/g,'-');
		newUrl = "/"+cntry+"/institute/"+txt+"/"+id;
	} 
	else if((type=="colleges")){
		var cntry = "in";
		txt = txt.replace(/[^a-zA-Z0-9]+/g,' ').trim().replace(/[^a-zA-Z0-9]+/g,'-');
		newUrl = "/"+cntry+"/college/"+txt+"/"+id;
	}
	return newUrl;
}
function updateScrollbar(cat){
	// url = "/"+cat;
	var url = cat.replace("/in", ""); 
	$.ajax({
			url:url,
			dataType:'json',
			data:{"updateslider":true,'category':cat},
			success:function(d){
				$('#category-slider').html("");
				$('#category-slider').html(d.dataSlider);
				$('.otherContent').html("");
				$('.otherContent').html(d.dataContent);
				$('.carousel').carousel({
					  interval: 3000
				});
				document.title = d.metadata.title;
			},
	});
}
function scrollRoller(){
	var items = $('#autokeywordlist ul li');
	var divSearchContent = $('#autokeywordlist ul');
    var b1 = divSearchContent[0].getBoundingClientRect();
    var b2 = items.eq(list_position)[0].getBoundingClientRect();
    console.log(list_position);
    if (b1.top>b2.top) {
        divSearchContent.scrollTop( divSearchContent.scrollTop()-b1.top+b2.top );
    }
    else if (b1.bottom<b2.bottom) {
        divSearchContent.scrollTop( divSearchContent.scrollTop()-b1.bottom+b2.bottom );
    }
}
function checkVisible( elm, eval ) {
    eval = eval || "visible";
    var vpH = $(window).height(), // Viewport Height
        st = $(window).scrollTop(), // Scroll Top
        y = $(elm).offset().top,
        elementHeight = $(elm).height();
    
    if (eval == "visible") return ((y < (vpH + st)) && (y > (st - elementHeight)));
    if (eval == "above") return ((y < (vpH + st)));
}
function loadimages(){
	$('body').find('img[img-src]').each(function(){
		if($(this)[0].getAttribute('src')!=null){
			if (checkVisible($(this))) {
				var imageUrl = $(this)[0].getAttribute('img-src');
				$(this).attr('src', imageUrl);
			}
		} 
	});
}
function loadbackgroundimages(){
	$('body').find('*[img-bg-src]').each(function(){
		if($(this).css('background-image')=='none'){
			if (checkVisible($(this))) {
				var imageUrl = $(this)[0].getAttribute('img-bg-src');
				this.style.background='url('+imageUrl+')no-repeat top center #E7E7E7';
			}
		} 
	});
}
window.mkUrl = window.mkUrl || function(s) // s: form serialized data
{
	var aS = s.split('&'),
	    obS = {},
	    i, x, url = '',
	    cnt, cit, key, st, sc = "courses";
	for (i = 0; aS[i] && (x = aS[i].split('=')); i++) {
	    obS[x[0]] = x[1];
	    if (x[0] == 'sc') {
	        sc = x[1];
	    }
	}
	
	searchCategory = obS.sc;
	
	cnt = 'in';
	cit = obS.city;
	key = obS.q;
	if((sc=='courses') || (sc=='course')){
		typ = (['courses'].indexOf(obS.type) + 1 ? obS.type : 'courses');
		st = obS.st;
		var catArray=[],catString = "",stNum=15;
		
		st&1 && catArray.push("classroom");
		st&2 && catArray.push("online");
		st&4 && catArray.push("degree");
		st&8 && catArray.push("certification");
		
		if(st>0 && st!=15){
			if(catArray.length>0){
				if(st==2){
					cnt = 'online';
				}
				catString = catArray.join("-");
			} else {
				catString = "all";
			}
			stNum = st;
		} else if(st==15){
			catString = catArray.join("-");
		} else {
			catString = "all";
			stNum = 15;
		}
		url = '/' + cnt + '/' + sc + '/'+ ((catString!='' && catString!='all')?(catString+'-based-'):((catString=='all')?('all-'):'')) + ((key!='')?(key.replace(' ','+') + '-'):"") + sc + ((cit!='')?('-in-'+cit):'-in-india') + '?st=' + stNum;
		
	} else if((sc=="training-institutes") || (sc=="institute")){
		cit = (obS.cityName!="")?((obS.cityName).toLowerCase()):"india";
		url = '/' + cnt + '/' + sc + '/'+ ((key!='')?(key.replace(' ','+') + '-'):"") + sc + ((cit!='')?('-in-'+cit):'');
		
	} else if(searchCategory=="colleges"){
		// console.log(obS);
		cit = (obS.cityName!="")?obS.cityName:"india";
		inst_for = obS.inst_for,
		inst_type = obS.inst_type;

		if(inst_for==1){
			inst_for_str = "men";
		} else if(inst_for==2){
			inst_for_str = "women";
		} else {
			inst_for_str = "";
		}
		if(inst_type==1){
			inst_type_str = "private";
		} else if(inst_type==2){
			inst_type_str = "govt-public";
		} else if(inst_type==3){
			inst_type_str = "govt-aided";
		} else {
			inst_type_str = "";
		}
		url = '/' + cnt + '/' + sc + '/'+ ((inst_type_str!='')?(inst_type_str+'-'):'') + ((key!='')?(key.replace(' ','+') + '-'):"") + sc + ((inst_for_str!='')?'-for-'+inst_for_str:'')+ ((cit!='')?('-in-'+cit):'');
		
	}

	return url;

};
$(document).ready(function(){
	document.frmSearch.q.focus();
	loadimages();
	loadbackgroundimages();
	$(window).scroll(function(){
		loadimages();
		loadbackgroundimages();
	});
	$('.btn-blgr').click(function() {
	     $('#courseSeach').focus();
	     $("html, body").animate({ scrollTop: $('#frm-search').offset().top }, 'slow');
	      return false;
	});
	
	$('input[name=q]').keyup(function(e){
		var  keyword = $(this).val();
		if(keyword!="" && (e.which>46 || e.which==8 || e.which==32)){
			keyword = keyword.trim();
			if(prevKeyword == keyword){
				return false;
			} else {
				prevKeyword = keyword;
			}
			
			$(ajaxRequestkeyword).each(function(i,k){
				ajaxRequestarray[k].abort();
				ajaxRequestkeyword.pop();
			});
			var category = $('input[name=sc]:checked').val();
			ajaxRequestkeyword.push(keyword);
			$('.loading-icon').addClass('loading-icon-animate');
			$('.loading-icon').show();
			var city = $('input[name=cityName]').val();
			ajaxRequestarray[keyword]	=	$.ajax({
													type:"GET",
													url:'/site/GetAJAXAutoSuggetion',
													dataType:'json',
													data:{"keyword":keyword,'category':category,'city':city},
													success:function(d){
																		keyword = keyword.replace(/\s+/g, ' ');
																		var splittedkeywords = keyword.split(" ");
																		$('.loading-icon').removeClass('loading-icon-animate');
																		$('.loading-icon').hide();
																		list_position = 0;
																		var datalist = "<p class='item_select see_all_search' item_id='0'>See All Results...</p>";
																		list_count = d.length;
																		if(list_count>0){
																			datalist += "<ul class='list-unstyled'>";
																			$(d).each(function(i,k){
																				var tmpitemname = k.item_name_c;
																				if(category=="courses"){
																					tmpitemname = k.item_name_c;
																				} else {
																					if(k.item_name_c==""){
																						var tmpcourseName = "";
																						if(k.inst_static_courses!=""){
																							var tmpcourseNameArray = (k.inst_static_courses).split(", ");
																							var existCourse = [];
																							$(tmpcourseNameArray).each(function(ind,val){
																								$(splittedkeywords).each(function(j,l){
																									var conditionCheck = ((val).toLowerCase().trim()).indexOf((l).toLowerCase().trim());
																									if((conditionCheck>=0)){
																										existCourse.push(val);
																									}
																								});
																							});
																							existCourse = $.unique(existCourse);
																							if(existCourse.length>0){
																								tmpcourseName = " - ("+existCourse.toString()+")";
																							}
																						}
																						tmpitemname = k.item_name_i+((k.inst_static_courses!="")?tmpcourseName:"");
																					} else {
																						tmpitemname = k.item_name_c;
																					}
																				}
																				if(tmpitemname!=null){
																					$(splittedkeywords).each(function(j,l){
																						tmpitemname = tmpitemname.replace((new RegExp('('+l+')', 'gi')),"<b>$1</b>");
																					});
																				}
																				finalString = tmpitemname;
																				var item_id = ((category=="courses")?k.item_id_c:k.item_id_i);
																				var item_name = ((category=="courses")?k.item_name_c:k.item_name_i);

																				var geturl = createUrl(item_id,item_name,k.mode_id,category);
																				var inst_info = "";
																				if(category=="courses"){
																					inst_info = ((k.inst_name!=undefined)?"<small class='pull-right text-muted'>"+k.item_name_i+"</small></li>":"");
																				} else if(category=="training-institutes"){
																					if(k.item_name_c==""){
																					} else {
																						inst_info = ((k.item_name_i!=undefined)?"<small class='pull-right text-muted'>"+k.item_name_i+"</small></li>":"");
																					}
																				}
																				else if(category=="colleges"){
																					if(k.item_name_c==""){
																					} else {
																						inst_info = ((k.item_name_i!=undefined)?"<small class='pull-right text-muted'>"+k.item_name_i+"</small></li>":"");
																					}
																				}
																				datalist += "<li class='item_select itemPosition_"+(i+1)+"' item_id='"+item_id+"' target-href='"+geturl+"'>"+finalString+inst_info;
																			});
																			datalist +="</ul>";
																			$('#autokeywordlist').show();
																			$('#autokeywordlist').html(datalist);
																		} else {
																			$('#autokeywordlist').show();
																			$('#autokeywordlist').html(datalist);
																		}
													}
											});
		} else {
			if(e.which==38){
				if(list_count!=0 && list_position>0){
					list_position--;
					$('.item_select').removeClass('selected_item_color');
					$('.itemPosition_'+list_position).addClass('selected_item_color');
					scrollRoller();
				}
			} else if(e.which==40){
				if(list_count!=0 && list_position<list_count){
					scrollRoller();
					list_position++;
					$('.item_select').removeClass('selected_item_color');
					$('.itemPosition_'+list_position).addClass('selected_item_color');
				}
			} else if(e.which==13){
				e.preventDefault();
				list_count = 0;
				$('.itemPosition_'+list_position).trigger('click',e);
				return false;
			} else if(e.which==27){
				$('.item_select').parent().parent().fadeOut();
				$('.item_select').parent().parent().remove();
			} else {
				$('#autokeywordlist').empty();
				$('#autokeywordlist').hide();
			}
		}
	});
	$('.item_select').live('click',function(){
		if($(this).hasClass('see_all_search')){
			$('#frm-search').submit();
		} else {
			var keyword =  $(this).text();
			$('input[name=q]').val(keyword);
			list_count = 0;
			var newURl = this.getAttribute('target-href');
			window.location = newURl;
		}
	});
	$('input[name="sc"]').change(function(){debugger
		$('#autokeywordlist, .autopopulatecityList').slideUp();
		$('.courseFilters').slideUp();
		$('.citylist').fadeOut();
		$('.collegeFilters').slideUp();
		$('.citylist').css({width:"0%"});
		var cat = $(this).val();
		$('.top-buffer').show();
		cat='/in/'+cat;
		window.history.pushState(null, null,cat);
		if(cat=="/in/courses"){
			$('#courseSeach').attr("placeholder","Search Online Courses / Executive Courses / Professional Certifications ").blur();;
			updateScrollbar(cat);
			$('#bg-learnof').removeClass("inst_background");
			$('#bg-learnof').removeClass("college_background");
			$('#bg-learnof').addClass("course_background");
			$('input[name=q]').parent().animate({
													width: "90%"
												},{
													duration: 500,
													complete: function(){
													$('input[name=q]').parent().css({overflow:"visible"}); 
												}
											});
			$('.courseFilters').slideDown();
		} else if(cat=="/in/training-institutes"){
			$('#courseSeach').attr("placeholder"," Search Training Institutes / Courses / Skills ").blur();;
			updateScrollbar(cat);
			$('#bg-learnof').removeClass("course_background");
			$('#bg-learnof').removeClass("college_background");
			$('#bg-learnof').addClass("inst_background");
			$('.citylist').fadeIn();
			$('input[name=q]').parent().animate({
													width: "60%",
													overflow:"visible"
												},{
													duration: 700,
													complete: function(){
														$('input[name=q]').parent().css({overflow:"visible"}); 
													}
												});
			$('.citylist').animate({width: "30%","margin-left":"10px"},650);
		} else if(cat=="/in/colleges"){
			$('#courseSeach').attr("placeholder", "Search Colleges / Diploma Courses / Bachelors Courses / Masters Courses").blur();;
			updateScrollbar(cat);
			$('.top-buffer').slideUp();
			$('#bg-learnof').removeClass("course_background");
			$('#bg-learnof').removeClass("inst_background");
			$('#bg-learnof').addClass("college_background");
			$('input[name=q]').parent().animate({
													width: "90%"
												},{
													duration: 1500,
													complete: function(){
													$('input[name=q]').parent().css({overflow:"visible"}); 
												}
											});
			$('.collegeFilters').slideDown();
		}
	});
	$('input[name="cityName"]').keyup(function(){
		var CityList = JSON.parse(localStorage.cityList),
		existcitylist = Array(),
		existcitylistcontent = "<ul class='list-unstyled text-muted'>",
		enteredCityName = $(this).val();
		enteredCityName = enteredCityName.toLowerCase().trim();
		if(enteredCityName!=""){
			$(CityList).each(function(i,v){
				tmpCityName = v.name;
				tmpCityName = tmpCityName.toLowerCase();
				if(tmpCityName.substring(0,enteredCityName.length) == enteredCityName){
					existcitylist.push(v);
					existcitylistcontent +="<li item-id='"+v.id+"'>"+v.name+"</li>";
					
				}
			});
			if(existcitylist.length>0){
				existcitylistcontent += "</ul>";
				$('.autopopulatecityList').css({
													width:$('input[name=cityName]').outerWidth(),
													top:($('input[name=cityName]').position().top+$('input[name=cityName]').outerHeight()),
													left:($('input[name=cityName]').position().left)
												});
				$('.autopopulatecityList').fadeIn();
				$('.autopopulatecityList').html(existcitylistcontent);
			} else {
				$('.autopopulatecityList').fadeOut();
				$('.autopopulatecityList').html("");
			}
		} else {
			$('.autopopulatecityList').fadeOut();
		}
	});
	$('.autopopulatecityList li').live('click',function(){
		$('input[name="cityName"]').val($(this).html());
		$('input[name="city"]').val($(this).html());
		$('.autopopulatecityList').fadeOut();
	});
	
	$('.start_search').click(function(){
		 $('html,body').animate({ scrollTop: 0 }, 'slow');
		 $('input[name="q"]').focus();
	});
	var course_placeholder = "Enter Course Name / Technology / Skills / Institute Name / Certification",
	institute_placeholder = "Enter Institute / University Name ";
	
	var $bxSrchType = $('.bx-srch-type input[type=checkbox]'),
		$elLoc = $('#elLoc'),
		$cityName = $('#city-name'),
		$hidSrchType = $('#sch-type'),
		$cityList = $elLoc.find('.cityList');
	$elLoc.find('a').change(function(){
		if(!$(this).is('[data-id]')){
			$cityName.val('');
			return false;
		}
		var cname = $elLoc.find('.loc-name');
		$cityName.val(cname.text());
	});
	$cityList.change(function(){
		var v=this.value,t=$(this).find('option[value='+v+']').text();
		$cityName.val(t);
	});
	
	$bxSrchType.change(function(e){
		if($(this).val()=='15')
			$bxSrchType.prop('checked', $(this).is(':checked'));
		else if($bxSrchType.not('[value=15]').length == $bxSrchType.not('[value=15]').filter(':checked').length)
			$bxSrchType.filter('[value=15]').prop('checked', true);
		else
			$bxSrchType.filter('[value=15]').prop('checked', false);
		
		var txt = '',t,st=0;
		if((t=$bxSrchType.filter(':checked').length)==1)
			txt = $bxSrchType.filter(':checked').val();
		else if(t==0)
			txt = '0';
		else
		{
			$bxSrchType.filter(':checked').each(function(){
				st|=this.value;
			});
			txt=st;
		}
		$hidSrchType.val(txt);
	});
	
	$('#frm-search').on('submit',function(e){
		e.preventDefault();
		var sData=$(this).serialize(),
			url = mkUrl(sData);
		if(list_position>0){
			if($('.itemPosition_'+list_position).hasClass('selected_item_color')){
				$('.itemPosition_'+list_position).trigger('click',e);
			} else {
				window.location = url;
			}
		} else {
			window.location = url;
		}
	});

	$('.search_category').click(function(){
		// $('.search_category').removeClass('search_category_selected');
		$(this).addClass('search_category_selected');
		$('input[name="sc"]').val(this.getAttribute('data-search-type'));
		if(this.getAttribute('data-search-type')=="institute"){
			$('#institute_search').modal({backdrop: 'static', keyboard: false});
			$('#institute_search .modal-dialog').width($('input[name="q"]').outerWidth()*1.2);
			$('#institute_search .modal-body').height(($('input[name="q"]').outerHeight()*2)+30);
			$('input[name="q"]').attr("placeholder",institute_placeholder);
			window.history.pushState(null, null, '#institute_search');
		} else if(this.getAttribute('data-search-type')=="course"){
			$('input[name="q"]').attr("placeholder",course_placeholder);
			window.history.pushState(null, null, '#course_search');
		}
	});
	$('.close_inst_search').click(function(){
		$('input[name="q"]').attr("placeholder",course_placeholder);
		$('.search_category[data-search-type="course"]').trigger('click');
	});
	$(document).mouseup(function (e)
	{
		var targetList = [$(".autopopulatecityList"),$("#autokeywordlist")];
	    
	    $(targetList).each(function(i,container){
	    	if (!container.is(e.target) && container.has(e.target).length === 0)
	    	{
	    		container.slideUp();
	    	}
	    });
	});
});