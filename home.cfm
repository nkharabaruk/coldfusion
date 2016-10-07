<html> 
<head> 
<title>All Users</title> 
</head> 
<body> 
<h1>All Users</h1> 

<cfquery name="UserList" datasource="userSource"> 
    SELECT id, firstName, lastName, age, email 
    FROM UserTable 
</cfquery> 

<cftable query = "UserList" startRow = "1" htmlTable="true" colHeaders="true"> 
<form action="update_action.cfm" method="Post"> 
	<cfcol header = "<b>ID</b>" 
		width = 5 
		text= "#id#"> 
		
    <cfcol header = "<b>Fist name</b>"     
        align = "Left" 
        width = 10 
        text= "#firstName#"> 
		
	<cfcol header = "<b>Last name</b>"     
        align = "Left" 
        width = 10 
        text= "#lastName#"> 
 
    <cfcol header = "<b>Age</b>" 
        align = "Left" 
        width = 5 
        text= "#age#"> 
		
	<cfcol header = "<b>E-mail</b>" 
        align = "Center" 
        width = 15 
        text= "#email#"> 
		
	<cfcol header = "<b>Edit</b>" 
        align = "Center" 
        width = 5 
        text="<a href=""update.cfm"">Edit</a>"> 
		
	<cfcol header = "<b>Delete</b>" 
        align = "Center" 
        width = 5 
        text="<a href=""delete_action.cfm"">Delete</a>"> 
</table> 
</cftable> 

<p><a href="cabinet.cfm">Go to cabinet</a></p>
<p><a href="registration.cfm">Register new user</a></p>

</body> 
</html>