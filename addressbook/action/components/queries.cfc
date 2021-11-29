<cfcomponent>
<cfparam  name="session.uid" default=0>
  <cffunction name="select" access="remote">
    <cftry>
    <cfquery name="check" datasource="address_book">
      select * from signup where userName=<cfqueryparam value='#form.userName#'  CFSQLType="CF_SQL_VARCHAR">;
    </cfquery>
    <cfif check.recordcount EQ 0 >
      <cfset local.result = 0>
    <cfelse>
      <cfset local.result = 1>
    </cfif>
    <cfreturn local.result>
    <cfcatch type="any">
    <cfreturn false>
    </cfcatch>
    </cftry>
  </cffunction>

   <cffunction name="checkuser" access="remote" returntype="string" returnFormat="plain">
    <cftry>
    <cfquery name="check" datasource="address_book">
      select * from signup where userName=<cfqueryparam value='#form.userName#'  CFSQLType="CF_SQL_VARCHAR">;
    </cfquery>
    <cfif check.recordcount EQ 0 >
      <cfset local.result = 0>
    <cfelse>
      <cfset local.result = 1>
    </cfif>
    <cfreturn local.result>
    <cfcatch type="any">
    <cfreturn false>
    </cfcatch>
    </cftry>
  </cffunction>

  <cffunction name="selectById" access="remote"  returnformat="json">
    <cftry>
      <cfquery name="check" datasource="address_book">
        select * from address where address_id=<cfqueryparam value='#arguments.uid#'  CFSQLType="CF_SQL_VARCHAR">;
      </cfquery>
      <cfreturn check>
    <cfcatch type="any">
      <cfreturn false>
    </cfcatch>
    </cftry>
  </cffunction>

  <cffunction  name="deleteUser" access="remote">
    <cftry>
      <cfquery name="insert" datasource="address_book" >
        delete from address where address_id=<cfqueryparam value='#form.deleteid#'  CFSQLType="CF_SQL_VARCHAR">;
      </cfquery>
    <cfcatch type="any">
      <cfreturn false>
    </cfcatch>
    </cftry>
  </cffunction>

  <cffunction  name="insert">
    <cflock  timeout="20" scope="Session" type="exclusive">
      <cfset local.signupError = arrayNew(1)>
    </cflock>   
    <cfif trim(form.fullName) EQ "" >  
      <cfset  arrayAppend(local.signupError, "fullNameError") >
    </cfif>
    <cfif trim(form.emailId) EQ "">
      <cfset  arrayAppend(local.signupError, "emailError") >
    </cfif>
    <cfif trim(form.UserName) EQ "" >
      <cfset  arrayAppend(local.signupError, "userNameError") >
    </cfif>
    <cfif trim(form.password) EQ "" or (form.password.length() LT 5)>
      <cfset  arrayAppend(local.signupError, "passwordError") >
    </cfif>
    <cfif form.password EQ "">
      <cfset  arrayAppend(local.signupError, "cPasswordError") >
    </cfif>
    <cfif form.confirmPassword NEQ form.confirmPassword>
      <cfset  arrayAppend(local.signupError, "passwordNotSame") >
    </cfif>
    <cfif !arrayIsEmpty(local.signupError)>
      <cfreturn local.signupError>
    <cfelse>
        <cfset local.numbers = "123456789">
        <cfset local.length = 6>
        <cfset local.id = "">
        <cfset local.result = "">
        <cfloop from="1" to=#local.length# index="i">
          <cfset local.id = mid(local.numbers, randRange(1, len(local.numbers)),1)>
          <cfset local.result &= local.id>
        </cfloop>
        <cfquery name="insert" datasource="address_book">
          insert into signup (id,fullName, emailId, UserName, password) 
            VALUES 
            (
              <cfqueryparam value='#local.result#' CFSQLType="CF_SQL_VARCHAR">,
              <cfqueryparam value='#form.fullName#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.emailId#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.UserName#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.password#' CFSQLType="CF_SQL_VARCHAR">
            ); 
        </cfquery>
      <cfreturn local.result>
    </cfif>

  </cffunction>

  <cffunction  name="login" datasource="address_book">
    <cftry>
      <cfquery name="check" datasource="address_book">
        select * from signup where userName= <cfqueryparam value='#form.UserName#' CFSQLType="CF_SQL_VARCHAR"> and password= <cfqueryparam value='#form.password#' CFSQLType="CF_SQL_VARCHAR"> ;
      </cfquery>
      <cfreturn check>
    <cfcatch type="any">
      <cfreturn false>
    </cfcatch>
    </cftry>
  </cffunction>

  <cffunction  name="getUser" datasource="address_book">
    <cftry>
      <cfquery name="check" datasource="address_book">
        select * from address where address_id= <cfqueryparam value='#session.uid#' CFSQLType="CF_SQL_VARCHAR">;
      </cfquery>
      <cfreturn check>
    <cfcatch type="any">
      <cfreturn false>
    </cfcatch>
    </cftry>
  </cffunction>

  
  <cffunction  name="listUsers" datasource="address_book">
    <cftry>
      <cfquery name="check" datasource="address_book">
        select * from address where userId= <cfqueryparam value='#session.sessionId#' CFSQLType="CF_SQL_VARCHAR">;
      </cfquery>
      <cfreturn check>
    <cfcatch type="any">
      <cfreturn false>
    </cfcatch>
    </cftry>
  </cffunction>

  <cffunction  name="create" access="remote">
