<html>
<%@ page import="java.sql.*"%>
<%!
Connection cn=null;
PreparedStatement psmt=null;
Statement smt=null;
String V_id=null,V_name=null,V_type=null,V_price=null;
ResultSet rs=null;
%>
<body style="background-color: coral; align-content: center; text-align: center; ">
    <%
    try{
        V_id=request.getParameter("V_id");
        V_name=request.getParameter("V_name");
        V_type=request.getParameter("V_type");
        V_price=request.getParameter("V_price");

        Class.forName("com.mysql.jdbc.Driver");
        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Vehicleinfo","root","root");
        psmt=cn.prepareStatement("insert into vehicle values(?,?,?,?)");
        psmt.setString(1,V_id);
        psmt.setString(2,V_name);
        psmt.setString(3,V_type);
        psmt.setString(4,V_price);
        psmt.execute();
        smt=cn.createStatement();
        rs=smt.executeQuery("select*from vehicle");
        %>
        <h1 style="font-family: Forte; font-size: 50px;">Vehicle Information System</h1>
        <table border="1px" align="center">
            <tr>
                <th>V_id  </th>
                <th>V_name  </th>
                <th>V_type  </th>
                <th>V_price  </th>
            </tr>
            <% while(rs.next()){%>
                <tr>
                <td><%out.print(rs.getString("V_id"));%></td>
                <td><%out.print(rs.getString("V_name"));%></td>
                <td><%out.print(rs.getString("V_type"));%></td>
                <td><%out.print(rs.getString("V_price"));%></td>
                <td><a href="delete.jsp?V_id=<%=rs.getString("V_id")%>"><button type="button" Class="delete" style="color: black;">Delete</button></a></td>
                </tr>
            <%}%>
        </table>
        <%
        cn.close();
    }
    catch(Exception e){
        out.print(e);
    }%>
    </body>
    </html>