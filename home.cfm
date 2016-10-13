<html>
<head>
    <title>All Users</title>
</head>
<body>
<h1>All Users</h1>

<cfobject component="test.user_operations" name="user_operations">
<cfif isDefined('action')>
    <cfif url.action eq 'delete'>
            <cfinvoke component="#user_operations#" method="deleteUser"></cfinvoke>
    </cfif>
</cfif>

<cfinvoke component="#user_operations#" method="selectUser" returnvariable="select"></cfinvoke>

<cfoutput>
    <table>
        <form action="user_operations.cfc?method=deleteUser" method="post">
            <input type="Hidden" name="id" value="#select.id#"><br>
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
            <cfloop query="select">
                <cfset userId = "#id#">
                <tr>
                    <td>#id#</td>
                    <td>#firstName#</td>
                    <td>#lastName#</td>
                    <td>#age#</td>
                    <td>#email#</td>
                    <td>#password#</td>
                    <td><a href="update.cfm?id=#id#">Edit</a></td>
                    <td><a href="home.cfm?action=delete&id=#id#"
                        onClick="return confirm('Are you sure to delete this record?')">Delete</a>
                    </td>
                </tr>
            </cfloop>
        </tbody>
        </form>
    </table>
    <br>

    <a href="home.cfm?action=delete"
       onClick="return confirm('Are you sure to delete ALL records?');">
        <button>Delete all records</button>
    </a>

    <p><a href="cabinet.cfm">Go to cabinet</a></p>
    <p><a href="registration.cfm">Register new user</a></p>
</cfoutput>

</body>
</html>