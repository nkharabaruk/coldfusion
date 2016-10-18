<cfcomponent>

    <cffunction name="log_in" access="remote">
        <cfset var pass = This.selectUserByEmail().password>
        <cfif pass EQ Hash(Form.password,'SHA')>
            <cflocation url="home.cfm">
            <cfelse>
                <cflocation url="invalid_password.cfm">
        </cfif>
    </cffunction>

    <cffunction name="send_email" access="remote">
        <cfset var pass = This.selectUserByEmail().password>
        <cftry>
            <cfmail server="smtp.gmail.com"
                    useSSL="true"
                    username="nkharabaruk"
                    password="Yfnecz123"
                    port="465"
                    from="nkharabaruk@gmail.com"
                    to="#Form.email#"
                    subject="Remind password">
                Your password: #pass#
            </cfmail>
            <cfcatch>
                <cfthrow message="Cannot send password to email">
            </cfcatch>
        </cftry>
    </cffunction>

    <cffunction name="selectUserByEmail" access="remote">
        <cftry>
            <cfquery name="select" datasource="userSource">
                SELECT *
                FROM UserTable
                WHERE email=<cfqueryparam
                                value="#Form.email#"
                                CFSQLType="CF_SQL_VARCHAR">
            </cfquery>
            <cfcatch type="Any">
                <cfthrow message="There was a database error">
            </cfcatch>
        </cftry>
        <cfreturn select>
    </cffunction>

    <cffunction name="selectUserById" access="remote">
        <cftry>
            <cfquery name="select" datasource="userSource">
                SELECT *
                FROM UserTable
                WHERE id = <cfqueryparam
                                value="#url.id#"
                                CFSQLType="CF_SQL_INTEGER">
            </cfquery>
            <cfcatch type="Any">
                <cfthrow message="There was a database error">
            </cfcatch>
        </cftry>
        <cfreturn select>
    </cffunction>

    <cffunction name="selectAllUsers" access="remote">
        <cftry>
            <cfquery name="select" datasource="userSource">
                SELECT *
                FROM UserTable
            </cfquery>
            <cfcatch type="Any">
                <cfthrow message="There was a database error">
            </cfcatch>
        </cftry>
        <cfreturn select>
    </cffunction>

    <cffunction name="insertUser" access="remote">
        <cfset var hashedPassword = Hash(Form.password,'SHA')>
        <cftry>
            <cfquery name="insert" datasource="userSource">
				INSERT INTO UserTable(firstname, lastname, age, email, password)
				VALUES (<cfqueryparam value="#Form.firstname#"
                            CFSQLType="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#Form.lastname#"
                            CFSQLType="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#Form.age#"
                            CFSQLType="CF_SQL_INTEGER">,
                        <cfqueryparam value="#Form.email#"
                            CFSQLType="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#hashedPassword#"
                            CFSQLType="CF_SQL_VARCHAR">)
			</cfquery>
            <cfcatch type="Any">
                <cfthrow message="There was a database error">
            </cfcatch>
        </cftry>
    </cffunction>

    <cffunction name="updateUser" access="remote">
        <cftry>
            <cfquery name="update" datasource="userSource">
				UPDATE UserTable 
				SET firstName = <cfqueryparam value="#Form.firstname#"
                        CFSQLType="CF_SQL_VARCHAR">,
					lastName = <cfqueryparam value="#Form.lastname#"
                        CFSQLType="CF_SQL_VARCHAR">,
					age = <cfqueryparam value="#Form.age#"
                        CFSQLType="CF_SQL_INTEGER">,
					email = <cfqueryparam value="#Form.email#"
                        CFSQLType="CF_SQL_VARCHAR">,
					password = <cfqueryparam value="#Form.password#"
                        CFSQLType="CF_SQL_VARCHAR">
				WHERE id = <cfqueryparam value="#Form.id#"
                        CFSQLType="CF_SQL_INTEGER">
            </cfquery>
            <cfcatch type="Any">
                <cfthrow message="There was a database error">
            </cfcatch>
        </cftry>
        <cflocation url="update_success.cfm?id=#id#">
    </cffunction>

    <cffunction name="deleteUser" access="remote">
        <cftry>
            <cfquery name="delete" datasource="userSource">
                <cfif structKeyExists(url, "id")>
                    DELETE FROM UserTable
                    WHERE id =  <cfqueryparam
                            value="#url.id#"
                            CFSQLType="CF_SQL_INTEGER">
                <cfelse>
                    DELETE
                    FROM UserTable
                </cfif>
            </cfquery>
            <cfcatch type="Any">
                <cfthrow message="There was a database error">
            </cfcatch>
        </cftry>
        <cflocation url="delete_success.cfm">
    </cffunction>

</cfcomponent>