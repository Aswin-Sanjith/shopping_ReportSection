<cfdocument format="PDF" filename="tablePDF.pdf" overwrite="Yes">
  <cfset obj = createObject("component", "components/queries")>
  <cfset check = obj.listUsers()>
  <table class="detailsTable" id="table2" border=1>
    <tr class="tableHeading" id="table2haed">
        <th >Name</th>
        <th >Gender</th>
        <th >DOB</th>
        <th >Address</th>
        <th >Street</th>
        <th >Pincode</th>
        <th >Email Id</th>
        <th >Phone No:</th>
    </tr>
    
    <cfoutput query="check">
        <tr>
          <td class="nameCol">#check.firstname#</td>
          <td class="phoneCol">#check.gender#</td>
          <td class="phoneCol">#check.dob#</td>
          <td class="phoneCol">#check.address#</td>
          <td class="phoneCol">#check.street#</td>
          <td class="phoneCol">#check.pincode#</td>
          <td class="emailCol">#check.email#</td>
          <td class="phoneCol">#check.phoneNumber#</td>
        </tr>
    </cfoutput>
  </table> 
</cfdocument>
<cfheader name="Content-Disposition" value="attachment;filename=tablePDF.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\tablePDF.pdf" deletefile="Yes">
<cflocation  url="../userPage.cfm">