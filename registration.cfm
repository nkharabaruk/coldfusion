<html>
<head>
<title>Registration</title>
</head>
<body>

<cfif NOT isDefined("Form.submitted")>
	<h2>Registration Form</h2>
	<form action="user_operations.cfc?method=insertUser" method="post""> 
		<input type="hidden" name="id" value="#id#"><br>
		<table>
			<tr>
				<td>Email:</td>
				<td>
					<input type="text" name="email" size="30" 
					pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" required>
				</td>
			</tr>
			<tr>
				<td>First name:</td>
				<td>
					<input type="text" name="firstName" size="10" required>
				</td>
			</tr>
			<tr>
				<td>Last name:</td>
				<td>
					<input type="text" name="lastName" size="10" required>
				</td>
			</tr>
			<tr>
				<td>Age:</td>
				<td>
					<input type="number" size="6" name="age" min="18" max="99" value="21"><br>
				</td>
			</tr>
			<tr>
			<tr>
				<td>Password:</td>
				<td>
					<input type="password" name="password" size="10">
				</td>
			</tr>
			<tr>
				<td>Repeat Password:</td>
				<td>
					<input type="password" name="password2" size="10">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="reset" value="Reset">
					<input type="submit" value="Register">
				</td>
			</tr>
		</table>
	</form>
<cfelse>

	<cfif (Form.email EQ '') OR (Form.firstName EQ '') OR (Form.lastName EQ '') OR (Form.password EQ '')>
		<p>Please, fill all fields.</p>
	<cfelse>
	
	<cfif Form.password EQ Form.password2>
		<cfquery name="emailcheck" datasource="userSource">
			SELECT *
			FROM UserTable
			WHERE email=<cfqueryparam  
                        value="#Form.email#"  
                        CFSQLType="CF_SQL_VARCHAR">
		</cfquery>
		<cfif emailcheck.RecordCount EQ 0>
			<cfobject component = "test.user_operations" name = "user_operations">
			<cfinvoke component = "#user_operations#" method="insertUser"></cfinvoke>
			
			<cfquery name="emailcheck2" datasource="userSource">
				SELECT *
				FROM UserTable
				WHERE email=<cfqueryparam  
                            value="#Form.email#"  
                            CFSQLType="CF_SQL_VARCHAR">
			</cfquery>
			<cfif emailcheck2.RecordCount NEQ 1>
				Registration Failed
				<p><a href="home.cfm">Home Page</a></p>
			<cfelse>
				You have registered successfully.
				<p><a href="home.cfm">Home Page</a></p>
			</cfif>
		
		<cfelse>
			<p>It appears you have already registered.</p>
			<p><a href="home.cfm">Home Page</a></p>
		</cfif>
	<cfelse>
		<p class="errors"><b>Your passwords do not match. Please 
		<a href="registration.cfm">try again</a>.</p>
	</cfif>
	
	</cfif>
</cfif>

</body>
</html>