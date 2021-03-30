<%@page import="java.sql.*" %>
<%
  String uname=request.getParameter("uname");
  String apswd=request.getParameter("apswd");
  try
  {
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver class loaded");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
    PreparedStatement psmt=con.prepareStatement("select * from admin");
    ResultSet rs=psmt.executeQuery();
    session=request.getSession();
    int f=0;
    while(rs.next()) {
    if(rs.getString("uname").equals(uname) &&rs.getString("apswd").equals(apswd)) {
    f=1;
    response.sendRedirect("admin.html");
    session.setAttribute("uname", uname);
    }
    }
    if(f==0)
    {
      %>
      <h1 align='center'>Invalid credentials</h1>;
      <%
      RequestDispatcher rd=request.getRequestDispatcher("adminlogin.html");
      rd.include(request, response);
      

    }
  }
    catch(Exception e)
    {
      System.out.println(e);
    }


%>