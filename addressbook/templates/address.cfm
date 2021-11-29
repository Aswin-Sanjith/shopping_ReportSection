<script src="js/userPage.js"></script>
<!--- <script src="js/form_validation.js"></script> --->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<cfset obj = createObject("component", "action/components/queries")>
<cfset check = obj.listUsers()>
<table class="detailsTable">
  <tr class="tableHeading">
      <th></th>
      <th >NAME</th>
      <th >EMAIL ID</th>
      <th >PHONE</th>
  </tr>
<!---   <cfstoredproc  procedure="addresses"> 
  <cfprocresult name = RS1> 
  </cfstoredproc>
  <cfdump  var="#RS1#">
--->
  <cfoutput query="check">
      <tr>
        <td><img src="uploadimages\#check.photo#" class="personImage tableImg" alt="user Image"></td>
        <td class="nameCol">#encodeForHTML(check.firstname)# #encodeForHTML(check.lastName)#</td>
        <td class="emailCol">#encodeForHTML(check.email)#</td>
        <td class="phoneCol">#encodeForHTML(check.phoneNumber)#</td>
        <td>
          <input type="button" class="changeButton" name="edit" id="#check.address_id#" value="EDIT"  onclick="openForm();editData(this.id);">
        </td>
        <td>
          <input type="button" id="#check.address_id#"  class="changeButton" name="delete" value="DELETE" onclick="addclass(this.id)">
        </td>     
        <td>
          <input type="submit"  class="changeButton" name="view" id="#check.address_id#" value="VIEW" onclick="viewData(this.id);viewfunction();">
        </td>
      </tr>
  </cfoutput>
</table> 
<cfoutput>
  <form action="action/deleteAction.cfm" method="POST">
    <div id="deleteConfirm" name="deleteConfirm" class="hide">
      <h4>Are you sure?</h4>
      <input type="hidden" id="deleteid" name="deleteid">
      <input type="submit" id="confirmDelete" value="confirm" onclick="deletehide()">
      <input type="button" id="cancel" value="cancel" onclick="deletehide()" >
    </div>
  </form>
</cfoutput>





