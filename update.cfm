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

<cfoutput query="UserList"> 
<table> 
<form action="update_action.cfm" method="Post"> 
    <input type="Hidden" name="id" value="#id#"><br> 
<tr> 
    <td>First Name:</td>  
    <td><input type="text" name="FirstName" value="#FirstName#"></td> 
</tr> 
<tr> 
    <td>Last Name:</td> 
    <td><input type="text" name="LastName" value="#LastName#"></td> 
</tr> 
<tr> 
    <td>Age:</td> 
    <td><input type="text" name="Age" value="#Age#"></td> 
</tr> 
<tr> 
    <td>Email:</td> 
    <td><input type="text" name="Email" value="#Email#"></td> 
</tr>  
<tr> 
    <td>Password:</td> 
    <td><input type="text" name="Password" value="#Password#"></td> 
</tr> 
<tr> 
    <td>&nbsp;</td> 
    <td><input type="Submit" value="Update Information"></td> 
</tr> 
</form> 
</table> 
</cfoutput> 

<p><a href="home.cfm">Return home</a></p>

</body> 
</html>