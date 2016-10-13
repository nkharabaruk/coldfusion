<html>
<head>
    <title>Registration</title>
</head>
<body>

<cfif NOT isDefined("Form.submitted")>
    <h2>Registration Form</h2>
    <form action="form_validator.cfc?method=validate&firstName=Form.firstName&lastName=Form.lastName&email=Form.email&password=Form.password&password2=Form.password2" method="post">
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
                <input type="password" name="password" size="10" required>
            </td>
        </tr>
        <tr>
            <td>Repeat Password:</td>
            <td>
                <input type="password" name="password2" size="10" required>
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
</cfif>

</body>
</html>