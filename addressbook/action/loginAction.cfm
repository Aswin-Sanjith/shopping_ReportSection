<cftry> 
  <cfset obj = createObject("component", "components/queries")>
  <cfset user = obj.login()>
  <cfif user.recordcount NEQ 0 >
    <cflock  timeout="20" scope="Session" type="exclusive">
      <cfset session.isLoggedIn=true>
      <cfset session.sessionid = user.id>
    </cflock>    
      <cflocation  url="../userPage.cfm" addtoken="false">
    <cfelse>
      <cflocation  url="../login.cfm" addtoken="false">
  </cfif>
<cfcatch type="any">
  <cflocation  url="../login.cfm" addtoken="false">
</cfcatch>
</cftry>

