function updateCombo(comboid, json)
{
	var combo = $('#' + comboid)[0];

	//for (var i in combo.options)
	for (var i=0; i<combo.options.length; ++i)
	{
		if( combo[i].selected ) combo[i].selected = false;
	}

	if(json)
	{
		$('select[id = "' + comboid + '"] option[value = "' + json + '"]')[0].selected = true;
	}

	$("#" + comboid).trigger("change");
}


function  editor(){

$(function() {
	$(".sortable").sortable({
		containment: "parent", 
		connectWith: ".sortable", 
		distance: 50, 
		forcePlaceholderSize: false, 
		tolerance: "pointer", 
		handle: ".handlesortable"
	});
});


$(function() {
	$(".innersortable1").sortable({
		containment: "parent", 
		connectWith: ".innersortable1", 
		distance: 50, 
		forcePlaceholderSize: false, 
		tolerance: "pointer", 
		handle: ".handleinnersortable1"
	});
});


$(function() {
	$(".innersortable2").sortable({
		containment: "parent", 
		distance: 50, 
		forcePlaceholderSize: false, 
		tolerance: "pointer", 
		handle: ".handleinnersortable2"
	});
});


tinymce.init(
	{
	
		selector: ".editable",
		inline: true,
		plugins: [
			"advlist autolink lists link anchor visualblocks contextmenu paste textcolor"
		],
		//toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
		//toolbar: "bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link ",
		toolbar: "bold italic underline | forecolor | link ",
		menubar: false, 
		forced_root_block: false, 
		//document.querySelectorAll('.editable')[0].innerHTML="";
		//force_br_newlines: true, 
		//force_p_newlines: false

		setup: function (ed) {
			ed.on ('change focus blur init', function(e) {
				//console.log(e);
				if (e.target.bodyElement.textContent=='' || e.target.bodyElement.innerText=='')
				{
					e.target.bodyElement.removeAttribute('data-placeholder-hidden');
					//console.log("Empty.");
				}
				else
				{
					e.target.bodyElement.setAttribute('data-placeholder-hidden', '');
					//console.log("Non-empty.");
				}
			});
		}

	}
);

}


function loadData()
{
	var elm = [];
	var elms;
	//document.getElementById('btn_follow').style.cursor="default";
	
	initLocation();
	initNationality();
	if(COMBO_DATA.NATIONALITY_VAL)
	{
		try
		{
			updateCombo( 'nationality', COMBO_DATA.NATIONALITY_VAL);
		}
		catch(e)
		{
			// if(console && console.log) console.log("Error initializing location combo");
			// alert("Error initializing location combo");
		}
	}
	if(COMBO_DATA.CURLOCATION_VAL)
	{
		 try
                {
                      updateCombo( 'location', COMBO_DATA.CURLOCATION_VAL);
                }       
                catch(e)
                {       
                        // if(console && console.log) console.log("Error initializing location combo");
                        // alert("Error initializing location combo");
                }     
	}
}


function locationHash()
{
	var hash = new Object();
     var arr = new Array();
	
	for (var i in COMBO_DATA.CURLOCATION)
	{
	
	    arr[COMBO_DATA.CURLOCATION[i].id]=COMBO_DATA.CURLOCATION[i].values;
		//hash[ COMBO_DATA.CURLOCATION[i].id ] = COMBO_DATA.CURLOCATION[i].values;
	}
	return arr;
}
function nationalityHash()
{
	var hash = new Object();
	for (var i in COMBO_DATA.NATIONAITY)
	{
		hash[ COMBO_DATA.NATIONAITY[i].id ] = COMBO_DATA.NATIONAITY[i].values;
	}
	return hash;
}

