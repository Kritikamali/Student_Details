<%@page import="java.sql.*"%>
<%
String id = request.getParameter("studentid");
Statement st = null;
ResultSet rs = null;    
try{
    Class.forName("com.mysql.jdbc.Driver");    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Student_Details","root","");
    st=con.createStatement();
    String sql ="select * from studentInfo where studentId = "+id;
    rs = st.executeQuery(sql);
    while(rs.next())   
    {
%>
        <center>
            <span>Student ID     :   </span><%=rs.getString("studentId") %>   
            <br><br>
            <span>Student Name   :   </span><%=rs.getString("studentName") %>
            <br><br>
            <span>Student Dob    :   </span><%=rs.getString("dob") %>
            <br><br>
            <span>Student gender :   </span><%=rs.getString("gender") %>
            <br><br>
            <span>Student Class  :   </span><%=rs.getString("class") %> 
        </center> 
<%
    }
    con.close();
    } 
    catch (Exception e) {
        e.printStackTrace();
    }
%>