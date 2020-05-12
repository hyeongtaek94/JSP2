<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection" %>
<%@page import="members.dao.MembersDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	MembersDAO dao = new MembersDAO();
	Connection conn = dao.getConn();
	Statement stmt = null;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	try {
		stmt = conn.createStatement();
		String sql = "insert into members values ('java', 'java', '김자바', 20, '남성', 'java@test.com')";
		stmt.executeUpdate(sql);
		out.println("<h3>유저 생성 성공</h3>");
	} catch(Exception e){
		out.println("<h3>유저 생성 실패</h3>");
		e.printStackTrace();
	} finally{
		try{
		if(stmt != null) stmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		dao.MembersClose();
	}
%>
</body>
</html>