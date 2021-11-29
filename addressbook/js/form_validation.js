function errormsg(id)
{
    document.getElementById(id).style.border="1px solid red"; 
    document.getElementById(id).focus(); 
    return 1;
}
function successmsg(id)
{
    document.getElementById(id).style.border="none"; 
    return 0;
}
function create_validate() {
    if((title_val() && fname_val() && lname_val() && gender_val() && dob_val() && address_val() && street_val() && pin_val() && mail_val() && phone_val()) == true)
    {
        return true;
    }
    else
    {
        return false;
    }
}

function title_val() {
    let tt = document.getElementById("title").value;
    if (tt.trim().length == 0) {
        tflag = errormsg("title"); 
        return false;
    }
    else {
        tflag = successmsg("title"); 
        return true;
    }
}
function fname_val() {
    let fn = document.getElementById("firstName").value;
    var text=/^[A-Za-z]+$/;
    if (fn.trim().length == 0) {
        fflag = errormsg("firstName"); 
        return false;
    }
    else if (!/[^a-zA-ZàâäèéêëîïôœùûüÿçÀÂÄÈÉÊËÎÏÔŒÙÛÜŸÇ]/.test(fn)) {
        tflag = successmsg("firstName"); 
        return true;
    }
    else if(fn.match(text)) {
        tflag = successmsg("firstName"); 
        return true;
    }
    else{
        fflag = errormsg("firstName"); 
        return false;
    }
}
function lname_val() {
    let ln = document.getElementById("lastName").value;
    var text=/^[A-Za-z ]+$/;
    if (ln.trim().length == 0) {
        lflag = errormsg("lastName"); 
        return false;
    }
    else if (!/[^a-zA-ZàâäèéêëîïôœùûüÿçÀÂÄÈÉÊËÎÏÔŒÙÛÜŸÇ]/.test(ln)) {
        lflag = successmsg("lastName"); 
        return true;
    }
    else if(ln.match(text)) {
        lflag = successmsg("lastName");
        return true;
    }
    else{
        lflag = errormsg("lastName"); 
        return false;
    }
}
function gender_val() {
    let gender = document.getElementById("gender").value;
    if (gender.trim().length == 0) {
        gflag = errormsg("gender"); 
        return false;
    }
    else {
        gflag = successmsg("gender"); 
        return true;
    }
}
function dob_val() {
    let db = document.getElementById("dob").value;
    var inpDate = new Date(db);
    var currDate = new Date();
    if(db.trim().length == 0) {
        dbflag = errormsg("dob"); 
        return false;
    }
    else if (inpDate.setHours(0, 0, 0, 0) > currDate.setHours(0, 0, 0, 0)) {
        dbflag = errormsg("dob"); 
        return false;
    }
    else {
        dbflag = successmsg("dob"); 
        return true;
    }
}
function address_val() {
    let add = document.getElementById("address").value;
    if (add.trim().length == 0) {
        addflag = errormsg("address"); 
        return false;
    }
    else {
        addflag = successmsg("address"); 
        return true;
    }
}
function street_val() {
    let strt = document.getElementById("street").value;
    if (strt.trim().length == 0) {
        strtflag = errormsg("street"); 
        return false;
    }
    else {
        strtflag = successmsg("street"); 
        return true;
    }
}
function pin_val() {
    let pc = document.getElementById("pincode").value;
    if(pc.trim().length == 0) {
        pinflag = errormsg("pincode"); 
        return false;
    }
    else if (pc.length < 6) {
        pinflag = errormsg("pincode"); 
        return false;
    }
    else if (pc.length > 6) {
        pinflag = errormsg("pincode"); 
        return false;
    }
    else
    {
        pinflag = successmsg("pincode"); 
        return true;
    }
}
function mail_val() {
    let ml = document.getElementById("email").value;
    var format = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (ml.trim().length == 0) {
        mailflag = errormsg("email"); 
        return false;
    }
    else if(ml.match(format)) {
        mailflag = successmsg("email"); 
        return true;
    }
    else {
        mailflag = errormsg("email"); 
        return false;
    }
}
function phone_val() {
    let mb = document.getElementById("phoneNumber").value;
    var regExp = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/;
    if(mb.trim().length == 0) {
        phoneflag = errormsg("phoneNumber");
        return false;
    }
    else if (mb.match(regExp)) {
        phoneflag = successmsg("phoneNumber"); 
        return true;
    }
    else {
        phoneflag = errormsg("phoneNumber"); 
        return false;
    }
}
function title_edit_val() {
    let tt = document.getElementById("edittitle").value;
    if (tt.trim().length == 0) {
        tflag = errormsg("edittitle"); 
        return false;
    }
    else {
        tflag = successmsg("edittitle"); 
        return true;
    }
}
function fname_edit_val() {
    let fn = document.getElementById("editfname").value;
    var text=/^[A-Za-z]+$/;
    if (fn.trim().length == 0) {
        fflag = errormsg("editfname"); 
        return false;
    }
    else if (!/[^a-zA-ZàâäèéêëîïôœùûüÿçÀÂÄÈÉÊËÎÏÔŒÙÛÜŸÇ]/.test(fn)) {
        tflag = successmsg("editfname"); 
        return true;
    }
    else if(fn.match(text)) {
        tflag = successmsg("editfname"); 
        return true;
    }
    else{
        fflag = errormsg("editfname"); 
        return false;
    }
}
function lname_edit_val() {
    let ln = document.getElementById("editlname").value;
    var text=/^[A-Za-z]+$/;
    if (ln.trim().length == 0) {
        fflag = errormsg("editlname"); 
        return false;
    }
    else if (!/[^a-zA-ZàâäèéêëîïôœùûüÿçÀÂÄÈÉÊËÎÏÔŒÙÛÜŸÇ]/.test(fn)) {
        tflag = successmsg("editlname"); 
        return true;
    }
    else if(ln.match(text)) {
        tflag = successmsg("editlname"); 
        return true;
    }
    else{
        fflag = errormsg("editlname"); 
        return false;
    }
}
function edit_gender_val() {
    let gender = document.getElementById("editGender").value;
    if (gender.trim().length == 0) {
        gflag = errormsg("editGender"); 
        return false;
    }
    else {
        gflag = successmsg("editGender"); 
        return true;
    }
}
function edit_dob_val() {
    let db = document.getElementById("editDob").value;
    var inpDate = new Date(db);
    var currDate = new Date();
    if(db.trim().length == 0) {
        dbflag = errormsg("editDob"); 
        return false;
    }
    else if (inpDate.setHours(0, 0, 0, 0) > currDate.setHours(0, 0, 0, 0)) {
        dbflag = errormsg("editDob"); 
        return false;
    }
    else {
        dbflag = successmsg("editDob"); 
        return true;
    }
}

