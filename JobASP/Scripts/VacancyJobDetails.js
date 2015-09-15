
//var DDLData = {
//    //'1': 'JavaScript', '2': '.Net', '3': 'Java',
//    //'4': 'SQL'
//};
$(function () {

    $.ajax({
        type: "POST",
        url: "ProfileEmployer.aspx/getSkillSet",
        contentType: "application/json; charset=utf-8",
        success: SuccessTestService,
        dataType: "json",
        failure: ajaxCallFailed
    });



    function SuccessTestService(responce) {
        //DDLData = responce.d;

        $("#grid").jqGrid({
            url: 'http://localhost:65503/Account/JQGridHandler.ashx?id=1',
            mtype: "GET",
            datatype: "json",

            colNames: ['Id', 'Job Position', 'Company Name', 'Last Date', 'Skill', 'City', 'Qualification', "Experience", "Salary", "Venue", "Show Details"],
            colModel: [
                        { name: 'JobID', index: 'JobID', width: 20, stype: 'text' },
                        { name: 'JobPosition', index: 'JobPosition', width: 100, stype: 'text', editrules: { required: true }, formoptions: { elmsuffix: '<span class="required">*</span>' }, sortable: true, editable: true },
                        { name: 'CompanyName', index: 'CompanyName', editrules: { required: true }, formoptions: { elmsuffix: '<span class="required">*</span>' }, width: 100, editable: true },
                        {
                            name: 'LastDate', index: 'LastDate', width: 60, editoptions: {
                                size: 17, dataInit: function (el) {
                                    setTimeout(function () {
                                        $(el).datepicker({
                                            minDate: '+4d',
                                            maxDate: '+1m +4d',
                                            controlType: 'select',
                                            stepMinute: 30,
                                            stepHour: 1,
                                            hourMin: 10,
                                            hourMax: 18,
                                            timeFormat: 'hh:mm TT', dateFormat: 'mm-dd-yy '
                                        });
                                    }, 50);
                                }
                            }, editrules: { required: true }, formoptions: { elmsuffix: '<span class="required">*</span>' }, formatter: "date", formatoptions: { newformat: "m/d/Y" }, editable: true
                        },
                        { name: 'Skill', index: 'Skill', edittype: "select", editoptions: { value: responce.d }, width: 80, align: "right", editrules: { required: true }, formatter: "select", formatoptions: { value: responce.d }, formoptions: { elmsuffix: '<span class="required">*</span>' }, editable: true },
                        { name: 'City', index: 'City', width: 70, align: "right", editrules: { required: true }, formoptions: { elmsuffix: '<span class="required">*</span>' }, editable: true, edittype: "select", editoptions: { value: getCities() }, formatter: "select", formatoptions: { value: getCities() } },
                        { name: 'Qualification', index: 'Qualification', width: 90, align: "center", editrules: { required: true }, formoptions: { elmsuffix: '<span class="required">*</span>' }, editable: true },
                        { name: 'Experience', index: 'Experience', width: 50, sortable: false, editable: true, edittype: "select", formatter: "select", formatoptions: { value: getExp() }, editoptions: { value: getExp() } },
                        { name: 'Salary', index: 'Salary', width: 50, formatter: "select", formatoptions: { value: getSal() }, editable: true, edittype: "select", editoptions: { value: getSal() } },
                        { name: 'act', index: 'act', width: 70, sortable: false, align: "center", classes: "grid-col", formatter: addLink },
                        { name: 'Details', index: 'Details', width: 70, sortable: false, align: "center", classes: "grid-col" },
            ],
            viewrecords: true,
            pager: jQuery("#pager"),
            rowNum: 10,
            rowList: [10, 20, 30, 40],
            height: '100%',
            caption: "Posted Jobs",
            gridComplete: function(){ 
                var ids = jQuery("#grid").getDataIDs();
                for(var i=0;i<ids.length;i++){ 
                    var cl = ids[i];
                    
                    be = "<input class='btn btn-xs btn-primary' type='button' value='Add Venue' data-value='" + cl + "' data-toggle='modal' data-target='#AddVenueDiv' />";
                    se = "<input class='open-Details btn btn-xs btn-primary' name='btnDetails' data-id='" + cl + "' type='button' value='Details' />";
                    //jQuery("#grid").setRowData(ids[i], { act: be })
                    jQuery("#grid").setRowData(ids[i], { Details: se })
                } 
            },
            emptyrecords: "No records to display",
            jsonReader: {
                root: "rows",
                page: "page",
                total: "total",
                records: "records",
                repeatitems: false,
                id: "0"
            },
            autowidth: true,
            multiselect: false,
            editurl: 'http://localhost:65503/Account/JQGridHandler.ashx?id=1'
        });
        $('#grid').jqGrid('navGrid', '#pager',
                  {
                      edit: true,
                      add: false,
                      del: true,
                      search: false,
                      searchtext: "Search",
                      edittext: "Edit",
                      deltext: "Delete"
                  },
                  {   //EDIT
                      //                       height: 300,
                      //                       width: 400,
                      //                       top: 50,
                      //                       left: 100,
                      //                       dataheight: 280,
                      closeOnEscape: true,//Closes the popup on pressing escape key
                      closeAfterEdit: true,
                      recreateForm: true,
                      reloadAfterSubmit: false,
                      drag: true,
                      afterSubmit: function (response, postdata) {
                          if (response.responseText == "") {

                              $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid');//Reloads the grid after edit
                              return [true, '']
                          }
                          else {
                              $("#sData").hide();
                              $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid'); //Reloads the grid after edit
                              return [false, response.responseText]//Captures and displays the response text on th Edit window
                          }
                      },
                      editData: {
                          JobId: function () {
                              var sel_id = $('#grid').jqGrid('getGridParam', 'selrow');
                              var value = $('#grid').jqGrid('getCell', sel_id, 'JobID');
                              return value;
                          },
                          ddlExp: function () {
                              var sel_id = $('#grid').jqGrid('getGridParam', 'selrow');
                              var value = $('#grid').jqGrid('getCell', sel_id, 'Experience');
                              //var stringVal = $('#Experience').val();
                              return value;
                          }

                      }
                  },
                  {
                      closeAfterAdd: true,//Closes the add window after add                      
                      afterSubmit: function (response, postdata) {
                          if (response.responseText == "") {

                              $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add
                              return [true, '']
                          }
                          else {
                              $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add
                              return [false, response.responseText]
                          }
                      }
                  },
                  {   //DELETE
                      closeOnEscape: true,
                      closeAfterDelete: true,
                      reloadAfterSubmit: true,
                      closeOnEscape: true,
                      drag: true,
                      afterSubmit: function (response, postdata) {
                          if (response.responseText == "") {

                              $("#grid").trigger("reloadGrid", [{ current: true }]);
                              return [false, response.responseText]
                          }
                          else {
                              $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                              return [false, response.responseText]
                          }
                      },
                      delData: {
                          JobId: function () {
                              var sel_id = $('#grid').jqGrid('getGridParam', 'selrow');
                              var value = $('#grid').jqGrid('getCell', sel_id, 'JobID');
                              return value;
                          }
                      }
                  },
                  {//SEARCH
                      closeOnEscape: true

                  }
           );

    }
    $(document).on("click", ".open-Details", function () {
        var jobId = $(this).data('id');
        window.open('JobDetails.aspx?JobID='+jobId, 'popup_window', 'width=800,height=500,left=100,top=100,resizable=yes,toolbar=yes');
    });
    function addLink(cellvalue, options, rowObject) {
        //to get row Id
        // to get product Id
       if(rowObject.VenueAddress==="")
           return "<input class='btn btn-xs btn-primary' type='button' value='Add Venue' data-id='" + options.rowId + "' data-toggle='modal' data-target='#AddVenueDiv' onclick='setId(" + options.rowId + ")'/>";
       return "Added";
    }
    function ajaxCallFailed(error) {
        alert('error: ' + error);
    }
    function setId(obj) {

        //'<%Session["UserName"] = "' + objs + '"; %>';
        alert('<%=Session["UserName"] %>');
    }
    function getExp() {
        var Exp = {
            '1': 'Fresher',
            '2': '1 Year',
            '3': '2 Years',
            '4': '3 Years',
            '5': '4 Years',
            '6': '5 Years',
            '7': '6 Years',
            '8': '7 Years',
            '9': '8 Years',
            '10': '9 Years',
            '11': '10 Years',
            '12': '>10 Years'
        };
        return Exp;
    }
    function getSal() {
        var Sal = {
            '1': '<1 Lac',
            '2': '2',
            '3': '3',
            '4': '4',
            '5': '5',
            '6': '6',
            '7': '7',
            '8': '8',
            '9': '9',
            '10': '10',
            '11': '>10'
        };
        return Sal;
    }
    function getCities() {
        var Cities = {
            '1': 'Vijayawada',
            '2': 'Visakhapatnam',
            '3': 'Tirupathi',
            '4': 'Hyderabad',
            '5': 'Chennai',
            '6': 'Bangulur'
        };
        return Cities;
    }


    $("#gridCompany").jqGrid({
        url: 'http://localhost:65503/Account/JQGridHandler.ashx',
        mtype: "GET",
        datatype: "json",

        colNames: ['CompanyID', 'Company Name', 'Domain', 'Address', 'Branches', 'UrlLink', "EmailID", "PhoneNo", "No. of Employees"],
        colModel: [
                    { name: 'CompanyID', index: 'CompanyID', width: 20, stype: 'text' },
                    { name: 'CompanyName', index: 'CompanyName', editrules: { required: true }, formoptions: { elmsuffix: '<span class="required">*</span>' }, width: 100, editable: true },
                    { name: 'Domain', index: 'Domain', width: 100, stype: 'text', editrules: { required: false }, sortable: true, editable: true },
                    { name: 'Address', index: 'Address', width: 60, stype: 'textarea', editrules: { required: true }, editoptions: { rows: "2", cols: "10" }, formoptions: { elmsuffix: '<span class="required">*</span>' }, editable: true },
                    { name: 'Branches', index: 'Branches', stype: 'text', width: 80, align: "right", editable: true },
                    { name: 'UrlLink', index: 'UrlLink', editrules: { url: true }, width: 90, align: "right", editable: true },
                    { name: 'EmailID', index: 'EmailID', width: 100, align: "center", editrules: { email: true, required: true }, formoptions: { elmsuffix: '<span class="required">*</span>' }, editable: true },
                    { name: 'PhNum', index: 'PhNum', width: 100, sortable: false, editable: true, editrules: { required: true, number: true }, },
                    { name: 'NoofEmp', index: 'NoofEmp', width: 50, editable: true, stype: 'text', editrules: { number: true }, editoptions: { maxlength: 10, } }

        ],
        viewrecords: true,
        pager: jQuery("#pagerCompany"),
        rowNum: 10,
        rowList: [10, 20, 30, 40],
        height: '100%',
        caption: "Posted Jobs",
        emptyrecords: "No records to display",
        jsonReader: {
            root: "rows",
            page: "page",
            total: "total",
            records: "records",
            repeatitems: false,
            id: "0"
        },
        autowidth: true,
        multiselect: false,
        editurl: 'http://localhost:65503/Account/JQGridHandler.ashx'
    });
    $('#gridCompany').jqGrid('navGrid', '#pagerCompany',
              {
                  edit: true,
                  add: false,
                  del: false,
                  search: false,
                  searchtext: "Search",
                  edittext: "Edit",
                  deltext: "Delete"
              },
              {   //EDIT
                  //                       height: 300,
                  //                       width: 400,
                  //                       top: 50,
                  //                       left: 100,
                  //                       dataheight: 280,
                  closeOnEscape: true,//Closes the popup on pressing escape key
                  closeAfterEdit: true,
                  recreateForm: true,
                  reloadAfterSubmit: false,
                  drag: true,
                  afterSubmit: function (response, postdata) {
                      if (response.responseText == "") {

                          $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid');//Reloads the grid after edit
                          return [true, '']
                      }
                      else {
                          $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid'); //Reloads the grid after edit

                          return [false, response.responseText]//Captures and displays the response text on th Edit window
                      }
                  },
                  editData: {
                      CompanyId: function () {
                          var sel_id = $('#gridCompany').jqGrid('getGridParam', 'selrow');
                          var value = $('#gridCompany').jqGrid('getCell', sel_id, 'CompanyID');
                          return value;
                      }
                  }
              },
              {
                  closeAfterAdd: true,//Closes the add window after add                      
                  afterSubmit: function (response, postdata) {
                      debugger;
                      if (response.responseText == "") {

                          $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add
                          return [true, '']
                      }
                      else {

                          $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add

                          return [true, response.responseText]

                      }
                  }
              },
              {   //DELETE
                  closeOnEscape: true,
                  closeAfterDelete: true,
                  reloadAfterSubmit: true,
                  closeOnEscape: true,
                  drag: true,
                  afterSubmit: function (response, postdata) {
                      if (response.responseText == "") {

                          $("#gridCompany").trigger("reloadGrid", [{ current: true }]);
                          return [false, response.responseText]
                      }
                      else {
                          $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                          return [true, response.responseText]
                      }
                  },
                  delData: {
                      CompanyID: function () {
                          var sel_id = $('#gridCompany').jqGrid('getGridParam', 'selrow');
                          var value = $('#gridCompany').jqGrid('getCell', sel_id, 'CompanyID');
                          return value;
                      }
                  }
              },
              {//SEARCH
                  closeOnEscape: true

              }
       );

});