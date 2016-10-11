<html> 
<head> 
    <title>Delete User</title> 
</head> 
<body> 
 
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
 
<p>Succesfully deleted!<br>
	<a href="home.cfm">Return home</a>
</p>
 
</body> 
</html>