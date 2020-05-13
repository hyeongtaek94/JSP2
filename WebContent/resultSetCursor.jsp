<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from student";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/haksa");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs = pstmt.executeQuery();
		
		rs.next();
		out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3>");
		
		rs.last();
		out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3>");
		
		rs.previous();
		out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3>");
		
		rs.first();
		out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3>");

		rs.absolute(15);
		out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3>");
		
		rs.beforeFirst();
		
		rs.next();
		out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3>");

	}catch(Exception e){
		e.printStackTrace();
	}
%>	
</body>
</html>