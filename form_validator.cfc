<cfcomponent>
	<cffunction name="validate" access="remote">
		<cfargument name="Form.firstName" type="string" required="true">
		<cfargument name="Form.lastName" type="string" required="true">
		<cfargument name="Form.email" type="string" required="true">
		<cfargument name="Form.password" type="string" required="true">
		<cfargument name="Form.password2" type="string" required="true">
	
		<cfif (Form.email EQ '') OR (Form.firstName EQ '') OR (Form.lastName EQ '') OR (Form.password EQ '')>
			<p>Please, fill all fields.</p>
		<cfelse>
	
		<cfif Form.password EQ Form.password2>
			<cfquery name="emailcheck" datasource="userSource">
				SELECT *
				FROM UserTable
				WHERE email=<cfqueryparam  
							value="#Form.email#"  
							CFSQLType="CF_SQL_VARCHAR">
			</cfquery>
		<cfif emailcheck.RecordCount EQ 0>
			<cfobject component = "test.user_operations" name = "user_operations">
			<cfinvoke component = "#user_operations#" method="insertUser"></cfinvoke>
			
			<cfquery name="emailcheck2" datasource="userSource">
				SELECT *
				FROM UserTable
				WHERE email=<cfqueryparam  
                            value="#Form.email#"  
                            CFSQLType="CF_SQL_VARCHAR">
			</cfquery>
			<cfif emailcheck2.RecordCount NEQ 1>
				Registration Failed
				<p><a href="home.cfm">Home Page</a></p>
			<cfelse>
				You have registered successfully.
				<p><a href="home.cfm">Home Page</a></p>
			</cfif>
		
			<cfelse>
			<p>It appears you have already registered.</p>
			<p><a href="home.cfm">Home Page</a></p>
		</cfif>
		<cfelse>
		<p class="errors"><b>Your passwords do not match. Please 
			<a href="registration.cfm">try again</a>.</p>
	</cfif>
	
	</cfif>
	</cffunction>
</cfcomponent>