<html>
<%@ page import="java.sql.*" %>
<%
Connection cn=null;
PreparedStatement psmt=null;
Statement smt=null;
ResultSet rs=null;
String V_id=null,V_name=null,V_type=null,V_price=null;
%>
<body style="background-color: coral;">
	<%
	try{
	V_id=request.getParameter("V_id");
	V_name=request.getParameter("V_name");
	V_type=request.getParameter("V_type");
	V_price=request.getParameter("V_price");
		Class.forName("com.mysql.jdbc.Driver"); 
		 cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Vehicleinfo","root","root");
		 smt=cn.createStatement();
		 psmt=cn.prepareStatement("delete from Vehicle where V_id="+V_id);
		psmt.execute();
        
        smt=cn.createStatement();
		rs=smt.executeQuery("select *from vehicle");
		%>
<table align="center" style="padding-top: 50px;">
			<tr>
				<td>V_id</td>
				<td>V_name</td>
				<td>V_type</td>
				<td>V_price</td>
			</tr>
			<%
			while(rs.next())
			{
				%>
				<tr>
					<td><%out.print(rs.getString("V_id"));%></td>
					<td><%out.print(rs.getString("V_name"));%></td>
					<td><%out.print(rs.getString("V_type"));%></td>
					<td><%out.print(rs.getString("V_price"));%></td>
				</tr>
			<%}
			%></table>
			<%
		cn.close();
}
catch(Exception e)
			{
				out.println(e);
			}
%>
</body>
</html>