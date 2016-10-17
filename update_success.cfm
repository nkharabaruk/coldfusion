<html>
<head>
    <title>All Users</title>
</head>
<body>
<h1>User Updated</h1>

<cfinvoke component="#application.user_operations#" method="selectUserById" returnvariable="select"></cfinvoke>

<cfoutput>
    You have updated the information for
    <span style="color:red">#select.firstName# #select.lastName#</span>.
    <p><a href="update.cfm?id=#id#">Return to update page</a></p>
    <p><a href="home.cfm">Return home</a></p>
</cfoutput>

</body>
</html>