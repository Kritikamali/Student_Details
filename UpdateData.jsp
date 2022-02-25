<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("studentId");
String studentName=request.getParameter("studentName");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String sclass=request.getParameter("class");

if(id != null)
{
    Connection con = null;
    PreparedStatement ps = null;

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Student_Details","root","");
        String sql="Update studentInfo set studentId=?,studentName=?,dob=?,gender=?,class=? where studentId="+id;
        ps = con.prepareStatement(sql);
        ps.setString(1,id);
        ps.setString(2, studentName);
        ps.setString(3, dob);
        ps.setString(4, gender);
        ps.setString(5, sclass);
        int i = ps.executeUpdate();
        if(i > 0)
        {
            out.print("Student id "+id+" Record Updated Successfully");
        }
        else
        {
            out.print("There is a problem in updating Record.");
        }
    }
    catch(SQLException sql)
    {
        request.setAttribute("error", sql);
        out.println(sql);
    }
}
%>
