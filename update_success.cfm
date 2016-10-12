<html> 
	<head> 
		<title>All Users</title> 
	</head> 
	<body>
		<h1>User Updated</h1> 
		
		<cfquery name="updatedUser" datasource="userSource"> 
			SELECT firstName, lastName
			FROM UserTable 
			WHERE id = #url.id#
		</cfquery>

		<cfoutput>
			You have updated the information for 
			<span style="color:red">#updatedUser.firstName# #updatedUser.lastName#</span>. 
			<p><a href="update.cfm?id=#id#">Return to update page</a></p>
			<p><a href="home.cfm">Return home</a></p>
		</cfoutput>
	</body> 
</html>