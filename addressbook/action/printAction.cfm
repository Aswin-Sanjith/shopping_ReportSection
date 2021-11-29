<cfset obj = createObject("component", "components/queries")>
<cfset check = obj.listUsers()>
<table id="printtable">
<tr class="tableHeading">
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