<!---       <cflock  timeout="20" scope="Session" type="exclusive">
      <cfset local.signupError = arrayNew(1)>
    </cflock>   
    <cfif trim(form.firstName) EQ "" >  
      <cfset  arrayAppend(local.signupError, "First Name is Empty") >
    </cfif>
    <cfif trim(form.emailId) EQ "">
      <cfset  arrayAppend(local.signupError, "Email is Empty,") >
    </cfif>
    <cfif trim(form.UserName) EQ "" >
      <cfset  arrayAppend(local.signupError, "User Name is Empty,") >
    </cfif>
    <cfif trim(form.password) EQ "" or (form.password.length() LT 5)>
      <cfset  arrayAppend(local.signupError, "Password is Empty,") >
    </cfif>
    <cfif form.password EQ "">
      <cfset  arrayAppend(local.signupError, "Confirmpassword is Empty,") >
    </cfif>
    <cfif form.password NEQ form.confirmPassword>
      <cfset  arrayAppend(local.signupError, "passwords are not same") >
    </cfif>
    <cfif !arrayIsEmpty(local.signupError)>
      <cfreturn local.signupError>
    <cfelse> --->
      <cfset local.numbers = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789">
      <cfset local.length = 6>
      <cfset local.id = "">
      <cfset local.result = "">
      <cfloop from="1" to=#local.length# index="i">
        <cfset local.id = mid(local.numbers, randRange(1, len(local.numbers)),1)>
        <cfset local.result &= local.id>
      </cfloop> 
        <cfif structKeyExists(form,"photo") and len(trim(form.photo))> 
          <cffile action="upload" filefield="photo" destination="#expandpath("../uploadimages/#local.result#.jpg")#" result="fileUpload" nameconflict="overwrite" accept="image/*" > 
        </cfif>
        <cfquery name="add" datasource="address_book">
          INSERT INTO address (userId, title, firstName, lastName, gender, dob , photo, address, street, pincode, email, phoneNumber) 
            VALUES 
              (
              <cfqueryparam value='#form.userId#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.title#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.firstName#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.lastName#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.gender#' CFSQLType="CF_SQL_VARCHAR">,
              <cfqueryparam value='#form.dob#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#local.result#.jpg' CFSQLType="CF_SQL_VARCHAR">,
              <cfqueryparam value='#form.address#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.street#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.pincode#' CFSQLType="CF_SQL_VARCHAR">,
              <cfqueryparam value='#form.email#' CFSQLType="CF_SQL_VARCHAR">, 
              <cfqueryparam value='#form.phoneNumber#' CFSQLType="CF_SQL_VARCHAR">
              );
      </cfquery>
        <cfreturn "Added">
