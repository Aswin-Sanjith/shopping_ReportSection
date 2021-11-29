<cfcomponent>

    <cfset this.name  = "app">
    <cfset this.datasource = "shopping">
    <cfset this.applicationTimeout  = createTimeSpan( 0, 1, 0, 0 )>
    <cfset this.sessionStorage  = true>
    <cfset this.sessionmanagement = true>
    <cfset this.sessionTimeout  = createTimeSpan( 0, 0, 60, 0 )>

</cfcomponent>
