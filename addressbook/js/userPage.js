function openForm() {
    document.getElementById("myForm").style.display = "block";
  }
  function closeForm() {
    document.getElementById("myForm").style.display = "none";
      $("#CreateEditHead").html('Create');
      $("#myform").attr('action', 'action/createAction.cfm');
      $("#Addressid").val("");
      $("#title").val("");
      $("#firstName").val("");
      $("#lastName").val("");
      $("#gender").val("");
      $("#dob").val("");
      $("#address").val("");
      $("#street").val("");
      $("#pincode").val("");
      $("#email").val("");
      $("#phoneNumber").val("");
      $("#createButton").val("CREATE");
  }

  function myFunction() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
    return false;
  }
function editfunction() {
    var popup = document.getElementById("editpopup");
    popup.classList.toggle("show");
    return false;
  }
function viewfunction() {
    var popup = document.getElementById("viewpopup");
    popup.classList.toggle("show");
    return false;
  }
function deletehide() {
    var popup = document.getElementById("deleteConfirm");
    popup.classList.remove("show");
    return false;
  }
function deleteshow() {
    var popup = document.getElementById("deleteConfirm");
    popup.classList.add("show");
    return false;
  }

function viewData(name) {
    $.ajax
    ({
      url: "action/components/queries.cfc?method=selectById&&uid="+ name,  
      success: function(data) {
      $("#demo").html(data)
      data = jQuery.parseJSON(data);
      $(".insertName").html(data.DATA[0][3]);
      $(".insertGender").html(data.DATA[0][2]);
      $(".insertDob").html(data.DATA[0][6]);
      $(".insertAddress").html(data.DATA[0][8]);
      $(".insertPincode").html(data.DATA[0][10]);
      $(".insertEmail").html(data.DATA[0][11]);
      $(".insertPhone").html(data.DATA[0][12]);
  }
   });
}

function editData(id) {
  $.ajax({
    type: "post",
    url:"action/components/queries.cfc?method=selectById&&uid="+ id,
    success: function( data ) {
      console.log(data)
      data = jQuery.parseJSON(data);
      $("#CreateEditHead").html('EDIT');    
      $("#myform").attr('action', 'action/editAction.cfm');
      $("#Addressid").val(data.DATA[0][0]);
      $("#title").val(data.DATA[0][2]);
      $("#firstName").val(data.DATA[0][3]);
      $("#lastName").val(data.DATA[0][4]);
      $("#gender").val(data.DATA[0][5]);
      $("#dob").val(data.DATA[0][6]);
      $("#photo").attr("style", "color:transparent");
      $("#contact_img").attr("src","uploadimages/"+data.DATA[0][7]);
      $("#address").val(data.DATA[0][8]);
      $("#street").val(data.DATA[0][9]);
      $("#pincode").val(data.DATA[0][10]);
      $("#email").val(data.DATA[0][11]);
      $("#phoneNumber").val(data.DATA[0][12]);
      $("#createButton").val("EDIT");
    }
  });
}

function addclass(id) {
   $("#deleteConfirm").addClass("show");
   $("#deleteid").val(id);
   return false;
}



function checkemail()
{
  var email=$("#email").val();
  $.ajax({
    type: "post",
    url:"action/components/queries.cfc?method=checkmail&&email="+ email,
    success: function( data ){
      console.log(data)
      if(data == 1)
      {
        $("#email_error").html("email already exists"); 
      }
      else
      {
        $("#email_error").html(""); 

      }

    }
  });
 

}