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
	<form action="crud_operations.cfc" method="post"> 
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
				<td><a href="update.cfm?id=#id#">Edit</a></td>
				<td><a href="delete_action.cfm?id=#id#" onClick="return confirm('Are You Sure You Want To Delete This Record?')">Delete</a></td>
			</tr>
		</cfloop>
		</tbody>
		</form>
	</table>
</cfoutput>
<br>

<a href="delete_action.cfm" onClick="return confirm('Are You Sure You Want To Delete ALL Records?');"><button>Delete All Records</button></a>

<p><a href="cabinet.cfm">Go to cabinet</a></p>
<p><a href="registration.cfm">Register new user</a></p>

</body> 
</html>