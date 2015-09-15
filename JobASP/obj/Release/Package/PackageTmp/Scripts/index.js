function blockNonNumbers(obj, e) {
    var key;
    var isCtrl = false;
    var keychar;
    var reg;
    var val = new String(obj.value);
    if (window.event) {
        key = e.keyCode;
        isCtrl = window.event.ctrlKey
    }
    else {
        key = e.which;
        isCtrl = e.ctrlKey;
    }
    if (isNaN(key)) return true;
    keychar = String.fromCharCode(key);
    // check for backspace or delete, or if Ctrl was pressed
    if (key == 8 || key == 9 || key == 0) {
        return true;
    }
    reg = /\d/;
    if (!reg.test(keychar)) {
        e.keyCode = -1;
    }
    return reg.test(keychar);
}

function lettersOnly(evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
      ((evt.which) ? evt.which : 0));
    if (charCode > 31 && (charCode < 65 || charCode > 90) &&
      (charCode < 97 || charCode > 122)) {
        return false;
    }
    else
        return true;
}

function lettersWithCommaOnly(evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
      ((evt.which) ? evt.which : 0));
    if (charCode == 44)
        return true;
    if (charCode > 31 && (charCode < 65 || charCode > 90) &&
      (charCode < 97 || charCode > 122)) {
        return false;
    }
    else
        return true;
}

function Page_ValidationSummariesReset() {
    if (typeof (Page_Validators) != "undefined") {
        for (var i = 0; i < Page_Validators.length; i++) {
            var validator = Page_Validators[i];
            validator.isvalid = true;
            ValidatorUpdateDisplay(validator);
        }
    }
    if (typeof (Page_ValidationSummaries) == "undefined")
        return;
    for (var i = 0; i < Page_ValidationSummaries.length; i++)
        Page_ValidationSummaries[i].style.display = "none";

}