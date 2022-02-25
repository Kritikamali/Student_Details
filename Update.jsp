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
            <form action="UpdateData.jsp">
                <span>Student ID      </span><input type="text" value="<%=rs.getString("studentId") %>"id="studentid" name="studentId" size="20" />    
                <br><br>
                <span>Student Name    </span><input type="text" value="<%=rs.getString("studentName") %>"id="studentid" name="studentName" size="20" />    
                <br><br>
                <span>Student Dob     </span><input type="text" value="<%=rs.getString("dob") %>"id="studentid" name="dob" size="20" />    
                <br><br>
                <span>Student gender  </span><input type="text" value="<%=rs.getString("gender") %>"id="studentid" name="gender" size="20" />    
                <br><br>
                <span>Student Class   </span><input type="text" value="<%=rs.getString("class") %>"id="studentid" name="class" size="20" />    
                <br><br>
                <button>Update</button>
            </form>
        </center> 
<%
    }
    con.close();
    } 
    catch (Exception e) {
        e.printStackTrace();
    }
%>