function edit_address_val() {
    let add = document.getElementById("editAddress").value;
    if (add.trim().length == 0) {
        addflag = errormsg("editAddress"); 
        return false;
    }
    else {
        addflag = successmsg("editAddress"); 
        return true;
    }
}
function edit_street_val() {
    let strt = document.getElementById("editstreet").value;
    if (strt.trim().length == 0) {
        strtflag = errormsg("editstreet"); 
        return false;
    }
    else {
        strtflag = successmsg("editstreet"); 
        return true;
    }
}
function edit_pin_val() {
    let pc = document.getElementById("editPincode").value;
    if(pc.trim().length == 0) {
        pinflag = errormsg("editPincode"); 
        return false;
    }
    else if (pc.length < 6) {
        pinflag = errormsg("editPincode"); 
        return false;
    }
    else if (pc.length > 6) {
        pinflag = errormsg("editPincode"); 
        return false;
    }
    else
    {
        pinflag = successmsg("editPincode"); 
        return true;
    }
}
function edit_mail_val() {
    let ml = document.getElementById("editEmail").value;
    var format = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (ml.trim().length == 0) {
        mailflag = errormsg("editEmail"); 
        return false;
    }
    else if(ml.match(format)) {
        mailflag = successmsg("editEmail"); 
        return true;
    }
    else {
        mailflag = errormsg("editEmail"); 
        return false;
    }
}
function edit_phone_val() {
    let ml = document.getElementById("editEmail").value;
    var format = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (ml.trim().length == 0) {
        mailflag = errormsg("editEmail"); 
        return false;
    }
    else if(ml.match(format)) {
        mailflag = successmsg("editEmail"); 
        return true;
    }
    else {
        mailflag = errormsg("editEmail"); 
        return false;
    }  
    
}
function edit_validate() {
    if((title_edit_val() && fname_edit_val() && lname_edit_val() && edit_gender_val() && edit_dob_val() && edit_address_val() && edit_street_val() && edit_pin_val() && edit_mail_val() && edit_phone_val()) == true)
    {
        return true;
    }
    else
    {
        return false;
    }
}