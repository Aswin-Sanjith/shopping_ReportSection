<cfparam  name="session.signinError" default="#arrayNew(1)#">
<cfparam name="session.formData" default="#structnew()#">
<cfdump  var="#session.formData#">
<cfset structInsert(session.formData, "fullname", "",true)>
<cfset structInsert(session.formData, "emailId", "",true)>
<cfset structInsert(session.formData, "UserName", "",true)>
<cfset variables.fullName = session.formData["fullName"]>
<cfset variables.emailId = session.formData["emailId"]>
<cfset variables.userName = session.formData["userName"]>
<cfset structclear("#session.formData#")>
<!--- <cfset variables.fullname = session.formData["fullName"]> 
<cfset variables.emailId = session.formData["emailId"]>
<cfset variables.userName = session.formData["userName"]>
<cfset session.formData="{ fullName='', emailId='', userName='' }" >--->
<html>
<head>
    <meta http-equiv="Content-Security-Policy" content="font-src 'self'; img-src 'self'; style-src 'self';">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Login.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <!-- <script src="js/signup.js"></script>-->
    <title>Address Book</title>
</head>
  <body>
    <div class="head">
        <div class="left_head">
          <img src="images/logo.png" alt="logo">
          <h3>ADDRESS BOOK</h3>
        </div>
        <div class="right_head">
          <img src="" alt="" id="images2">
          <a href="signup.cfm">Sign Up</a>
          <img src="" alt="">
          <a href="login.cfm">Login</a>
        </div>
    </div>   
    <div class="container">
      <div class="containerBox1">
        <img src="images/logo.png" alt="logo">
      </div>
      <div class="containerBox2">
        <h3>SIGN UP</h3>
        <cfoutput>
          <form action="action/signupAction.cfm" onsubmit="return check()"  method="POST" >
            <input type="text" name="fullName" id="fullName" value="#variables.fullName#"  placeholder="Full Name">
            <p id="nameError" class="message">          
              <cfif arrayFind(session.signinError, "fullNameError")> 
                **please enter Full Name
              </cfif>
            </p>
            <input type="text" name="emailId" id="emailId" value="#variables.emailId#" placeholder="Email Id">
            <p id="emailError" class="message">
              <cfif arrayFind(session.signinError, "emailError")> 
                **please enter email
              </cfif>
            </p>
            <input type="text" name="userName" id="userName" value="#variables.userName#" placeholder="User Name"  onkeyup="checkusername(this.value)">
            <p id="userError" class="message">
              <cfif arrayFind(session.signinError, "userNameError")> 
                **please enter user Name
              </cfif>
            </p>
            <input type="password" name="password" id="password"  placeholder="Password">
            <p id="passError" class="message">
              <cfif arrayFind(session.signinError, "passwordError")> 
                **please enter Password
              </cfif>
            </p>
            <input type="password" name="confirmPassword" id="confirmPassword" placeholder="confirm Password">
            <p id="cpassError" class="message">
              <cfif arrayFind(session.signinError, "cPasswordError")> 
                **please Confirm  password
              </cfif>
              <cfif arrayFind(session.signinError, "passwordNotSame")> 
                **passwords are not same
              </cfif>
            </p>
            <input type="submit" value="REGISTER" id="submit" >
          </form>
        </cfoutput>
      </div>
    </div>
  </body>
</html>
<script>
function checkusername(value)
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
</script>
<cfset arrayClear(session.signinError)>