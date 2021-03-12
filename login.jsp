<%@page import="java.sql.*" %>
<%
  String mail=request.getParameter("lmail");
  String pswd=request.getParameter("lpswd");
  try
  {
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver class loaded");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
    PreparedStatement psmt=con.prepareStatement("select cmail,cpswd from choreo");
    ResultSet rs=psmt.executeQuery();
    session=request.getSession();
    int f=0;
    while(rs.next()) {
    if(rs.getString("cmail").equals(mail) &&rs.getString("cpswd").equals(pswd)) {
    f=1;
    response.sendRedirect("choreo.html");
    session.setAttribute("cmail", mail);
    }
    }
    if(f==0)
    {
      %>
      <h1 align='center'>Invalid credentials</h1>;
      <%
      RequestDispatcher rd=request.getRequestDispatcher("login.html");
      rd.include(request, response);
      

    }
  }
    catch(Exception e)
    {
      System.out.println(e);
    }


%>