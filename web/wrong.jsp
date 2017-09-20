<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
<title>LOGIN</title>
<script type="text/javascript"> 
function validate()
{
    var x=document.getElementById("UN").value;
    var y=document.getElementById("PW").value;
    if(x==null||x=="")
    {
        alert("Enter Username");
        return false;
    }
    else if(y==null||y=="")
    {
        alert("Enter Password");
        return false;
    }
    else 
    {
        return true;
    }
}
</script>
</head>
<body background="Images/blue.jpg" text="white"><br><br><br><br><br><br><br><br><br> 
    <div align="center"><img src="Images/key.png" alt="login" height="200" width="200" ></div> 
<form action="validate.jsp" method="post" onSubmit="return(validate())">
    <br>
    <br><br>
<table align="center">
<tr><td>Username:</td><td><input type="text" id="UN" name="UN"></td><td></td></tr>
<tr><td>Password:</td><td><input type="password" id="PW" name="PW"></td><td></td></tr>
<tr><td></td><td align="center"><input type="submit" value="Login" onClick="return validate()"></td><td></td></tr>
</table>
</form>
    <br><br><br>
    <div align="center"><h1>Invalid Username/Password</h1></div>
</body>
</html>
