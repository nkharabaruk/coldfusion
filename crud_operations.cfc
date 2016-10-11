<cfcomponent>
	
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
		<cfoutput>
			<h1>User Updated</h1> 
			You have updated the information for <span style="color:red">
			#Form.firstName# #Form.lastName#</span> in the user database. 
			<p><a href="update.cfm?id=#id#">Return to update page</a></p>
			<p><a href="home.cfm">Return home</a></p>
		</cfoutput>
		<!---
		<cfset url.id = "#Form.id#">
		<cfinclude template="update_success.cfm">
		--->
	</cffunction>
	
	<cffunction name="deleteUser" access="remote">
		<cftry>
			<cfquery name="DeleteUser" datasource="userSource"> 
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
		<cfoutput>
			<p>Succesfully deleted!<br>
			<a href="home.cfm">Return home</a>
			</p>
		</cfoutput>
	</cffunction>
	
</cfcomponent>