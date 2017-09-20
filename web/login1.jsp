<%-- 
    Document   : login1
    Created on : Jun 9, 2017, 1:55:37 PM
    Author     : 9000035-TR13
--%>

<%-- 
    Document   : login.jsp
    Created on : Jun 9, 2017, 10:37:46 AM
    Author     : 9000035-TR13
--%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>WELCOME</title>
        <script type="text/javascript">
            function validation()
            {
                var a=document.getElementById("name").value;
                var c=document.getElementById("pin").value;
                var d=document.getElementById("mobileno").value;
                var e=document.getElementById("class").value;
                var f=document.getElementById("city").value;
                var b=document.getElementById("address1").value;
                if(a==""||a==null)
                {
                    alert("Name field is mandatory");
                    return false;
                }
                if(b==""||b==null)
                {
                    alert("Address1 field is mandatory");
                    return false;
                }
                if(f==""||f==null)
                {
                    alert("City field is mandatory");
                    return false;
                }
                if(c==""||c==null)
                {
                    alert("Pin Code field is mandatory");
                    return false;
                }
                if(c.length>=7)
                {    alert("Enter correct PIN code");
                    return false;
                }
                if(d==""||d==null)
                {
                    alert("Mobile no. field is mandatory");
                    return false;
                }
                if(d.length>=11)
                {    alert("Enter correct Mobile Number");
                    return false;
                }
                if(e>=11)
                {    alert("Enter correct class");
                    return false;
                }
                if(e==""||e==null)
                {
                    alert("Class field is mandatory");
                    return false;
                }
              
                return true;
            }
        </script>
    </head>
    <body background="Images/blue.jpg" text="white">
        <table align="center">
      <tr><td><img src="Images/logo.gif" alt="Mountain View" style="width:100px;height:100px;"></td><td><h1>OAKLEY INTERNATIONAL SCHOOL</h1></td></tr>
       </table>
        <%
        Cookie[] d=request.getCookies();
        %>
        <table align="right">
            <tr><td><%=d[1].getValue()%></td><td><form action="test1.html"><input type="submit" value="Logout"></form></td></tr>
            </table>
            <br><br>
        <hr> 
        <table>    
            <tr><td><form action="login.jsp" method="post"><input type="submit" value="Register" onclick="return validation()"></form></td>
            <td><form action="marksupdate.jsp" method="post"><input type="submit" value="Marks Update"></form></td>
            <td><form action="display.jsp" method="post"><input type="submit" value="Result"></form></td>
            <td></td>
        </tr>
        </table>
        <hr>
 <form action="database.jsp" method="post" onSubmit="return validation()">
            <br><br>
            <table align="center"><tr><td><h1>STUDENT REGISTRATION FORM</h1></td></tr></table><br><br>
            <table align="center">
                <tr><td>Name:</td><td><input type="text" name="name" id="name"></td><td></td></tr>
                <tr><td>Gender:</td><td><input type="radio" name="gender" id="gender" value="M" checked >Male
                        <input type="radio" name="gender" id="gender" value="F">Female</td><td></td></tr>
                <tr><td>Address1:</td><td><input type="text" name="address1" id="address1"></td><td></td></tr>
                <tr><td>Address2:</td><td><input type="text" name="address2" id="address2"></td><td></td></tr>
                <tr><td>Address3:</td><td><input type="text" name="address3" id="address3"></td><td></td></tr>
                <tr><td>City:</td><td><input type="text" name="city" id="city"></td><td></td></tr>
                <tr><td>Pin:<td><input type="number" name="pin" id="pin"></td><td></td></tr>
                <tr><td>Mobile Number:</td><td><input type="number" name="mobileno" id="mobileno"></td><td></td></tr>
                <tr><td>Email:</td><td><input type="text" name="email" id="email"></td><td></td></tr>
                <tr><td>Class:</td><td><input type="number" name="class" id="class"></td><td></td></tr>
                <tr><td>Section:</td><td><input type="text" name="section" id="section"></td><td></td></tr>
                <tr><td></td><td align="center"><input type="submit" value="Register" onClick="return validation()"></td><td></td></tr>
            </table>
        </form>
      
    </body>
</html>

