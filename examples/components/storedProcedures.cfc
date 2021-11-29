<cfcomponent>

    <cffunction  name="monthySalesReport">
        <cfif !structKeyExists(form, "brand")>
          <cfset form.brand = "">
        </cfif>
        <cfif form.enddate EQ "">
            <cfset local.endDate = dateFormat(now(), "yyyy-mm-dd")>
        <cfelse>
            <cfset local.endDate = form.endDate>
        </cfif>
        <cfset local.dateNew = now()>
        <cfset local.currentYear = year(local.dateNew)>
        <cfset local.startDate   = dateTimeFormat(form.startDate,"yyyy-mm-dd HH:nn:ss")>
        <cfset local.monthEnd = daysInMonth(local.startDate)>
        <cfset local.endDate = dateTimeFormat( local.endDate ,"yyyy-mm-dd HH:nn:ss")>
        <cfstoredproc  procedure="MonthlysalesReport" datasource = "shopping">  
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#local.startDate#">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#local.endDate#">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="3">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#form.brand#">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#form.product#">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#form.color#">
              <cfprocresult  name="monthlysalesReport">
        </cfstoredproc>
        <cfreturn monthlysalesReport>
    </cffunction>


     <cffunction  name="monthlyInventoryReport">
        <cfif form.enddate EQ "">
            <cfset local.endDate = dateFormat(now(), "yyyy-mm-dd")>
        <cfelse>
            <cfset local.endDate = form.endDate>
        </cfif>
        <cfset dateNew = now()>
        <cfset currentYear = year(dateNew)>
        <cfset  startDate   = dateTimeFormat(form.startDate,"yyyy-mm-dd HH:nn:ss")>
        <cfset monthEnd = daysInMonth(startDate)>
        <cfset endDate = dateTimeFormat( local.endDate ,"yyyy-mm-dd HH:nn:ss")>
        <cfstoredproc  procedure="monthlyInventoryReport" datasource = "shopping">  
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#startDate#">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#endDate#">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="3">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#form.brand#">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#form.product#">
              <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#form.color#">
              <cfprocresult  name="monthlyInventoryReport">
        </cfstoredproc>
        <cfreturn monthlyInventoryReport>
    </cffunction>

    <cffunction  name="getFilterItems">
         <cfset local.userId = 3 >
        <cfstoredproc  procedure="getUserItems" datasource = "shopping">  
            <cfprocparam  cfsqltype="CF_SQL_VARCHAR" value="#local.userId#">
            <cfprocresult  name="getUserItems">
        </cfstoredproc>
        <cfreturn getUserItems>
    </cffunction>

    <cffunction  name="getAllColors">
         <cfset local.userId = 3>
        <cfstoredproc  procedure="getAllColors" datasource = "shopping">  
            <cfprocresult  name="getAllColors">
        </cfstoredproc>
        <cfreturn getAllColors>
    </cffunction>


</cfcomponent>