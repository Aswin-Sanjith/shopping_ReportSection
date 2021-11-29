<cfcomponent>
    <cfset this.name  = "app">
    <cfset this.datasource = "address_book">
    <cfset this.applicationTimeout  = createTimeSpan( 0, 1, 0, 0 )>
    <cfset this.sessionStorage  = true>
    <cfset this.sessionmanagement = true>
    <cfset this.sessionTimeout  = createTimeSpan( 0, 0, 60, 0 )>
	<cfset this.loginPage = '/addressbook/login.cfm'>
	<cfset this.signIn = '/addressbook/signup.cfm'>
	<cfset this.signInAction = '/addressbook/action/signupAction.cfm'>
	<cfset this.logout = '/addressbook/action/loginoutAction.cfm'>
	<cfset this.login = '/addressbook/action/loginAction.cfm'>
	<cfset this.componentPage = '/addressbook/action/components/queries.cfc'>
<!--- 	 
	<cffunction name="onError" returnType="void" output="true"> 
		<cfargument name="exception" required="true">
		<cfargument name="eventname" type="string" required="true">
		We are so sorry. Something went wrong. We are working on it now.
		<form action="../userPage.cfm" method="post">
			<input type="submit" value="Go Back to the main page" style="curser:pointer">
		</form>
		<cflog file="myapperrorlog" text="#exception.message#">
		<cfmail  from="aswinsanjith98@gmail"  subject="Error Log"  to="aswinsanjith98@gmail.com"  server="smtp.gmail.com">
			<cfoutput>
				An error occurred: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br />
				Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#<br />
			</cfoutput>
		</cfmail>	
	</cffunction>--->
<cffunction  name="onRequestStart">
	<cfargument name="targetPage" type="string"/>  
	<cfif targetPage EQ this.loginPage and structKeyExists(session, "sessionid")>
		<cfset  structClear(session)>
	</cfif>
	
	<cfif not structKeyExists(session,'sessionid')>
		<cfif not ((targetPage eq this.login) or (targetPage eq this.componentPage) or (targetPage eq this.loginPage) or (targetPage eq this.signIn) or (targetPage eq this.signInAction) )>
			<cflocation  url="#this.loginPage#">
		</cfif>
	</cfif>
</cffunction> 

</cfcomponent>
