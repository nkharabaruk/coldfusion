<html>
<head>
<title>Registration</title>
</head>
<body>

<cfif NOT isDefined("FORM.submitted")>

	<h2>Registration Form</h2>
	<cfoutput><form method="post" action="#CGI.SCRIPT_NAME#"></cfoutput>
	<input type="hidden" name="submitted" value="true">
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

	<cfif (FORM.email EQ '') OR (FORM.firstName EQ '') OR (FORM.lastName EQ '') OR (FORM.password EQ '')>
		<p>Please, fill all fields.</p>
	<cfelse>
	
	<cfif FORM.password EQ FORM.password2>
		<cfquery name="emailcheck" datasource="userSource">
			SELECT *
			FROM UserTable
			WHERE email='#FORM.email#'
		</cfquery>
		<cfif emailcheck.RecordCount EQ 0>
			<cfquery datasource="userSource">
				INSERT INTO UserTable(firstname, lastname, age, email, password)
				VALUES ('#FORM.firstname#', '#FORM.lastname#', '#FORM.age#', '#FORM.email#', '#FORM.password#')
			</cfquery>
			
			<cfquery name="emailcheck2" datasource="userSource">
				SELECT *
				FROM UserTable
				WHERE email='#FORM.email#'
			</cfquery>
			<cfif emailcheck2.RecordCount NEQ 1>
				Registration Failed
			<cfelse>
				You have registered successfully.
				<p><a href="registration.cfm">Home Page</a></p>
			</cfif>
		
		<cfelse>
			<p>It appears you have already registered.</p>
		</cfif>
	<cfelse>
		<p class="errors"><b>Your passwords do not match. Please 
		<a href="registration.cfm">try again</a>.</p>
	</cfif>
	
	</cfif>
</cfif>

</body>
</html>