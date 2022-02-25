<%@page import="java.sql.*"%>
<%
    String sid;
    Statement st=null;
    PreparedStatement ps = null;
    sid=request.getParameter("studentid");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Student_Details","root","");
        st=con.createStatement();
        String quary="delete from studentInfo where studentId="+sid;
        ps=con.prepareStatement(quary);
        ps.execute();
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>