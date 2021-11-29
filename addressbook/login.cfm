
<html lang="en">
  <head>
    <meta charset="UTF-8">
<!---       <meta name="google-signin-client_id" content="744209301424-b26mp15osteqra5uedeb96antsaug86p.apps.googleusercontent.com"> --->
<!---       <script src="https://apis.google.com/js/platform.js" async defer></script> --->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Login.css">
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
        <h3>LOGIN</h3>
        <form action="action/loginAction.cfm" method="POST" autocomplete="off">
          <input type="text" name="username" id="username" placeholder="Username">
          <input type="password" name="password" id="password" placeholder="Password">
          <p id="usererror"></p>
          <input type="submit" value="LOGIN" id="submit">
        </form>
        <p id="sign_in">Or sign in using</p>
        <div class="logins">
          <img src="images/facebook_logo.png" alt="">
          <img src="images/google_logo.png" alt="">
<!---             <div class="g-signin2" data-onsuccess="onSignIn"></div> --->
        </div>
        <div class="flex">
          <p>Already have an account? </p>
          <a href="signup.cfm">Register here</a>
          <div ></div>
        </div>
      </div>
    </div>
  </body>
</html> 


  <!---  
  <script>
{
  var username=$("#username").val();
  var password=$("#password").val();
  console.log("password")
  $.ajax({
    type: "post",
    url:"action/components/queries.cfc?method=login&&username="+ username+"&&password=" +password,
    success: function( data ){
        $("#usererror").html(data); 
        return false;
    }
  });
 


 

}
  </script>

  <script>
  function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    console.log('Name: ' + profile.getName());
    console.log('Image URL: ' + profile.getImageUrl());
    console.log('Email: ' + profile.getEmail());
  }
  </script>--->
