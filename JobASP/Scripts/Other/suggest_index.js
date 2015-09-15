					function extractLastOneComma(term){
						var tmp = term.toString().substr(term.length-1,1);
						if(tmp==',')
						return true
						else
						return false;		
					}
					var cacheSuggation = {};	
					function Suggation(e){
							var txtValue =	jQuery.trim(e.val());
							var txtArr	=	[];
							jQuery(".ui-autocomplete").hide();		
							
							if(txtValue.indexOf(',') >= 0 )
							{
								txtValue = txtValue.toString();
								txtArr = txtValue.split(',');
								
								if(parseInt(txtArr.length) >= 2)
								{	
									if(extractLastOneComma(txtValue))
									txtValue = txtArr[parseInt(txtArr.length)-2];
									else
									txtValue = txtArr[parseInt(txtArr.length)-1];
									
									txtValue = txtValue.replace(/"/g, '');
								}
								else{
										txtValue = txtValue.toString();
										txtValue = txtValue.substring(0, txtValue.length - 1);
										txtValue = txtValue.replace(/"/g, '');
								}
									
							}
								
								txtValue = jQuery.trim(txtValue.toString().toLowerCase());
								
								if(parseInt(txtValue.length) >= 2){
								
								if ( txtValue in cacheSuggation ) {							
									jQuery('#suggestions').html('');	
									jQuery.each( cacheSuggation[ txtValue ], function( i,data  ) {
										jQuery('#suggestions').append('<li><div class="left suggested_word" style="margin-left:3px; cursor:pointer;">'+data.name+'</div><div class="clear_left"></div></li>');
									});
									jQuery(".ui-autocomplete").hide();
									jQuery('#show_search_suggestions').slideDown();
									return;
									}
									
									jQuery.ajax({
										type: "GET",
										url: "autosuggest_keyskills.html?q="+txtValue,
										dataType: "JSON"
										}).done(function( data ) {
										if(data){
											jQuery('#suggestions').html('');
											cacheSuggation[txtValue]	=	data;
											jQuery.each( data, function( i, data ) {
												jQuery('#suggestions').append('<li><div class="left suggested_word" style="margin-left:3px; cursor:pointer;">'+data.name+'</div><div class="clear_left"></div></li>');
											});
											
											jQuery(".ui-autocomplete").hide();
											jQuery('#show_search_suggestions').slideDown();
										}
										});
									}
									setTimeout("jQuery('.ui-autocomplete').hide()", 400);
							

						}
						function inArray(needle, haystack) {
						    var length = haystack.length;
							needle = jQuery.trim(needle).toString().toLowerCase();
						    for(var i = 0; i < length; i++) {
							var strVal=jQuery.trim(haystack[i]);
							strVal = strVal.replace(/"/g, '');
							strVal= strVal.toString().toLowerCase();
							if(strVal == needle) return true;
						    }
						    return false;
						}
						function splitN( val ) {
							return val.split( /,\s*/ );
						}
						function extractLast( term ) {
							return splitN( term ).pop();
						}
						function extractLastTwo(term){
							var tmp = splitN( term ).pop();
							tmp = tmp.toString().substr(0,2);
							tmp = tmp.toLowerCase();
							return tmp;
						}
					jQuery(function(){
						var data_ar =[];
						var tmp_data_Arr =[];
						var tmp_data_key ="";
						var cache = {};
						var cacheDesig = {};
						var cacheimg = {};
						var imgdata =[];
						var termDesig = "";
						jQuery('#fts_id').autocomplete({	
						source: function (request, response) {
							var keyTerm = extractLastTwo(request.term);
							if( (extractLast(request.term).length >=2) &&  ( keyTerm != tmp_data_key)  && !extractLastOneComma(request.term)){
								if ( keyTerm in cache ) {
									results = jQuery.ui.autocomplete.filter(cache[ keyTerm ], request.term ) ;
									response(results.slice(0, 10));
									if(keyTerm in cacheimg)
									{
										var html = getImg(cacheimg [keyTerm ],keyTerm);
										if(html)
											jQuery('.ui-autocomplete').append(html);
									}
									return;
								}
								jQuery.ajax({
									type: "GET",
									url: "suggest.html?q="+keyTerm+"&type=kwd",    
									dataType: "text",
									success: function(data){
										tmp_data_Arr = data.split("~");
										tmp_data_key=tmp_data_Arr[1];
										var contentImg = data.split("#$#");
										suggestImg = contentImg[1];
										imgdata =  suggestImg.split("||");
										
										if(data){
											var tmp_data = tmp_data_Arr[0].split("|");
											data_ar =[];
											for(var i=0; i<tmp_data.length; i++)
											{
												data_ar.push(tmp_data[i]);
											}
										}
										results = jQuery.ui.autocomplete.filter(data_ar, extractLast( request.term ) ) ;
										cache[ keyTerm ] = data_ar;
										cacheimg [keyTerm ] = imgdata ;
										
										response(results.slice(0, 10));
										var html = getImg(cacheimg [keyTerm ],keyTerm);
										if(html)

											jQuery('.ui-autocomplete').append(html);								
									}
								}); 
							}
							else
							{
								if(data_ar && !extractLastOneComma(request.term)){
									results = jQuery.ui.autocomplete.filter(data_ar, extractLast( request.term ) ) ;
									cache[ request.term ] = data_ar;
									response(results.slice(0, 10));
									if(imgdata)
									{
										cacheimg [request.term ] = imgdata;
										var html = getImg(imgdata,request.term);
										if(html)
											jQuery('.ui-autocomplete').append(html);
									}
								}
								
							}
							
						},
						minLength:2,
						focus: function() {
							return false;
						},
						select: function( event, ui ) {
							var terms = splitN( this.value );
							terms.pop();
							terms.push( ui.item.value );
							terms.push( "" );
							this.value = terms.join( "," );
							Suggation(jQuery(this));
							return false;
						},
						position: {
							offset: '-31 0' // Shift 20px to the left, 4px down.
						 },
						appendTo: "#auto_key_wrap",
                                                                                          open: function(){
                                                                                                         var parent_width = jQuery("#auto_key_wrap").width();
                                                                                                         if(parent_width) parent_width = parent_width+25 ;
                                                                                                         jQuery('#auto_key_wrap  > ul').css('width', parent_width+"px");
                                                                                          }

						});   
					});
					jQuery(function(){
						var data_ar =[];
						var tmp_data_Arr =[];
						var tmp_data_key ="";
						var cache = {};
						var cacheDesig = {};
						var cacheimg = {};
						var imgdata =[];
						var termDesig = "";
						jQuery(document).on('mouseenter', '#skills', function(){            
				                if(!jQuery(this).hasClass('binded')){
						/*
						jQuery(this).keyup(function(e){
                                                                if(e.keyCode == 188 || e.keyCode == 9){
                                                                        Suggation(jQuery('#skills'));
                                                                } else{
                                                                        //jQuery('#show_search_suggestions').slideUp();
                                                                }
                                                        });
						*/
						jQuery(this).autocomplete({	
						source: function (request, response) {
								jQuery.trim(request.term);
								var keyTerm = extractLast(request.term);
								jQuery.ajax({
									type: "GET",
									url: "suggest.html?q="+keyTerm+"&type=skills",    
									dataType: "text",
									success: function(data){
										if(data)
										{
											dataArr = data.split("###");
                                                                                        skill_ar =[];
                                                                                        for(var i=0; i<dataArr.length; i++)
                                                                                        {
												idskillsplit = dataArr[i].split("|");
												var temp_hash ={};
												temp_hash.value=idskillsplit[1];
												temp_hash.id=idskillsplit[0];
												skill_ar.push(temp_hash);
                                                                                        }
										
											results = jQuery.ui.autocomplete.filter(skill_ar, extractLast( request.term ) ) ;
	                                                                                response(results.slice(0, 10));
                                                                                }
										
									}
								}); 
						},
						minLength:2,
						focus: function() {
							return false;
						},
						select: function( event, ui ) {
							var terms = splitN( this.value );
							terms.pop();
							terms.push( ui.item.value );
							terms.push( "" );
							this.value = terms.join( "," );
							var idterms = splitN(jQuery( "#skillsid" ).val());
							    idterms.pop();
    								idterms.push(ui.item.value+':'+ui.item.id);
    								idterms.push('');
    							jQuery( "#skillsid" ).val(idterms.join(','))
							//Suggation(jQuery(this));
							return false;
						},
						position: {
							offset: '-10 0' // Shift 20px to the left, 4px down.
						 },
						appendTo: "#auto_key_wrap",
                                                                                          open: function(){
                                                                                                         var parent_width = jQuery("#auto_key_wrap").width();
                                                                                                         if(parent_width) parent_width = parent_width+9 ;
                                                                                                         jQuery('#auto_key_wrap  > ul').css('width', parent_width+"px");
                                                                                          }

						});   
						
						}
					 });
					});
					jQuery(function(){
						var data_ar =[];
						var tmp_data_Arr =[];
						var tmp_data_key ="";
						var cache = {};
						var cacheDesig = {};
						var termDesig = "";
						jQuery('#lmy').autocomplete({
						source: function (request, response) {
							var keyTerm = extractLastTwo(request.term);
							if( (extractLast(request.term).length >=2) &&  ( keyTerm != tmp_data_key)  && !extractLastOneComma(request.term)){
								if ( keyTerm in cache ) {
									results = jQuery.ui.autocomplete.filter(cache[ keyTerm ], request.term ) ;
									response(results.slice(0, 10));
									return;
								}
								jQuery.ajax({
									type: "GET",
									url: "suggest.html?q="+keyTerm+"&type=loc",    
									dataType: "text",
									success: function(data){
										tmp_data_Arr = data.split("~");
										tmp_data_key=tmp_data_Arr[1];
										if(data){
											var tmp_data = tmp_data_Arr[0].split("|");
											data_ar =[];
											for(var i=0; i<tmp_data.length; i++)
											{
												data_ar.push(tmp_data[i]);
											}
										}
										results = jQuery.ui.autocomplete.filter(data_ar, extractLast( request.term ) ) ;
										cache[ keyTerm ] = data_ar;
										response(results.slice(0, 10));
									}
								}); 
							}
							else
							{
								if(data_ar && !extractLastOneComma(request.term)){
									results = jQuery.ui.autocomplete.filter(data_ar, extractLast( request.term ) ) ;
									cache[ request.term ] = data_ar;
									response(results.slice(0, 10));
								}
							}
						},
						minLength:2,
						focus: function() {
							return false;
						},
						select: function( event, ui ) {
							var terms = splitN( this.value );
							terms.pop();
							terms.push( ui.item.value );
							terms.push( "" );
							this.value = terms.join( "," );
							return false;
						},
						position: {
							offset: '-30 0' // Shift 20px to the left, 4px down.
						 },
						appendTo: "#auto_loc_wrap",
                                                                                          open: function(){
                                                                                                         var parent_width = jQuery("#auto_loc_wrap").width();
													if(parent_width == 123)
													{ 
														parent_width = parent_width+32;
													}
													else
													{	
                                                                                                         	if(parent_width) parent_width = parent_width+9 ;	
													}
                                                                                                         jQuery('#auto_loc_wrap  > ul').css('width', parent_width+"px");
                                                                                          }

						});   
					});
					jQuery(document).ready(function(){
						jQuery('#fts_id').keyup(function(e){
								if(e.keyCode == 188 || e.keyCode == 9){
									Suggation(jQuery('#fts_id'));
								} else{
									//jQuery('#show_search_suggestions').slideUp();
								}
							});
							jQuery('.close_search_suggestions').live('click', function(e){
							jQuery('#show_search_suggestions').slideUp();
							});
							jQuery('.suggested_word').live('click', function(){
								var currentId = "fts_id";
								var currentVal= jQuery('#'+currentId).val();
								var found = false;
								jQuery(this).parent().css({"background-color": "#E8C969"});
								if( currentVal.indexOf(',') > 0)
								{	
									found =inArray(jQuery(this).text(),currentVal.split(","));
									if(!found){
									if(jQuery('#'+currentId).val() !="Enter Job Title, Skills or Company name" && jQuery('#'+currentId).val() !="Enter Job Title, Skills or Company name" && jQuery('#'+currentId).val() !="Enter Job Title, Skills or Company name" ){
										if(jQuery.trim(jQuery(this).text()).indexOf(" ")>0)
											jQuery('#'+currentId).val(jQuery('#'+currentId).val()+' "'+jQuery(this).text()+'",');
										else
											jQuery('#'+currentId).val(jQuery('#'+currentId).val()+' '+jQuery(this).text()+',');
									}else{
										if(jQuery.trim(jQuery(this).text()).indexOf(" ")>0)
											jQuery('#'+currentId).val('"'+jQuery(this).text()+'",');
										else
											jQuery('#'+currentId).val(jQuery(this).text()+',');
									}
									}
								}else{

									if(jQuery('#'+currentId).val() !="Enter Job Title, Skills or Company name" && jQuery('#'+currentId).val() !="Enter Job Title, Skills or Company name" && jQuery('#'+currentId).val() !="Enter Job Title, Skills or Company name" ){
										if(jQuery.trim(jQuery(this).text()).indexOf(" ")>0)
											jQuery('#'+currentId).val(jQuery('#'+currentId).val()+' "'+jQuery(this).text()+'",');
										else
											jQuery('#'+currentId).val(jQuery('#'+currentId).val()+' '+jQuery(this).text()+',');
									}else{
										if(jQuery.trim(jQuery(this).text()).indexOf(" ")>0)
											jQuery('#'+currentId).val('"'+jQuery(this).text()+'",');
										else
											jQuery('#'+currentId).val(jQuery(this).text()+',');
									}
								}
							});
							jQuery(document).click(function(e){
								if (!jQuery(e.target).parents('div').hasClass("open_singleselect")){
										jQuery(".single_select").hide();
								}
							
								if (!jQuery(e.target).parents('div').hasClass("show_search_suggestions")  && (!jQuery(e.target).hasClass("ns_input_box")) ){
										jQuery('#show_search_suggestions').slideUp();
								}
							
							});
													});


	function getImageSubUrl()
{
               var baseUrl = Mons.BASE_SERVER;
               if(baseUrl.match(/sg/ig))
               {
                              return 'sg';
               }
               else if(baseUrl.match(/id/ig))
               {
                              return '';
               }
               else if(baseUrl.match(/ph/ig))
               {
                              return 'ph';
               }
               else if(baseUrl.match(/th/ig))
               {
                              return 'th';
               }
               else if(baseUrl.match(/my/ig))
               {
                              return 'my';
               }
               else if(baseUrl.match(/vn/ig))
               {
                              return 'vn';
               }
               else if(baseUrl.match(/hk/ig))
               {
                              return 'hk';
               }
               else
               {
                              return '';
               } 
}						
function getImg(cachedata,keyTerm)
{
	var imgd = cachedata;
	var imgsrc;
	var imgalt;
	var imghref;

	if(imgd){
			jQuery.each(imgd, function( index, img ){
		        var imgarr =img.split('~~');
	                if(imgarr && imgarr.length > 0){
				var imgvr = imgarr[0].toLowerCase();
				keyTerm = keyTerm.toLowerCase();
        	             if(imgvr.match("^"+keyTerm)){
                	              imgsrc = imgarr[1];
                        	      imgalt = imgarr[3];
	                              imghref = imgarr[2];
        	             }
                 	}
           });
	}
	var tempUrl= getImageSubUrl();    
	var imghtml = '';				   
	if(imgsrc){
		imghtml = '<li style="border-bottom:solid 1px #bfbfbf; width:493; height:100; color:#376db0;" class="bg_white"><a href="'+imghref+'" alt="'+imgalt+'" style="height:100px;"><img width="493" height="100" src="http://media.'+Mons.BASE_SERVER+'/'+tempUrl+'/logos/'+imgsrc+'" /></a></li>';
	}
	return imghtml;

}
