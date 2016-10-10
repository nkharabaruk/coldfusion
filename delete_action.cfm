<html> 
<head> 
    <title>Delete User</title> 
</head> 
<body> 
 
<cfquery name="DeleteUser" datasource="userSource"> 
    DELETE FROM UserTable
    WHERE id = #id# 
</cfquery> 
 
<p>Succesfully deleted!<br>
	<a href="home.cfm">Return home</a>
</p>
 
</body> 
</html>