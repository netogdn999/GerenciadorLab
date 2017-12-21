<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Usuario"%>
<%@ page import="model.ErroLoginException"%>
<%@ page import="model.campoInvalidoException"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>logar</title>
</head>
<body>
<jsp:useBean id="userB" class="control.UsuarioBean" scope="session"/>
<jsp:setProperty name="userB" property="usuario" param="usuario"/>
<jsp:setProperty name="userB" property="senha" param="senha"/>
<%
	try{
		Usuario user=new Usuario(userB);
		session.setAttribute("usuarioB", user.logar());
		response.sendRedirect("../index.jsp");
	}catch(SQLException|ErroLoginException|campoInvalidoException e){%>
		<div class="alerta">
			<h1>
				<%out.println(e.getMessage());%>
			</h1>
			<a href="../login.jsp">Retornar a página de login</a>
		</div>
	<%}
%>
</body>
</html>