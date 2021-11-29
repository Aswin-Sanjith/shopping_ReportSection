

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Address Book</title>
    <link rel="icon"  href="icon.ico">
    <link rel="stylesheet" type="text/css" href="css/userPage.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
    <script src="js/userPage.js"></script>
     <script src="js/edit.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  </head>
  <body>
    <div class="head">
        <div class="left_head">
          <img src="images/logo.png" alt="logo">
          <h3>ADDRESS BOOK</h3>
        </div>
        <div class="right_head">
          <img src="images/signup.png" alt="" id="images2">
          <form action="action/logoutAction.cfm">
            <input type="submit" value="Logout">
          </form>
        </div>
    </div>
    
    <div class="Main-Sect">
      <div class="subheader">
          <div class="subheader-right">
              <form action="action/pdfAction.cfm" method="POST">
                <button class="functions" name="pdf" id="pdf"><img src="images/pdf.png" alt="pdf"></img></button>
              </form>
              <form action="action/excelAction.cfm" method="POST">
                <button class="functions" id="excel"><img src="images/excel.png" alt="excel"></button>
              </form>
              <form action="" method="POST">
                <button class="functions" name="print" value="print" id="print"><img src="images/printer.png" alt="print"></button>
              </form>   
          </div>
      </div>
    </div>

    <div class="details" id="details">
      <div class="userBox">
        <button id="continue" onclick="openForm()">CREATE</button>
      </div>
      <cfinclude  template="templates/address.cfm"> 
    </div>
    <cfinclude  template="templates/create.cfm">
    <cfinclude  template="templates/view.cfm">
    
  </body>
</html>  
