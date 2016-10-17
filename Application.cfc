<cfcomponent>

    <cfset THIS.name="MyColdfusion">

    <cffunction name="onApplicationStart">
        <!---<cfobject component="test.user_operations" name="user_operations">--->
        <cfscript>
            user_operations = createObject("component", "test.user_operations");
        </cfscript>
        <cfset application.user_operations = user_operations>
    </cffunction>

</cfcomponent>