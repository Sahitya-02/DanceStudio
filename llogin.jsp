<%@page import="java.sql.*" %>
<%
  String lmail=request.getParameter("lmail");
  String lpswd=request.getParameter("lpswd");
  try
  {
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver class loaded");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
    PreparedStatement psmt=con.prepareStatement("select lmail,lpswd from learner");
    ResultSet rs=psmt.executeQuery();
    session=request.getSession();
    int f=0;
    while(rs.next()) {
    if(rs.getString("lmail").equals(lmail) &&rs.getString("lpswd").equals(lpswd)) {
    f=1;
    response.sendRedirect("learner.html");
    session.setAttribute("lmail", lmail);
    }
    }
    if(f==0)
    {
      %>
      <h1 align='center'>Invalid credentials</h1>;
      <%
      RequestDispatcher rd=request.getRequestDispatcher("llogin.html");
      rd.include(request, response);
      

    }
  }
    catch(Exception e)
    {
      System.out.println(e);
    }


%>