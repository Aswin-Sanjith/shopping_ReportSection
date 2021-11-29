<cfset thisDir = expandPath(".")> 
<cfif session.sessionId NEQ 0 && isNumeric(session.sessionId)>
  <cfset obj = createObject("component", "components/queries")>
  <cfset result = obj.editUser()>
  <cflocation  url="../userPage.cfm">
</cfif> 