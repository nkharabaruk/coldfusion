<html> 
<head> 
<title>All Users</title> 
</head> 
<body> 
<h1>All Users</h1> 

<cfquery name="UserList" datasource="userSource"> 
    SELECT id, firstName, lastName, age, email, password 
    FROM UserTable 
</cfquery> 


<cfoutput>
	<table>
	<form action="delete_action.cfm" method="Post"> 
		<input type="Hidden" name="id" value="#UserList.id#"><br> 
		<thead>
			<th width="100" align="left"><b>ID</b></th>
			<th width="150" align="left"><b>First Name</b></th>
			<th width="150" align="left"><b>Last Name</b></th>
			<th width="100" align="left"><b>Age</b></th>
			<th width="200" align="left"><b>E-mail</b></th>
			<th width="100" align="left"><b>Password</b></th>
			<th width="100" align="left"><b>Edit</b></th>
			<th width="100" align="left"><b>Delete</b></th>
		</thead>
		<tbody>
		<cfloop query="UserList">
			<tr>
				<td>#id#</td>
				<td>#firstName#</td>
				<td>#lastName#</td>
				<td>#age#</td>
				<td>#email#</td>
				<td>#password#</td>
				<td><a href="update.cfm">Edit</a></td>
				<td><input type="Submit" value="Delete"></td>
			</tr>
		</cfloop>
		</tbody>
		</form>
	</table>
</cfoutput>
<br />

<p><a href="cabinet.cfm">Go to cabinet</a></p>
<p><a href="registration.cfm">Register new user</a></p>

</body> 
</html>