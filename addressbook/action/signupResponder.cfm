<cfset variables.flag = 0>
<cfset session.set = 0>
<cfquery name="result" datasource="address_book">
    SELECT * FROM signup where userName = '#url.username#'
</cfquery>
  <cfif result.recordcount NEQ 0>
    <cfset variables.flag = 1>
  </cfif>
<cfif variables.flag EQ 0>
  0
<cfelse>
  1
</cfif>
            