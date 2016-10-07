<cfif IsDefined("form.gridEntered") is True>
	<cfgridupdate grid="user_grid" 
		datasource="userSource" 
		tablename="UserTable"
		keyOnly = "Yes"> 
</cfif>

<cfquery name="UserList" datasource="userSource"> 
    SELECT id, firstName, lastName, age, email 
    FROM UserTable 
</cfquery> 

<html> 
<head> 
<title>Cabinet</title> 
</head> 
<body> 
<h1>Cabinet</h1>

<cfform name="GridForm" method="post"
	action="cabinet.cfm"> 
 
    <cfgrid name="user_grid"
		format="html"	
        height=800 
        width=800 
        selectmode="edit" 
        query="UserList" 
        insert="Yes" 
        delete="Yes"> 
         
        <cfgridcolumn name="ID" 
            header="ID" 
            width=5
            headeralign="center" 
            headerbold="Yes" 
            select="No"> 
 
		<cfgridcolumn name="FirstName" 
            header="First Name"
            width=100 
            headeralign="center" 
            headerbold="Yes"> 
			
        <cfgridcolumn name="LastName" 
            header="Last Name" 
            width=100 
            headeralign="center" 
            headerbold="Yes">

		<cfgridcolumn name="Age" 
            header="Age" 
            width=100 
            headeralign="center" 
            headerbold="Yes"> 
 
        <cfgridcolumn name="Email" 
            header="Email" 
            width=100 
            headeralign="center" 
            headerbold="Yes">
 
    </cfgrid> 
    <br> 
    <cfinput name="submitit" type="Submit" value="Submit"> 
</cfform>

</body> 
</html>
	
