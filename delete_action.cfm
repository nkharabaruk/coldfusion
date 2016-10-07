<html> 
<head> 
    <title>Delete User</title> 
</head> 
<body> 
 
<cfquery name="UpdateUser" datasource="userSource"> 
    DELETE FROM UserTable
    WHERE id = #Form.id# 
</cfquery> 
 
<p>Succesfully deleted!<br>
	<a href="home.cfm">Return home</a>
</p>
 
</body> 
</html>