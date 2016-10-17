<html>
<head>
    <title>Sending a simple e-mail</title>
</head>
<body>
<h1>Remind password</h1>

<cfif isDefined('Form.email')>
    <cfif Form.email is not ''>
        <cfinvoke component="#application.user_operations#" method="send_email"></cfinvoke>
    </cfif>
</cfif>

<form action="send_email.cfm" method="POST">
<table>
    <tr>
        <td><b>Write your e-mail:</b></td>
    </tr>
    <tr>
        <td><input type="text" name="email"></td>
    </tr>
    <tr style="height: 40px">
        <td><input type="submit" value="Send password"></td>
    </tr>
</table>
</form>

</body>
</html>