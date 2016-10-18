<html>
<head>
    <title>Log In</title>
</head>
<body>
<h1>Log in to website</h1>

    <form action="user_operations.cfc?method=log_in" method="POST">
        <table>
            <tr>
                <td>Your email:</td>
            </tr>
            <tr>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>Your password:</td>
            </tr>
            <tr>
                <td><input type="password" name="password"></td>
            </tr>
            <tr style="height: 40px">
                <td><input type="submit" value="Log In"></td>
            </tr>
            <tr>
                <td>Don`t have account? <a href="registration.cfm">Register</a>.</td>
            </tr>
        </table>
    </form>

</body>
</html>