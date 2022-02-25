<%@page import="java.sql.*"%>
<%
    String sid,sname,dob,gender,studentclass;
    Statement st=null;
    ResultSet rs=null;
    PreparedStatement ps = null;
    sid=request.getParameter("studentid");
    sname=request.getParameter("studentname");
    dob=request.getParameter("dob");
    gender=request.getParameter("gender");
    studentclass=request.getParameter("class");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Student_Details","root","");
        /*if(sid.trim().equals("") || sname.trim().equals("")||dob.trim().equals("")||gender.trim().equals("")||studentclass.trim().equals(""))
        {
            out.println("Fields Should Not Empty");
        }*/
        st=con.createStatement();
        String quary1="insert into studentInfo(studentId,studentname,dob,gender,class)values(?,?,?,?,?)";
        ps=con.prepareStatement(quary1);
        ps.setString(1, sid); 
        ps.setString(2,sname);
        ps.setString(3, dob);
        ps.setString(4, gender);
        ps.setString(5, studentclass);
        ps.executeUpdate();
    }
    catch(Exception e)
    {
        out.println(e);
    }
    
%>

