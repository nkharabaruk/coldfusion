<cfcomponent>
	
	<cffunction name="insertUser" access="remote">
		<cftry>
			<cfquery name="insert" datasource="userSource">
				INSERT INTO UserTable(firstname, lastname, age, email, password)
				VALUES (<cfqueryparam  
							value="#Form.firstname#"  
                            CFSQLType="CF_SQL_VARCHAR">,
						<cfqueryparam  
							value="#Form.lastname#"  
							CFSQLType="CF_SQL_VARCHAR">,
						<cfqueryparam  
							value="#Form.age#"  
							CFSQLType="CF_SQL_INTEGER">,
						<cfqueryparam  
							value="#Form.email#"  
							CFSQLType="CF_SQL_VARCHAR">,
						<cfqueryparam  
							value="#Form.password#"  
							CFSQLType="CF_SQL_VARCHAR">)
			</cfquery>
			<cfcatch type="Any">
				<cfthrow message="There was a database error">
			</cfcatch>
		</cftry>
		<!---<cflocation url = "insert.cfm?email=#Form.email#">--->
	</cffunction>
	
	<cffunction name="updateUser" access="remote">
		<cftry>
			<cfquery name="update" datasource="userSource"> 
				UPDATE UserTable 
				SET firstName = <cfqueryparam  
						value="#Form.firstname#"  
						CFSQLType="CF_SQL_VARCHAR">,
					lastName = <cfqueryparam  
						value="#Form.lastname#"  
						CFSQLType="CF_SQL_VARCHAR">, 
					age = <cfqueryparam  
						value="#Form.age#"  
						CFSQLType="CF_SQL_INTEGER">,
					email = <cfqueryparam  
						value="#Form.email#"  
						CFSQLType="CF_SQL_VARCHAR">,
					password = <cfqueryparam  
						value="#Form.password#"  
						CFSQLType="CF_SQL_VARCHAR">
				WHERE id = <cfqueryparam  
						value="#Form.id#"  
						CFSQLType="CF_SQL_INTEGER">
			</cfquery>
			<cfcatch type="Any">
				<cfthrow message="There was a database error">
			</cfcatch>
		</cftry>
		<cflocation url = "update_success.cfm?id=#id#">
	</cffunction>
	
	<cffunction name="deleteUser" access="remote">
		<cfargument name="userId" type="numeric" default=0/>
		<cftry>
			<cfquery name="delete" datasource="userSource"> 
				<cfif structKeyExists(url, "id")>
					DELETE FROM UserTable
					WHERE id = <cfqueryparam  
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
		<cflocation url = "delete_success.cfm">
	</cffunction>
	
</cfcomponent>