function initNationality()
{
	var nationHash = nationalityHash();
	var e = document.createElement('select');
        e.setAttribute('id', 'nationality');
        e.setAttribute('name', 'nationality');
        e.setAttribute('style', 'background:url() 0 0 no-repeat; -webkit-appearance: none;');
        //e.setAttribute('multiple', '');
        //e.setAttribute('data-placeholder', '-- select location --');

        var o = document.createElement('option');
        o.setAttribute('value', '');
        e.appendChild(o);

if( COMBO_DATA.SCID == '1')
{
var o1 = document.createElement('option');
                o1.setAttribute('value', 'IN');
                o1.innerHTML = "Indian";
e.appendChild(o1);
//$nationlaityheader =<option value='IN' >Indian</option>;
}
else if(COMBO_DATA.SCID == '5')
{

var o1 = document.createElement('option');
                o1.setAttribute('value', 'HK');
                o1.innerHTML = "Hong Kong";
e.appendChild(o1);
//$nationlaityheader .=qq{<option value='HK' >Hong Kong</option>};
}
else if(COMBO_DATA.SCID == '6')
{
var o1 = document.createElement('option');
                o1.setAttribute('value', 'SG');
                o1.innerHTML = "Singaporean";
e.appendChild(o1);
//$nationlaityheader .=qq{<option value='SG' >Singaporean</option>};
}
else if(COMBO_DATA.SCID == '8')
{
var o1 = document.createElement('option');
                o1.setAttribute('value', 'TH');
                o1.innerHTML = "Thai";
e.appendChild(o1);
//$nationlaityheader .=qq{<option value='TH' >Thai</option>};
}
else if(COMBO_DATA.SCID == '9')
{
var o1 = document.createElement('option');
                o1.setAttribute('value', 'VN');
                o1.innerHTML = "Vietnamese";
e.appendChild(o1);
//$nationlaityheader .=qq{<option value='VN' >Vietnamese</option>};
}
else if(COMBO_DATA.SCID == '10')
{
var o1 = document.createElement('option');
                o1.setAttribute('value', 'ID');
                o1.innerHTML = "Indonesian";
e.appendChild(o1);
//$nationlaityheader .=qq{<option value='ID' >Indonesian</option>};
}
else if(COMBO_DATA.SCID == '11')
{
var o1 = document.createElement('option');
                o1.setAttribute('value', 'MY');
                o1.innerHTML = "Malaysian";
e.appendChild(o1);
//$nationlaityheader .=qq{<option value='MY' >Malaysian</option>};
}
else if(COMBO_DATA.SCID == '2')
{
var o1 = document.createElement('option');
                o1.setAttribute('value', 'BH');
                o1.innerHTML = "Bahraini";
e.appendChild(o1);
var o1 = document.createElement('option');
                o1.setAttribute('value', 'IQ');
                o1.innerHTML = "Iraqi";
e.appendChild(o1);
var o1 = document.createElement('option');
                o1.setAttribute('value', 'KW');
                o1.innerHTML = "Kuwaiti";
e.appendChild(o1);
var o1 = document.createElement('option');
                o1.setAttribute('value', 'OM');
                o1.innerHTML = "Omani";
e.appendChild(o1);
var o1 = document.createElement('option');
                o1.setAttribute('value', 'QA');
                o1.innerHTML = "Qatari";
e.appendChild(o1);
var o1 = document.createElement('option');
                o1.setAttribute('value', 'SA');
                o1.innerHTML = "Saudi Arabia";
e.appendChild(o1);
var o1 = document.createElement('option');
                o1.setAttribute('value', 'AE');
                o1.innerHTML = "United Arab Emirates";
e.appendChild(o1);
//$nationlaityheader .=qq{<option value='BH' >Bahraini</option><option value='IQ' >Iraqi</option><option value='KW' >Kuwaiti</option><option value='OM' >Omani</option><option value='QA' >Qatari</option><option value ='SA'>Saudi Arabia</option><option value ='AE'>United Arab Emirates</option>};
}


	
        for (var i in nationHash)                                 // optiongroup - region/state
        {
		var o = document.createElement('option');
		o.setAttribute('value', i);
		o.innerHTML = nationHash[i];
		e.appendChild(o);
        }

        $('#PLACEHOLDER_combo_nationality')[0].appendChild(e);
	if(glassdoor == 1)
	{
        	$('#nationality').select2({placeholder: MSG['NATIONALITY'], allowClear: true, width: "300px"});
	}
	else
	{
		$('#nationality').select2({placeholder: MSG['NATIONALITY'], allowClear: true, width: "502px"});
	}
	$('#s2id_nationality .select2-chosen').addClass("req");
        $('#nationality').on('change',function(){jsfornationality();});

}
function initLocation()
{
	var lochash = locationHash();

	var e = document.createElement('select');
	e.setAttribute('id', 'location');
	e.setAttribute('name', 'currentloc');
	//e.setAttribute('style', 'background:url() 0 0 no-repeat; -webkit-appearance: none;');
	//e.setAttribute('multiple', '');
	//e.setAttribute('data-placeholder', '-- select location --');

	var o = document.createElement('option');
	o.setAttribute('value', '');
	e.appendChild(o);
	for (var i in COMBO_DATA.CURLOCATION)					// optiongroup - region/state
	{
		
		var o = document.createElement('option');
                o.setAttribute('value', COMBO_DATA.CURLOCATION[i].id);
                o.innerHTML =  COMBO_DATA.CURLOCATION[i].values;
               // o.setAttribute('id',COMBO_DATA.CURLOCATION[i].id);
				e.appendChild(o);
				
	}

	$('#PLACEHOLDER_combo_location')[0].appendChild(e);
	if(glassdoor == 1)
	{
		$('#location').select2({placeholder: MSG['CUR_LOC'], allowClear: true, width: "300px"});
	}
	else
	{
		$('#location').select2({placeholder: MSG['CUR_LOC'], allowClear: true, width: "502px"});
	}
	$('#s2id_location .select2-chosen').addClass("req");
	$('#location').on('change',function(){jsforcurLocation();});	
}



function getLocations()
{
	var locs = new Object();
	var loc = $('#location')[0];

	for (var i=0; i<loc.options.length; ++i)
	{
		//if( loc[i].selected ) locs[loc[i].textContent] = loc[i].value;
		if( loc.options[i].selected ) locs[loc.options[i].value] = loc.options[i].text;
	}

	return JSON.stringify(locs);
}


function init()
{
	scroll();
	loadData();
}
