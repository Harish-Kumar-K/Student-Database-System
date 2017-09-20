
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%     
        response.setContentType("text/html");
        String a=request.getParameter("name");
        String b=request.getParameter("gender");
        String c=request.getParameter("address1");
        String d=request.getParameter("address2");
        String l=request.getParameter("address3");
        String e=request.getParameter("city");
        int f=Integer.parseInt(request.getParameter("pin"));
        int g=Integer.parseInt(request.getParameter("mobileno"));
        String h=request.getParameter("email");
        int j=Integer.parseInt(request.getParameter("class"));   
        String k=request.getParameter("section");
        
        try{int z=0;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","tiger");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT NVL(MAX(ROLLNO),0) FROM STUDENTMASTER");
        rs.next();
        z=Integer.parseInt(rs.getString(1));
        ++z;
        st.executeUpdate("INSERT INTO STUDENTMASTER(ROLLNO,NAME,GENDER,ADDRESS1,ADDRESS2,ADDRESS3,"
                + "CITY,PIN,MOBILENO,EMAIL,SECTION,STUDENT_CLASS,ENROLLMENTDATE) "
                + "VALUES("+z+",'"+a+"','"+b+"','"+c+"','"+d+"','"+l+"','"+e+"',"+f+","+g+",'"+h+"','"+k+"',"+j+",sysdate)");
        }
        catch(ClassNotFoundException cnfe){ 
        out.println(cnfe.toString());
        }
        catch(SQLException s){
        out.println(s.toString());
        }
%>
<html>
    <head>
        <title>WELCOME</title> 
        <script type="text/javascript">
            function validation()
            {
                var a=document.getElementById("name").value;
                var c=document.getElementById("pin").value;
                var m=document.getElementById("mobileno").value;
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
                if(m==""||m==null)
                {
                    alert("Mobile no. field is mandatory");
                    return false;
                }
                if(m.length>=11)
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
        Cookie[] z=request.getCookies();
        %>
        <table align="right">
            <tr><td><%=z[1].getValue()%></td><td><form action="test1.html"><input type="submit" value="Logout"></form></td></tr>
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
                <tr><td>Pin:</td><td><input type="number" name="pin" id="pin"></td><td></td></tr>
                <tr><td>Mobile Number:</td><td><input type="number" name="mobileno" id="mobileno"></td><td></td></tr>
                <tr><td>Email:</td><td><input type="text" name="email" id="email"></td><td></td></tr>
                <tr><td>Class:</td><td><input type="number" name="class" id="class"></td><td></td></tr>
                <tr><td>Section:</td><td><input type="text" name="section" id="section"></td><td></td></tr>
                <tr><td></td><td align="center"><input type="submit" value="Register" onClick="return validation() "></td><td></td></tr>
            </table>
        </form>
      
  <table align="center">
           <tr><td><h1>Registered successfully</h1></td></tr>
           <tr><td align="center"><form action="login1.jsp" method="post"><input type="submit" value="New User"></td><tr>
       </table>
    </body>
</html>

