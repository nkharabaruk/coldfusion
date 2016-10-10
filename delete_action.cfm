<html> 
<head> 
    <title>Delete User</title> 
</head> 
<body> 
 
<cfquery name="DeleteUser" datasource="userSource"> 
    <cfif NOT isDefined(#id#)>
		DELETE FROM UserTable
		WHERE id = #id#
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