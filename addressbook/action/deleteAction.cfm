<cfset obj = createObject("component", "components/queries")>
<cfset user = obj.deleteUser()>
<cflocation  url="../userPage.cfm"> 