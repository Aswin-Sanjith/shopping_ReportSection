<cfif session.sessionId NEQ 0 && isNumeric(session.sessionId)>
  <cfset obj = createObject("component", "components/queries")>
  <cfset result = obj.excel()>
  <cfspreadsheet action="write" fileName=#expandPath( 'new-example.xls' )# query="result" overwrite=true >
  <cfheader name="Content-Disposition" value="attachment; filename=Reporting.xls">
  <cfcontent type="application/msword" file="#expandPath( 'new-example.xls' )#" deletefile="yes">
  <cflocation  url="../userPage.cfm">
</cfif>