<cfcomponent>
    <cffunction name="validate" access="remote">

        <cfif Form.password EQ Form.password2>

            <cfinvoke component="#application.user_operations#" method="selectUserByEmail" returnvariable="select"></cfinvoke>

            <cfif select.RecordCount EQ 0>
                <cfinvoke component="#application.user_operations#" method="insertUser"></cfinvoke>

                <cfquery name="emailcheck" datasource="userSource">
                    SELECT *
                    FROM UserTable
                    WHERE email=<cfqueryparam
                                value="#Form.email#"
                                CFSQLType="CF_SQL_VARCHAR">
                    </cfquery>
                    <cfif emailcheck.RecordCount NEQ 1>
                        <cflocation url = "registration_failed.cfm">
                    <cfelse>
                        <cflocation url = "register_success.cfm">
                    </cfif>
                <cfelse>
                    <cflocation url = "already_exist.cfm">
                </cfif>
            <cfelse>
                <cflocation url = "bad_password.cfm">
            </cfif>
    </cffunction>
</cfcomponent>