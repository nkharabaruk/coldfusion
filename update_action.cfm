<html> 
<head> 
    <title>Update User</title> 
</head> 
<body> 
 
<cfquery name="UpdateUser" datasource="userSource"> 
    UPDATE UserTable 
    SET FirstName = <cfqueryparam  
                        value="#Form.Firstname#"  
                        CFSQLType="CF_SQL_VARCHAR">,
					LastName = <cfqueryparam  
						value="#Form.lastname#"  
						CFSQLType="CF_SQL_VARCHAR">, 
					age = <cfqueryparam  
						value="#Form.age#"  
						CFSQLType="CF_SQL_INTEGER">,
					email = <cfqueryparam  
						value="#Form.email#"  
						CFSQLType="CF_SQL_VARCHAR">,
					password = <cfqueryparam  
						value="#Form.password#"  
						CFSQLType="CF_SQL_VARCHAR">
    WHERE id = #Form.id# 
</cfquery> 
 
<h1>User Updated</h1> 
<cfoutput> 
	You have updated the information for <span style="color:red">#Form.FirstName# #Form.LastName#</span> in the user database. 
</cfoutput> 

<p><a href="update.cfm">Return to update page</a></p>
<p><a href="home.cfm">Return home</a></p>
 
</body> 
</html>