<!---       </cfif> --->
  </cffunction>

  <cffunction  name="editUser" access="remote">
    <cfset local.numbers = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789">
    <cfset local.length = 6>
    <cfset local.id = "">
    <cfset local.result = "">
    <cfloop from="1" to=#local.length# index="i">
      <cfset local.id = mid(local.numbers, randRange(1, len(local.numbers)),1)>
      <cfset local.result &= local.id>
    </cfloop>

    <cfif structKeyExists(form,"photo") and len(trim(form.photo)) EQ 0 >
      <cfquery name="check" datasource="address_book">
        select * from address where address_id=<cfqueryparam value='#form.addressid#'  CFSQLType="CF_SQL_VARCHAR">;
      </cfquery>
      <cfset local.uploadFile = check.photo>
    <cfelse>
    <cffile action="upload" filefield="photo" destination="#expandpath("../uploadimages/#local.result#.jpg")#" result="fileUpload" nameconflict="overwrite" accept="image/*" >
      <cfset local.uploadFile = local.result> 
    </cfif>
    <cfquery name="add" datasource="address_book">
      update  address set  
        title = <cfqueryparam value='#form.title#' CFSQLType="CF_SQL_VARCHAR">, 
        firstName = <cfqueryparam value='#form.firstName#' CFSQLType="CF_SQL_VARCHAR">, 
        lastName  = <cfqueryparam value='#form.lastName#' CFSQLType="CF_SQL_VARCHAR">, 
        gender = <cfqueryparam value='#form.gender#' CFSQLType="CF_SQL_VARCHAR">,
        dob = <cfqueryparam value='#form.dob#' CFSQLType="CF_SQL_VARCHAR">, 
        photo = <cfqueryparam value='#local.uploadFile#.jpg' CFSQLType="CF_SQL_VARCHAR">, 
        address = <cfqueryparam value='#form.address#' CFSQLType="CF_SQL_VARCHAR">, 
        street = <cfqueryparam value='#form.street#' CFSQLType="CF_SQL_VARCHAR">, 
        pincode =  <cfqueryparam value='#form.pincode#' CFSQLType="CF_SQL_VARCHAR">,
        email =  <cfqueryparam value='#form.email#' CFSQLType="CF_SQL_VARCHAR">, 
        phoneNumber = <cfqueryparam value='#form.phoneNumber#' CFSQLType="CF_SQL_VARCHAR">,
        photoAddress = <cfqueryparam value='#expandpath("../uploadimages/#local.result#.jpg")#' CFSQLType="CF_SQL_VARCHAR">
        where address_id= <cfqueryparam value='#form.addressid#' CFSQLType="CF_SQL_VARCHAR">
    </cfquery>
    <cfreturn "Updated">  
  </cffunction>

  
  <cffunction  name="excel" access="remote">
    <cftry>
      <cfquery name='select_user'  datasource='address_book'> 
        select  title, firstName, lastName, gender, dob, address, street, pincode, email, phoneNumber  FROM address where 
        userId= <cfqueryparam value='#session.sessionId#' CFSQLType="CF_SQL_VARCHAR">
      </cfquery>
      <cfreturn select_user>
    <cfcatch type="any">
      <cfreturn false>
    </cfcatch>
    </cftry>
  </cffunction>

    <cffunction name="checkmail" access="remote" returntype="string" returnFormat="plain">
    <cftry>
    <cfquery name="check" datasource="address_book">
      select * from address where email=<cfqueryparam value='#arguments.email#' CFSQLType="CF_SQL_VARCHAR">
    </cfquery>
    <cfif check.recordcount EQ 0 >
      <cfset local.result = 0>
    <cfelse>
      <cfset local.result = 1>
    </cfif>
    <cfreturn local.result>
    <cfcatch type="any">
    <cfreturn false>
    </cfcatch>
    </cftry>
  </cffunction>

</cfcomponent>