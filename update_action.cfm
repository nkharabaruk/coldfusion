<html> 
<head> 
    <title>Update User</title> 
</head> 
<body> 
 
<cfquery name="UpdateUser" datasource="userSource"> 
    UPDATE UserTable 
    SET FirstName = '#Form.Firstname#', 
        LastName = '#Form.LastName#', 
        age = '#Form.age#', 
        email = '#Form.email#',
		password = '#Form.password#'
    WHERE id = #Form.id# 
</cfquery> 
 
<h1>User Updated</h1> 
<cfoutput> 
	You have updated the information for <span style="color:red">#Form.FirstName# #Form.LastName#</span> in the user database. 
</cfoutput> 

<p><a href="update.cfm">Return to update page</a></p>
 
</body> 
</html>