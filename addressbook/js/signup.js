function check()
{
    var fname=document.getElementById('fullName').value;
    var fullname=fname.split(" ").join("");
    if (fullname.length<3 || /[^a-zA-ZàâäèéêëîïôœùûüÿçÀÂÄÈÉÊËÎÏÔŒÙÛÜŸÇ]/.test(fullname))
    {
        errormsg("Name","nameError");
        document.getElementById("fullName").focus();
        return false;
    }
    else
    {
       success("nameError")
    }

    var mail_format =  /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var emailcheck=document.getElementById("emailId");
    if(!emailcheck.value.match(mail_format))
    {
      errormsg("Email","emailError","emailId");
      document.getElementById("emailId").focus();
      return false;
    }
    else
    {
      success("emailError")  
    } 
    var pw = document.getElementById("password").value;
    if(pw == "")
    {
      document.getElementById("passError").innerHTML = "**Fill the password please!";
      return false;
    }
   
    else if(pw.length < 8)
    {
      document.getElementById("passError").innerHTML = "**Password length must be atleast 8 characters";
      return false;
    }
  
    else if(pw.length > 15)
    {
      document.getElementById("passError").innerHTML = "**Password length must not exceed 15 characters";
      return false;
    } 
    else
    {

      document.getElementById("passError").innerHTML = "";
    }
    var usererror=document.getElementById('userError');
    if(usererror != "")
    {
      document.getElementById("passError").innerHTML = "";
    }

}


function errormsg(input,id)
{
    document.getElementById(id).innerHTML=input+" is Invalid";
}

function success(id)
{
    document.getElementById(id).innerHTML="";
}
{
  $.ajax({
    
    url:"action/components/queries.cfc?method=checkuser&&userName="+ value,
    success: function( data ){
      console.log(data)
      if(data == 1)
      {
        $("#userError").html("Username is not available"); 

      }

    }
  });

}


