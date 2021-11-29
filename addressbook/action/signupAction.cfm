
  <cfset session.formData = structNew()>
  <cfloop collection="#form#" item="formData">
    <cfif formData is not "fieldNames">
      <cfset session.formData[formData] = "#form[formData]#">
    </cfif>
  </cfloop>
  <cfset obj = createObject("component", "components/queries")>
  <cfset variables.result = obj.select()>
  <cfset variables.insert = obj.insert()>
  <cfif isArray(variables.insert)>
    <cfset session.signinError= arrayNew(1)>
    <cfloop array="#variables.insert#" item="item">
      <cfset arrayAppend(session.signinError,item)>
    </cfloop>
  <cflocation  url="../signup.cfm">
  <cfelseif isNumeric(variables.insert)>
  <cflocation  url="../login.cfm" addtoken="false"> 
  </cfif> 
<cfset obj = createObject("component", "components/queries")>
<cfset user = obj.insert()>
<cfdump  var="var">
<cfdump  var="#session.formData#">